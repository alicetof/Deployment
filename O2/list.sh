#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/o2suite_config.sh
alienv q -w ${DIR}/sw latest-$O2DEFAULTS

