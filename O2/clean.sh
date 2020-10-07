#!/bin/bash

source o2suite_config.sh

if [[ -z $1 ]]; then
  echo "Cleaning"
  sleep 0.5
  aliBuild clean
else
  echo "Aggressive cleaning"
  sleep 0.5
  aliBuild clean --aggressive-cleanup
fi

if [[ $@ == *"--reset"* ]]; then
  cd sw
  TO_REMOVE=$(find . -maxdepth 1 -not -iname "MIRROR" -not -iname "." | xargs)
  cd -
  echo "In order to reset the installation and start from scratch"
  echo "cd sw"
  echo "rm -rf ${TO_REMOVE}"
  echo "cd -"
fi
