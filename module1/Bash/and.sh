#!bin/bash

read -p "Enter the value of a:" a

read -p "Enter the value of b:" b

read -p "Enter the value of c:" c 

if(( $a > $b && $a > $c))
then
echo "$a is greater then $b and $c"
elif (($b > $a && $b > $c))
then
echo "$b is greater then $a and $c"
else
echo "$c is gerater then $a and $b"
fi
