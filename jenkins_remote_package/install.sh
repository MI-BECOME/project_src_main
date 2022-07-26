#!/bin/bash

set -x;

sudo yum -y update;
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo;
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key;
sudo yum upgrade -y;
sudo amazon-linux-extras install epel -y;

sudo yum install jenkins java-1.8.0-openjdk-devel -y;

sudo systemctl daemon-reload;
sudo systemctl start jenkins;

sudo systemctl status jenkins;

sudo yum install -y docker;
sudo systemctl enable docker;
sudo systemctl start docker;
sudo usermod -aG docker jenkins;
sudo usermod -aG docker ec2-user;

# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-x86_64" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose