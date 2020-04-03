#!/bin/bash

dir=$1
form=$2
name=$3
arh=$4
mkdir $name
op=$(find $dir -name "*.$form")
j=1
for var in $op
do
	if [ -f $(realpath $name)/$(basename $var) ] 
	then
	cp $var $(realpath $name)/$(basename $var)~$j
	j=$(($j + 1))
	else
	cp $var $(realpath $name)
	fi
done
tar -czf $arh $name
echo 'done'
