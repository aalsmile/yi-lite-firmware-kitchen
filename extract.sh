#!/bin/bash
#
#
# This script extract YI Lite Action Camera firmware
#
# Author: Aleksey Yakovlev
# Site: https://aya.webhop.me
#
# If you use this script you are automatically agree
# that you are responsible for your own actions
#
#
# February 15, 2018
# 

clear

extractparts[1]="out4.bin"
extractparts[2]="out5.bin"
extractparts[3]="out6.bin"
extractparts[4]="out7.bin"
extractparts[5]="out8.bin"

rm -rf firmware || true
mkdir firmware && cd firmware && mkdir extracted

echo "Splitting update_j11.bin..."
../bin/split_rom ../update_j11.bin
../bin/split_fw_hw_v_checksum out8.bin
../bin/home_cut out8.bin

echo "U-boot header removing..."
for i in "${extractparts[@]}"; do
  ../bin/uboot_cut $i extracted
done 

echo "Extracting linux..."
mkdir extracted/linux
../bin/uboot_cut extracted/out4_cut.bin extracted/linux
mv extracted/linux/out4_cut_cut.bin extracted/linux/Linux-kernel-3.18.20.img

echo "Extracting liteos..."
mkdir extracted/liteos
../bin/liteos_cut extracted/out5_cut.bin extracted/liteos

echo "Extracting picture..."
mkdir extracted/picture
mv extracted/out6_cut.bin extracted/picture/picture.bmp

echo "Extracting rootfs..."
../bin/ubifs_dump extracted/out7_cut.bin extracted/rootfs

echo "Extracting home..."
../bin/ubifs_dump extracted/out8_cut.bin extracted/home

exit 0