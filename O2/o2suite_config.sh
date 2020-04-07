#!/bin/bash

# Directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# Path for alienv to work
export ALIBUILD_WORK_DIR="${DIR}/sw"

# Flag for verbose deployement, set it to non null for quiet
export VERBOSEDPLMNT=""

####################################
# Setting environment for AliBuild #
####################################
if [[ -z $VERBOSEDPLMNT ]]; then
 echo "~~~~~~~~~~~~~~~~"
 echo "~ SETUP for O2 ~"
 echo "~~~~~~~~~~~~~~~~"
fi

############################
# Setting Python variables #
############################
export PYTHONUSERBASE="$HOME/user_python"
export PATH="$PATH:$PYTHONUSERBASE/bin"

######################
# Setting Latest GCC #
######################
if [[ -z $VERBOSEDPLMNT ]]; then
 echo "Last GCC version before O2 setup:"
 gcc --version
fi

source scl_source enable devtoolset-7

if [[ -z $VERBOSEDPLMNT ]]; then
 echo "New GCC version after O2 setup:"
 gcc --version
fi

##################################
# Setting O2 defaults to be used #
##################################
export O2DEFAULTS="o2"
export O2DEFAULTS="o2-dataflow"

###########################
# Setting extra variables #
###########################
EXTRASRC="$DIR/localaliases.sh"
if [[ -f $EXTRASRC ]]; then
  source $EXTRASRC
else
  echo ">  If you want to provide extra file to source:"
  echo ">  do create a local file '$EXTRASRC'"
  echo ">  it will be automatically sourced"
fi

