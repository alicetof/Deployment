#!/bin/bash

# Script to pack built software into the tgz for shipping!

Arch=$(cat /proc/version)

echo "Packing built software for shipping!"

ToCompress=""
case "$Arch" in 
  *Ubuntu*)
    # Do stuff
    echo "Ubuntu 18.04 config"
    ToCompress="ubuntu1804_x86-64"
  ;;
  *centos*)
    # Do stuff
    echo "Centos 7 config"
    ToCompress="slc7_x86-64"
  ;;
esac

if [[ -z $ToCompress ]]; then
  echo "Nothing to do with arch: ${Arch}"
  exit 1
fi

ToCompress="sw/${ToCompress}"

if [[ ! -d $ToCompress ]]; then
  echo "sw dir $ToCompress not found"
  exit 1
fi

Target="packed_o2_sw.tgz"

if [[ -f $Target ]]; then
  echo "File target $Target already exists!"
  exit 1
fi


tar -czvf $Target ${ToCompress}

echo "Done packing!"
echo "Packed $ToCompress to $Target!"


