#!/bin/bash

source o2suite_config.sh
. pipupdate.sh

echo "Building O2Suite"
aliBuild build O2Suite --defaults $O2DEFAULTS

echo "Building TOFCommissioning"
aliBuild build TOFCommissioning --defaults $O2DEFAULTS
