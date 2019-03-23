
	cd /
	yum -y install git
	rm -rf ./sleepless-boot
	git clone "https://github.com/sleeplessinc/boot.git" sleepless-boot
	cd sleepless-boot
	source ./setup.sh &> log.txt

	while true ; do
		if cd /root ; then
			yum -y install git
			rm -rf ./boot
			git clone "https://github.com/sleeplessinc/boot.git"
			cd boot
			source ./setup.sh &> log.txt
			break
		fi
		sleep 1
	done

