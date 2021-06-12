#!/bin/bash

if [ $# -eq 0 ]
then
  echo "No argument passed"
  exit
fi

inputFileName=$1
inputFileFilteredName="${inputFileName/%Encry/}"
outputFileName="${inputFileFilteredName/%/Decry}"

echo "Start decrypting $inputFileName"

openssl aes-256-cbc -d -in "$inputFileName" -out "$outputFileName"

if [ $? -eq 0 ]
then
  echo "$1 is successfully decrypted"
  echo "Deleting $1"
  chmod u+w $1
  rm $1
else
  echo "Error decrypting $1"
  echo "Please provide correct key"
  rm $outputFileName
fi


