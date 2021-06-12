#!/bin/bash

baseUrl="https://lalamove.atlassian.net/browse/"


echo "${1}"


if [[ "${1}" == "" ]]; then
  echo "Error: parameter cannot be empty"
else
  open "${baseUrl}${1}"
fi
