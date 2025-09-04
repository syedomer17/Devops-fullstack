#!/bin/bash

echo "Enter your age:"
read age

if (($age >= 18))
then 
echo "you can vote"
else
echo "you can't vote"
fi
