#!/bin/bash
# this script will copy the copy the init.d-script to /etc/init.d
# after copying it will updated services
echo "Please provide a name for your init.d-Script:"
read SCRIPTNAME

# copy initscript
#cp "initscript" "/etc/init.d/$SCRIPTNAME"
if [ ! -d "temp" ]; then
    mkdir temp
fi

cp "initscript" "temp/$SCRIPTNAME"
 if [ ! -d "/var/run/" ]; then
     echo "Folder doesn't exist, created Folder: /var/log/"
     mkdir /var/run/
 fi
 if [ ! -d "/var/log/" ]; then
     echo "Folder doesn't exist, created Folder: /var/log/"
     mkdir /var/log/
 fi

# set description for init.d Script
echo "Please enter a description:"
read DESCRIPTION

# set pathes for init.d script
 echo "Please enter the path to your node application (e.g. /opt/something):"
 read APPPATH
 echo "Please enter the name of jour node startfile (e.g. server.js):"
 read APPFILE

 sed -i.bak s@SCRIPTNAME_HEAD@"$SCRIPTNAME"@g temp/$SCRIPTNAME
 sed -i.bak s@DESCRIPTION_HEAD@"$DESCRIPTION"@g temp/$SCRIPTNAME
 sed -i.bak s@NAME=.*@"NAME=\"$SCRIPTNAME\""@g temp/$SCRIPTNAME
 sed -i.bak s@APPLICATION_DIR=.*@"APPLICATION_DIR=\"$APPPATH\""@g temp/$SCRIPTNAME
 sed -i.bak s@APPLICATION_FILE=.*@"APPLICATION_FILE=\"$APPFILE\""@g temp/$SCRIPTNAME

 echo "copying $SCRIPTNAME to /etc/init.d folder"
 cp temp/$SCRIPTNAME /etc/init.d
 chmod +x /etc/init.d/$SCRIPTNAME
 update-rc.d $SCRIPTNAME defaults
 echo "finished!"
