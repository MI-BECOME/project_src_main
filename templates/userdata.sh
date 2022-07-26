#!/bin/bash

sudo yum update
sudo yum install -y docker git

# docker
sudo usermod -aG docker ec2-user
systemctl enable docker
systemctl start docker:

# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-x86_64" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# source
cd /home/ec2-user
git clone https://github.com/bohamian/project_src.git
sudo chown -R ec2-user:ec2-user project_src
cd /home/ec2-user/project_src/jenkins_remote_docker
make run