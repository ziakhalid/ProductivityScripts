#!/bin/bash


if [ $# -eq 0 ]
then
  echo "No argument passed"
  exit
fi

inputFileName=$1
inputFileFilteredName="${inputFileName/%Decry/}"
outputFileName="${inputFileFilteredName/%/Encry}"

echo "Start encrypting $inputFileName"

openssl aes-256-cbc -salt -in $1 -out "$outputFileName"

if [ $? -eq 0 ]
then
  echo "$1 is successfully encrypted"
  echo "Deleting $1"
  rm $1
fi
