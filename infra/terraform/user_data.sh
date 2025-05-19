#!/bin/bash
# This script is used to configure the instance on startup
# It installs the necessary packages and sets up the environment

# Update the package manager
apt-get update -y
# Install necessary packages

apt-get install -y python3-pip python3-dev
# Install AWS CLI

pip3 install awscli
# Install Docker - https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# add the ubuntu user to the docker group
usermod -aG docker ubuntu

# write into a file
echo "Hello again, World!" > /home/ubuntu/hello.txt

