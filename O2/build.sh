#!/bin/bash

source o2suite_config.sh
. pipupdate.sh

function build_pckg(){
  echo "Building ${1}"
  aliBuild build ${1} --defaults $O2DEFAULTS -d | tee ${i}_last_build.log
}

build_pckg O2Suite

build_pckg TOFCommissioning
