#!/bin/bash
echo '----------------'
echo 'Install dependencies'
echo '----------------'
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

echo '----------------'
echo 'Add docker.repo'
echo '----------------'
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

echo '----------------'
echo 'Install docker-ce'
echo '----------------'
sudo yum install -y docker-ce

echo '----------------'
echo 'boot docker'
echo '----------------'
sudo systemctl status docker | grep running >/dev/null 2>&1
if [ $? = 1 ]; then
    sudo systemctl start docker
else
    echo 'already started.'
fi

echo '----------------'
echo 'enable docker'
echo '----------------'
sudo systemctl status docker | grep enable >/dev/null 2>&1
if [ $? = 1 ]; then
    sudo systemctl enable docker
else
    echo 'already enabled.'
fi

