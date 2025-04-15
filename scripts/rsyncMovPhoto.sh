#!/bin/bash

logFolder="/tmp/logs/"
inputMov="/mnt/mark15000/Mark_All_MOV/"
inputPhoto="/mnt/mark15000/Mark_All_photo/"
inputMCPhoto="/mnt/mark15000/Mark_All_photo/M&C_photo/"

outputMov="/mnt/mark15000A/Mark_All_MOV/"
outputPhoto="/mnt/mark15000A/Mark_All_photo/"

rsyncMovLog="$logFolder"rsyncMov-$(date +%Y%m%dT%H%M).log
rsyncPhotoLog="$logFolder"rsyncPhoto-$(date +%Y%m%dT%H%M).log

rsync -avhi --delete "$inputMov" "$outputMov" --log-file=$rsyncMovLog
rsync -avhi --delete "$inputPhoto" "$outputPhoto" --log-file=$rsyncPhotoLog

echo "==> rsync -avhi --delete "$inputMov" "$outputMov" --log-file=$rsyncMovLog" &>> $rsyncMovLog
echo "==> rsync -avhi --delete "$inputPhoto" "$outputPhoto" --log-file=$rsyncPhotoLog" &>> $rsyncPhotoLog