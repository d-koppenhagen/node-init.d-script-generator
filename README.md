# node-init.d-script-generator
A shellscript which will create an init.d script for a nodejs application
* you need to install `forever`

## Setup
* just run `sudo ./createInitScript`
  * sudo permissions are necessary because the script will copy a file into your `/etc/init.d/` folder.
* follow the instructions

## How it works?
The script will create an temp folder and copies the `initscript` file to this folder.
After that it will replace the lines with parameters the input from script.
Finally it copies the modified file to your `/etc/init.d/` directory and runs `update-rc.d`.

## How to start the server?
If everything worked you can start you can:
* start the server:
  `sudo service YOURSERVICE start`
* stop the server:
  `sudo service YOURSERVICE stop`
* restart the server:
  `sudo service YOURSERVICE restart`
* status of the server:
  `sudo service YOURSERVICE status`
