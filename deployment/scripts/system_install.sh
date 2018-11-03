#!/bin/bash

# System update
yum -y update
yum -y upgrade

# Required Software
yum -y install git figlet gcc-c++ nfs-utils awscli

# Update PIP and AWS CLI
pip install --upgrade pip
pip install --upgrade awscli

# Install Tomcat
yum install -y tomcat

# Clean up installation folder (multiple environments, same sever)
rm -rf /opt/api-codedeploy
