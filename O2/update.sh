#!/bin/bash

source o2suite_config.sh

function doit(){
	pkgdir=$1
	echo "~~ Updating $pkgdir ~~"
        sleep 2
	cd $pkgdir
	git stash
	git pull --rebase
	git stash apply
	cd -
}

toupdate="alidist $@"

for i in $toupdate; do
        doit $i
done

