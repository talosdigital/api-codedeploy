#!/bin/bash

. /opt/api-codedeploy/deployment/scripts/setenv.sh

echo "Files replacement"
rm -rf $WORKSPACE/$DEPLOY_ENV*
mkdir $WORKSPACE

echo "Deployment"
mv $CODEDEPLOY/target/$WAR_FILE $WORKSPACE/$$DEPLOY_ENV.war

echo "All done!"
