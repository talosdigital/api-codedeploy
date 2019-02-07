#!/bin/bash

. /opt/api-codedeploy/deployment/scripts/setenv.sh

mkdir -p $WORKSPACE/healthcheck
cp $CODEDEPLOY/deployment/configs/healthcheck.html $WORKSPACE/healthcheck/index.html

cp $CODEDEPLOY/deployment/configs/context.xml $TOMCAT_HOME/work/Catalina/localhost/$DEPLOY_ENV.xml
