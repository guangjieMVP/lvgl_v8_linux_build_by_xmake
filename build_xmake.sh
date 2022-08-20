#!/bin/bash

xmake f -p cross --sdk=/usr/local/arm_gcc/gcc-linaro-4.9.4-2017.01-i686_arm-linux-gnueabihf

xmake -P . -v

app_file=build/cross/arm/release/mutlimedia

if [ -e "${app_file}" ]; then   # if this file is exist?
    sudo cp build/cross/arm/release/mutlimedia /mnt/nfs/
    echo "copy app to nfs directory ok!!!"
else 
    echo "file is not exist!!!"
fi


