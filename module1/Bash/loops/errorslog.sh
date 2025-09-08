#!/bin/bash

input_file=/home/omar/syslog
output_file=/home/omar/errror.log

if [[ -f $input_file ]]
then
echo "file isavailable"
sudo egrep -i "(error|critical|emergency)" $input_file > $output_file
else
echo "file is not available"
fi
