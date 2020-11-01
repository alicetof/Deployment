#!/usr/bin/env bash

source o2suite_config.sh

if [[ "$*" == *"-h"* ]]; then
    echo "Script to clean the installation"
    echo "> no arguments -> normal clean"
    echo "> -a -> aggressive clean"
    echo "> -r -> commands to reset the installation"
    return 1
    elif [[ "$*" == *"-a"* ]]; then
    echo "Aggressive cleaning"
    sleep 0.5
    aliBuild clean --aggressive-cleanup
    elif [[ "$*" == *"-r"* ]]; then
    cd sw || exit
    TO_REMOVE=$(find . -maxdepth 1 -not -iname "MIRROR" -not -iname "." | xargs)
    cd - || exit
    echo "In order to reset the installation and start from scratch run:"
    echo "cd sw && rm -rf ${TO_REMOVE} && cd -"
else
    echo "Cleaning"
    sleep 0.5
    aliBuild clean
fi

