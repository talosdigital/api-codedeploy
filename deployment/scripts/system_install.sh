#!/bin/bash

# System update
yum -y update
yum -y upgrade

# Required Software
yum -y install git figlet gcc-c++ nfs-utils awscli jq wget java-1.8.0-openjdk-devel

# Update PIP and AWS CLI
pip install --upgrade pip
pip install --upgrade awscli

# Add welcome message
if ! grep -q "Banner /etc/ssh/sshd_banner" /etc/ssh/sshd_config; then
	echo 'Banner /etc/ssh/sshd_banner' >> /etc/ssh/sshd_config
fi
echo "$(figlet $DEPLOYMENT_GROUP_NAME)" > /etc/ssh/sshd_banner
systemctl reload sshd

# Codedeploy logs
ln -sfn /opt/codedeploy-agent/deployment-root/deployment-logs/codedeploy-agent-deployments.log /home/centos/codedeploy-agent-deployments.log

# Clean up installation folder (multiple environments, same sever)
rm -rf /opt/api-codedeploy
