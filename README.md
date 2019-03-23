
yum install git

repo=a1widgets

if pushd "$repo" ; then
	git pull
else
	git clone "git@github.com:sleeplessinc/$repo.git"
	pushd "$repo"
fi
source setup.sh
popd



