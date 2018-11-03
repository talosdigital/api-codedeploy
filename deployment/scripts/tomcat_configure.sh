#!/bin/bash

. /opt/api-codedeploy/deployment/scripts/setenv.sh

mkdir -p $WORKSPACE/healthcheck
cp $CODEDEPLOY/deployment/configs/healthcheck.html $WORKSPACE/healthcheck/index.html

cp -n $CODEDEPLOY/deployment/configs/*.xml /etc/tomcat/Catalina/localhost/

cp $CODEDEPLOY/deployment/configs/setenv.sh $TOMCAT_HOME/bin/setenv.sh
