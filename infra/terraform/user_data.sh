#!/bin/bash
# This script is used to configure the instance on startup
# It installs the necessary packages and sets up the environment
# Update the package manager
apt-get update -y
# Install necessary packages
apt-get install -y python3-pip python3-dev
# Install AWS CLI
pip3 install awscli

# write into a file
echo "Hello, World!" > /home/ubuntu/hello.txt