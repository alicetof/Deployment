#!/bin/bash

source o2suite_config.sh

function build_pckg(){
    echo "Building ${1}"
    LOG_FILE="${1}_last_build.log"
    CMD="aliBuild build ${*} --defaults $O2DEFAULTS -d"
    date | tee "$LOG_FILE"
    echo "$CMD" | tee -a "$LOG_FILE"
    sleep 1
    eval "$CMD" 2>&1 | tee -a "$LOG_FILE"
    date | tee -a "$LOG_FILE"
}

# build_pckg O2
# build_pckg QualityControl
# build_pckg O2Suite
# build_pckg TOFCommissioning

build_pckg "$O2MAINPKG" "$@"