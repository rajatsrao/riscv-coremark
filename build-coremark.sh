#!/bin/bash

set -e

BASEDIR=$PWD
CM_FOLDER=coremark

cd $BASEDIR/$CM_FOLDER

# run the compile
echo "Start compilation"
make PORT_DIR=../riscv64 XCFLAGS="-DMULTITHREAD=1 -DUSE_PTHREAD -pthread" compile
mv coremark.riscv ../coremark_1th
make PORT_DIR=../riscv64 XCFLAGS="-DMULTITHREAD=2 -DUSE_PTHREAD -pthread" compile
mv coremark.riscv ../coremark_2th
make PORT_DIR=../riscv64 XCFLAGS="-DMULTITHREAD=4 -DUSE_PTHREAD -pthread" compile
mv coremark.riscv ../coremark_4th

make PORT_DIR=../riscv64-baremetal compile
mv coremark.bare.riscv ../
