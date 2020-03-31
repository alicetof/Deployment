#!/bin/bash

source o2suite_config.sh

function addremote(){
  echo "Adding remote for $1: $2"
  pushd $1
  git remote add alicetof https://github.com/alicetof/$2.git
  if [[ ! -z $3 ]]; then
    echo "Switching to branch $3"
    git fetch alicetof
    git checkout $3
  fi
  popd
}

aliBuild init O2@dev, --defaults $O2DEFAULTS
addremote alidist alidist tof-master
addremote O2 AliceO2
#
aliBuild init QualityControl@master --defaults $O2DEFAULTS
addremote QualityControl QualityControl
#
aliBuild init TOFCommissioning@master --defaults $O2DEFAULTS
#



