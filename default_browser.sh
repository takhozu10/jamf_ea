#!/bin/bash

#Set user variable
loggedinuser=$(stat -f%Su /dev/console)

#Set default browser from plist file
default_browser=$(defaults read /Users/$loggedinuser/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist | grep -B 1 https |grep LSHandlerRoleAll | awk '{print $3}' | sed 's/"//g' | sed 's/;//g')

if [ $default_browser = "com.google.chrome" ]
then
    echo "<result>Google Chrome</result>"
elif [ $default_browser = "org.mozilla.firefox" ]
then
    echo "<result>Mozilla Firefox</result>"
elif [ $default_browser = "com.apple.safari" ]
then
    echo "<result>Apple Safari</result>"
else
    echo "<result>$default_browser</result>"
fi