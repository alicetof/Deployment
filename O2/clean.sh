#!/bin/bash

source o2suite_config.sh

if [[ -z $1 ]]; then
  echo "Cleaning"
  aliBuild clean
else
  echo "Aggressive cleaning"
  aliBuild clean --aggressive-cleanup
fi
