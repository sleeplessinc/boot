
echo "Starting server setup"

cd /root
p="`pwd`"
d=`basename $p`


echo "Fixing localtime"
pushd /etc
sudo rm localtime
sudo ln -s /usr/share/zoneinfo/US/Pacific localtime
popd


#echo "yum update" 
#sudo yum -y update


echo "yum install stuff"
sudo yum -y install vim git wget


echo "Configuring git"
git config --global user.email "ops@sleepless.com"
git config --global user.name "Sleepless Inc."


echo "Making ~/bin"
mkdir "$HOME/bin" &> /dev/null


echo "Installing Joe's aliases"
curl -s https://raw.githubusercontent.com/sleeplessinc/bash/master/bashrc > "$HOME/bin/joe.sh"
echo "$HOME/bin/joe.sh" >> "$HOME/.bash_profile"


echo "Installing node"
nver="v10.15.3"
echo $nver
rm -rf "node-$nver-linux-x64" &> /dev/null
curl "https://nodejs.org/dist/$nver/node-$nver-linux-x64.tar.xz" | tar Jxvf -
rm -f "$HOME/bin/node" "$HOME/bin/npm"
ln -s "$p/node-$nver-linux-x64/bin/node" "$HOME/bin/node"
ln -s "$p/node-$nver-linux-x64/bin/npm" "$HOME/bin/npm"
export PATH="$HOME/bin:$PATH"


#echo "Installing certbot"
#wget https://dl.eff.org/certbot-auto
#chmod a+x certbot-auto
#crontab crontab-certbot-renew


echo "Done with server setup"

