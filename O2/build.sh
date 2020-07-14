#!/bin/bash

source o2suite_config.sh
. pipupdate.sh

function build_pckg(){
  echo "Building ${1}"
  LOG_FILE="${1}_last_build.log"
  CMD="aliBuild build ${1} --defaults $O2DEFAULTS -d"
  date | tee $LOG_FILE
  echo $CMD | tee -a $LOG_FILE
  sleep 1
  eval $CMD 2>&1 | tee -a $LOG_FILE
  date | tee -a $LOG_FILE
}

build_pckg O2Suite

build_pckg TOFCommissioning
