#!/bin/bash

repo=a1widgets

yum install git
git clone "git@github.com:sleeplessinc/$repo.git"
source "$repo/setup.sh"

