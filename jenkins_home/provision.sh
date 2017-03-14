#!/bin/sh

apt-get -y update

# Install dependencies to be used below
apt-get -y install make
apt-get -y install rsync

# Install Docker
apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get -y update
apt-get -y install docker-ce
usermod -aG docker jenkins
chown root:docker /var/run/docker.sock

# Install Golang
cd /tmp
curl -O https://storage.googleapis.com/golang/go1.7.4.linux-amd64.tar.gz
tar xvf go1.7.4.linux-amd64.tar.gz
chown -R root:root ./go
rsync -avz go /usr/local/
rm -rf go

# Install Glide
mkdir $GOPATH/bin
curl https://glide.sh/get | sh
