#!/bin/bash

echo "Please enter path:"
read NEWPATH
echo "Setting new directory for O2 software in '$NEWPATH', is this OK (y/n)?"
read ANS
if [[ $ANS != "y" ]]; then
  echo "Ok, aborting!"
  exit 
fi 

if [[ ! -d $NEWPATH ]]; then
  echo "ERROR: Check thad directory '$NEWPATH' exists and retry!"
  exit
fi

EXCLUDE="setup_new_dir.sh"
TOCP=$(ls *.sh | xargs)
set -x
for i in $TOCP; do 
  if [[ $EXCLUDE == *$i* ]]; then
    continue
  fi
  #cp -i -v $i $NEWPATH/
  ln -s $PWD/$i $NEWPATH/
done
set +x

