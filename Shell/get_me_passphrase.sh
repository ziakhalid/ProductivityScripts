#!/bin/bash

if [ $# -eq 0 ]
then
  echo "No argument passed"
  exit
fi

filePath=$1

echo "Getting Passphrase form $filePath"

echo "Please select the Passphrase type"

read passType

passTypeOne(){
cat $filePath | head -n 4 | tail -n 1 | tail -c 50 | head -c 9
}

passTypeTwo(){
cat $filePath | head -n 7 | tail -n 1 | tail -c 50 | head -c 12 
}

passTypeThree(){
cat $filePath | head -n 9 | tail -n 1 | tail -c 50 | head -c 15
}

default(){
cat $filePath | head -n 12 | tail -n 1 | tail -c 50 | head -c 15
}


if ! [[ $passType =~ ^[0-9]+$ ]]; then
  echo "Error: argument must be a number"
else 
  echo "Using Passphrase type  $passType"
  case "$passType" in 	
     1) passTypeOne;;
     2) passTypeTwo;;
     3) passTypeThree;;
     *) default;;
  esac
fi
	  


