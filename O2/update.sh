#!/bin/bash

source o2suite_config.sh

function doit(){
	pkgdir=$1
	echo "~~ Updating $pkgdir ~~"
        sleep 2
	cd $pkgdir
	git pull --rebase --autostash
	cd -
}

toupdate="alidist $@"

for i in $toupdate; do
        doit $i
done

