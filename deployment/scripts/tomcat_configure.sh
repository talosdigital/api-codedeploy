#!/bin/bash

. /opt/api-codedeploy/deployment/scripts/setenv.sh

mkdir -p $WORKSPACE/healthcheck
cp $CODEDEPLOY/deployment/configs/healthcheck.html $WORKSPACE/healthcheck/index.html

if [ -f $CODEDEPLOY/deployment/configs/context.xml ]; then
  echo "Copying context.xml file to $DEPLOY_ENV.xml"
  cp $CODEDEPLOY/deployment/configs/context.xml $TOMCAT_HOME/conf/Catalina/localhost/$DEPLOY_ENV.xml
fi
