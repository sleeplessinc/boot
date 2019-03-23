#!/bin/bash

rep=a1widgets

yum install git
rm -rf ./boot
git clone "git@github.com:sleeplessinc/boot.git"
source &> boot.log ./boot/setup.sh "$repo"

