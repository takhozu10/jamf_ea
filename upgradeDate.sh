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
# This script is created to determine the upgrade date based on the iMac Model
# The formula used is to determine the last date that the specific model was sold. 4 years from that date is the upgrade date.
#
# Written by: Tak Hozumi : End User Support Engineer : Big Lots Stores, Inc.
#
# Created on:
# Modified on: 08/06/2018
# Version: 0.0.3
# # #

# Defining upgrade date for each model.
iMac13_2='09/23/2017'
iMac14_2='10/15/2018'
iMac15_1='10/12/2019'
iMac17_1='06/04/2021'
iMac18_2='Not Set'
iMac18_3='Not Set'
MacbookAir6_2='03/08/2019'
MacbookAir7_2='06/05/2021'
MacbookPro6_2='02/23/2015'
MacbookPro9_1='06/11/2017'
MacbookPro11_1='03/08/2019'
MacbookPro11_2='05/18/2019'
MacbookPro11_4='11/11/2020'
MacbookPro12_1='10/26/2020'
MacbookPro13_1='06/04/2021'
MacbookPro13_2='06/04/2021'
MacbookPro13_3='06/04/2021'
MacbookPro14_1='Not Set'
MacbookPro14_3='07/12/2022'
MacbookPro15_1='Not Set'
MacbookPro15_2='Not Set'

# Determine the Model identifier
modelIdent=`system_profiler SPHardwareDataType | grep "Model Identifier" | awk '{print $3}'`
echo $modelIdent

if [ $modelIdent = 'iMac13,2' ]
then
    echo "<result>$iMac13_2</result>"
elif [ $modelIdent = 'iMac14,2' ]
then
    echo "<result>$iMac14_2</result>"
elif [ $modelIdent = 'iMac15,1' ]
then
    echo "<result>$iMac15_1</result>"
elif [ $modelIdent = 'iMac17,1' ]
then
    echo "<result>$iMac17_1</result>"
elif [ $modelIdent = 'iMac18,2' ]
then
    echo "<result>$iMac18_2</result>"
elif [ $modelIdent = 'iMac18,3' ]
then
    echo "<result>$iMac18_3</result>"
elif [ $modelIdent = 'MacBookAir6,2' ]
then
    echo "<result>$MacbookAir6_2</result>"
elif [ $modelIdent = 'MacBookAir7,2' ]
then
    echo "<result>$MacbookAir7_2</result>"
elif [ $modelIdent = 'MacBookPro6,2' ]
then
    echo "<result>$MacbookPro6_2</result>"
elif [ $modelIdent = 'MacBookPro9,1' ]
then
    echo "<result>$MacbookPro9_1</result>"
elif [ $modelIdent = 'MacBookPro11,1' ]
then
    echo "<result>$MacbookPro11_1</result>"
elif [ $modelIdent = 'MacBookPro11,2' ]
then
    echo "<result>$MacbookPro11_2</result>"
elif [ $modelIdent = 'MacBookPro11,4' ]
then
    echo "<result>$MacbookPro11_4</result>"
elif [ $modelIdent = 'MacBookPro12,1' ]
then
    echo "<result>$MacbookPro12_1</result>"
elif [ $modelIdent = 'MacBookPro13,1' ]
then
    echo "<result>$MacbookPro13_1</result>"
elif [ $modelIdent = 'MacBookPro13,2' ]
then
    echo "<result>$MacbookPro13_2</result>"
elif [ $modelIdent = 'MacBookPro13,3' ]
then
    echo "<result>$MacbookPro13_3</result>"
elif [ $modelIdent = 'MacBookPro14,1' ]
then
    echo "<result>$MacbookPro14_1</result>"
elif [ $modelIdent = 'MacBookPro14,3' ]
then
    echo "<result>$MacbookPro14_3</result>"
elif [ $modelIdent = 'MacBookPro15,1' ]
then
    echo "<result>$MacbookPro15_1</result>"
elif [ $modelIdent = 'MacBookPro15,2' ]
then
    echo "<result>$MacbookPro15_2</result>"
else
    echo "<result>Unable to determine the model identifier or the upgrade date</result>"
fi
