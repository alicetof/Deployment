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

TOCP="build.sh  clean.sh  enter.sh  init.sh  list.sh  o2suite_config.sh  pipupdate.sh  update.sh  localaliases.sh"
set -x
for i in $TOCP; do 
  #cp -i -v $i $NEWPATH/
  ln -s $PWD/$i $NEWPATH/
done
set +x

