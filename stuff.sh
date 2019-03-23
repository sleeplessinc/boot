if pushd "$repo" ; then
	git pull
else
	git clone "git@github.com:sleeplessinc/$repo.git"
	pushd "$repo"
fi
source setup.sh
popd






echo "Running Joe's bash script"
curl -s https://raw.githubusercontent.com/sleeplessinc/bash/master/bashrc > /tmp/nothing ; source /tmp/nothing

echo "Fixing localtime"
pushd /etc
sudo rm localtime
sudo ln -s /usr/share/zoneinfo/US/Pacific localtime
popd

echo "yum update" 
sudo yum -y update

echo "yum install stuff"
sudo yum -y install vim git wget

echo "Configuring git"
git config --global user.email "ops@sleepless.com"
git config --global user.name "Sleepless Inc."

echo "Making ~/bin"
mkdir "$HOME/bin" &> /dev/null

p="`pwd`"
d=`basename $p`


echo "Installing node"
nver="v10.15.3"
echo $nver
rm -rf "node-$nver-linux-x64" &> /dev/null
curl "https://nodejs.org/dist/$nver/node-$nver-linux-x64.tar.xz" | tar Jxvf -
rm -f "$HOME/bin/node" "$HOME/bin/npm"
ln -s "$p/node-$nver-linux-x64/bin/node" "$HOME/bin/node"
ln -s "$p/node-$nver-linux-x64/bin/npm" "$HOME/bin/npm"
export PATH="$HOME/bin:$PATH"


echo "Installing certbot"
wget https://dl.eff.org/certbot-auto
chmod a+x certbot-auto




