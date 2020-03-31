#!/bin/bash

source o2suite_config.sh
. pipupdate.sh

aliBuild build O2Suite --defaults $O2DEFAULTS
aliBuild build TOFCommissioning --defaults $O2DEFAULTS
