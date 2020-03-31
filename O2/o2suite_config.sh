#!/bin/bash

# Sourcing PATHS for Alibuild
if [[ -z $1 ]]; then
 echo "~~~~~~~~~~~~~~~~"
 echo "~ SETUP for O2 ~"
 echo "~~~~~~~~~~~~~~~~"
fi

############################
# Setting Python variables #
############################
export PYTHONUSERBASE="$HOME/user_python"
export PATH="$PYTHONUSERBASE/bin:$PATH"

######################
# Setting Latest GCC #
######################
if [[ -z $1 ]]; then
 echo "Last GCC version before O2 setup:"
 gcc --version
fi

source scl_source enable devtoolset-7

if [[ -z $1 ]]; then
 echo "New GCC version after O2 setup:"
 gcc --version
fi

##################################
# Setting O2 defaults to be used #
##################################
export O2DEFAULTS="o2"
export O2DEFAULTS="o2-dataflow"

source localaliases.sh

