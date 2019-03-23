
	cd /
	yum -y install git
	rm -rf ./sleepless-boot
	git clone "https://github.com/sleeplessinc/boot.git" sleepless-boot
	cd sleepless-boot
	source ./setup.sh &> log.txt

