
	#!/bin/bash
	cd /root
	yum -y install git
	rm -rf ./boot
	git clone "https://github.com/sleeplessinc/boot.git"
	source ./boot/setup.sh &> log.txt

