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
# JAMF Pro Extension Attribute to log the default browser.
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
