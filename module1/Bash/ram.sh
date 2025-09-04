#!bin/bash

freeram=$(free -m|grep "Mem"|awk '{print $4}')

if(($freeram >4000))
then
echo "Ram is over 4000 used"
else
echo "Ram is under 4000 "
fi
