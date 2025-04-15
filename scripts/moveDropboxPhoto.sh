#!/bin/bash

# Define variables for folder
dropboxFolder='/home/mark/Dropbox/Camera Uploads'
logFolder='/tmp/logs'

movFolder='/mnt/mark15000/Mark_All_MOV/SamJim_mov/'
currentMovFolder=${movFolder}$(date +%Y)_mov/

expirationDays=7
photoFolder='/mnt/mark15000/Mark_All_photo/M&C_photo/'

# currentPhotoFolder must use double quoto as date command need expand
currentPhotoFolder="${photoFolder}MSJC_$(date +%Y)/"
currentMonthPhotoFolder=${currentPhotoFolder}$(date +%Y)_$(date +%m --date="-$expirationDays days")/

if [ -d "$logFolder" ] 
then
    echo "Log Directory $logFolder exists." 
else
    echo "Error: Log Directory $logFolder does not exists, create it"
    mkdir $logFolder
fi

# Create year folder if not exist, For example: MSJC_2023
if [ -d "$currentPhotoFolder" ] 
then
    echo "Year Directory $currentPhotoFolder exists." 
else
    echo "Error: Year Directory $currentPhotoFolder does not exists, create it"
    mkdir $currentPhotoFolder
fi


# Create month folder if not exist, For example:2022_03
if [ -d "$currentMonthPhotoFolder" ] 
then
    echo "Month Directory $currentMonthPhotoFolder exists." 
else
    echo "Error: Month Directory $currentMonthPhotoFolder does not exists, create it"
    mkdir $currentMonthPhotoFolder
fi

moveMovLog="moveMov-$(date +%Y%m%dT%H%M).log"
movePhotoLog="movePhoto-$(date +%Y%m%dT%H%M).log"

echo "==> find "$dropboxFolder" -name "*.mp4"" &> ${logFolder}/$moveMovLog
find "$dropboxFolder" -name "*.mp4" &>> ${logFolder}/$moveMovLog

echo "==> find "$dropboxFolder" -mtime +$expirationDays" &> ${logFolder}/$movePhotoLog
find "$dropboxFolder" -mtime +$expirationDays &>> ${logFolder}/$movePhotoLog

echo "==> find "$dropboxFolder" -name "*.mp4" -exec mv {} "$currentMovFolder" \;" &>> ${logFolder}/$moveMovLog
find "$dropboxFolder" -name "*.mp4" -exec mv {} "$currentMovFolder" \;

echo "==> find "$dropboxFolder" -mtime +$expirationDays -exec mv {} "$currentMonthPhotoFolder" \;" &>> ${logFolder}/$movePhotoLog
find "$dropboxFolder" -mtime +$expirationDays -exec mv {} "$currentMonthPhotoFolder" \;
