#!/bin/bash

. /opt/api-codedeploy/deployment/scripts/setenv.sh

echo "Starting tomcat installation"

if [ -d "$TOMCAT_HOME" ]; then
  echo "Tomcat is already installed"
  exit
fi

echo "Downloading tomcat"
cd /tmp
wget "https://www-us.apache.org/dist/tomcat/tomcat-7/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz"
mv "apache-tomcat$TOMCAT_VERSION.tar.gz" /usr/share/tomcat

echo "Creating tomcat user and group"
# Create tomcat user
groupadd tomcat
useradd -M -s /bin/nologin -g tomcat -d $TOMCAT_HOME tomcat

echo "Giving tomcat permissions"
# Give tomcat user ownership and permissions
chown -R tomcat:tomcat $TOMCAT_HOME
chmod -R g+r $TOMCAT_HOME/conf

echo "Creating tomcat service and enabling it"
# Move service file
mv $CODEDEPLOY/deployment/configs/tomcat.service /etc/systemd/system/tomcat.service

# Register tomcat as a service and enable it
systemctl daemon-reload
systemctl enable tomcat
