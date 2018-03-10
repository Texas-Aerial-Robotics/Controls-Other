#!/bin/bash
#this script is ment to be run in catkin_ws/src to pull the latest versions 
#of the git repositories 

array=(`ls | grep -v sh`)

len=${#array[*]}

i=0
while [ $i -lt $len ]; do

echo "changing directory to ${array[$i]}"
echo ""

cd ${array[$i]}


if [ -e .git ]
then
    echo "pulling from source"

    git pull
fi

echo "changing directory to root"
echo ""
cd ../


let i++
done
