#!/usr/bin/env bash


# Flag for verbose deployment, unset it for verbose!
VERBOSEDPLMNT="non-verbose"
VERBOSEDPLMNT=""
function verbose_msg(){
    if [[ -z $VERBOSEDPLMNT ]]; then
        echo "$*"
    fi
}

# Check if the evironment is already set
if [[ -n $DEPLOYMENTSET ]]; then
    verbose_msg "~ Environment already set ~"
    return 1
fi

# Directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# Path for alienv to work
export ALIBUILD_WORK_DIR="${DIR}/sw"

####################################
# Setting environment for AliBuild #
####################################
verbose_msg "~~~~~~~~~~~~~~~~"
verbose_msg "~ SETUP for O2 ~"
verbose_msg "~~~~~~~~~~~~~~~~"

##########################################################
# Setting Python variables (only if not already defined) #
##########################################################
if [[ -z $PYTHONUSERBASE ]]; then
    export PYTHONUSERBASE="$HOME/user_python"
    export PATH="$PATH:$PYTHONUSERBASE/bin"
    verbose_msg "> Exporting PYTHONUSERBASE to '$PYTHONUSERBASE'"
fi

#######################################
# Setting Latest GCC (only on CENTOS) #
#######################################
if [[ $(uname -a) == *"Ubuntu"* ]]; then
    verbose_msg "> Rig setup for Ubuntu"
else
    verbose_msg "> Rig setup for CENTOS"
    if [[ -z $VERBOSEDPLMNT ]]; then
        echo "Last GCC version before O2 setup:"
        gcc --version
    fi
    
    source scl_source enable devtoolset-7
    
    if [[ -z $VERBOSEDPLMNT ]]; then
        echo "New GCC version after O2 setup:"
        gcc --version
    fi
fi

##################################
# Setting O2 defaults to be used #
##################################
export O2DEFAULTS="o2"
export O2DEFAULTS="o2-dataflow"
verbose_msg "> Building with '$O2DEFAULTS' defaults"

###############################################
# Setting O2 main package to be install/enter #
###############################################
export O2MAINPKG="TOFCommissioning"
export O2MAINPKGBRANCH="master"
verbose_msg "> Main package to build '$O2MAINPKG' on branch '$O2MAINPKGBRANCH'"

###########################
# Setting extra variables #
###########################
EXTRASRC="$DIR/localaliases.sh"
if [[ -f $EXTRASRC ]]; then
    echo "$EXTRASRC"
else
    echo ">  If you want to provide extra file to source:"
    echo ">  do create a local file '$EXTRASRC'"
    echo ">  it will be automatically sourced"
fi

export DEPLOYMENTSET="YES!"