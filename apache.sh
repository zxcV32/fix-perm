#!/bin/bash
# Run as root

# check permissions
if [ "$(whoami)" != "root" ]; then
        echo "Root privileges are required to run this, try running with sudo or with root user..."
        exit 2
fi

if [ "$1" == "" ]; then
  echo "Please specify a path."
fi


AP_ROOT=$1 # Apache2 root directory
AP_OWNER=www-data #  < -- Apachd2 owner
AP_GROUP=www-data # <-- Apache2 group

# reset to safe defaults
find ${AP_ROOT} -exec chown ${AP_OWNER}:${AP_GROUP} {} \;
find ${AP_ROOT} -type d -exec chmod 755 {} \;
find ${AP_ROOT} -type f -exec chmod 644 {} \;
