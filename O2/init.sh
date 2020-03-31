#!/bin/bash

source o2suite_config.sh
aliBuild init O2@dev, --defaults $O2DEFAULTS
aliBuild init QualityControl@master --defaults $O2DEFAULTS
aliBuild init TOFCommissioning@master --defaults $O2DEFAULTS

function addremote(){
  echo "Adding remote for $1: $2"
  pushd $1
  git remote add alicetof https://github.com/alicetof/$2.git
  popd
}

addremote alidist alidist

addremote QualityControl QualityControl

addremote O2 AliceO2

