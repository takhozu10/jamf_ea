#!/bin/bash

#Set user variable
loggedinuser=$(stat -f%Su /dev/console)

#Set default mail from plist file
default_mail=$(defaults read /Users/$loggedinuser/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist | grep -B 1 mailto | grep LSHandlerRoleAll | awk '{print $3}' | sed 's/"//g' | sed 's/;//g')

if [ $default_mail = "com.apple.mail" ]
then
    echo "<result>Apple Mail</result>"
elif [ $default_mail = "com.microsoft.outlook" ]
then
    echo "<result>Microsoft Outlook</result>"
elif [ $default_mail = "com.ibm.notes" ]
then
    echo "<result>IBM Lotus Notes</result>"
elif [ $default_mail = "com.ibm.lotus.notes" ]
then
    echo "<result>IBM Lotus Notes</result>"
else
    echo "<result>$default_mail</result>"
fi