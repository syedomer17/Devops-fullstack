#!/bin/bash

input_file=/var/log/syslog
output_file=/home/omar/Devops-fullstack/module1/Bash/loops/error.log

if [[ -f $input_file ]]
then
echo "file is available and also available for reading the logs at $output_file"
sudo egrep -i "(error|critical|emergency)" $input_file > $output_file
else
echo "file is not available"
fi
