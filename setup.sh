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
sudo systemctl start docker
sudo systemctl enable docker
