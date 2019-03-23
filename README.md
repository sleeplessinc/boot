
	cd /tmp
	yum -y install git
	rm -rf ./boot
	git clone "https://github.com/sleeplessinc/boot.git"
	source ./boot/setup.sh &> boot.log

