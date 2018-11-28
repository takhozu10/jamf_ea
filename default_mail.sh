#!/bin/bash
#
# # #
# MIT License
#
# Copyrigth (c) 2018 Big Lots Stores, Inc.
#
#   Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
#   associated documentation files (the "Software"), to deal in the Software without restriction, including
#   without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#   copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
#   following conditions:
#
#   The above copyright notice and this permission notice shall be included in all copies or substantial
#   portions of the Software.
#
#   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
#   NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
#   IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
#   WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
#   SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
# # #

# # #
# JAMF Pro extension attribute to log the default mail client.
#
#
# Written by: Tak Hozumi : End User Support Engineer : Big Lots Stores, Inc.
#
# Created on: July 25, 2017
# Modified on:
# Version: 1.0.0
# # #

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
