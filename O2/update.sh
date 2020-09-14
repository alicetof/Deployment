#!/bin/bash

source o2suite_config.sh

function updatepkg(){
    pkgdir=$1
    echo "~~ Updating $pkgdir ~~"
    sleep 2
    cd $pkgdir
    GIT_VERSION=$(git --version)
    if [[ ${GIT_VERSION} == *" 2."* ]]; then
        git pull --rebase --autostash
    else
        git stash
        git pull --rebase
        git stash apply
    fi
    cd -
}

toupdate="alidist $@"

for i in $toupdate; do
    updatepkg $i
done

