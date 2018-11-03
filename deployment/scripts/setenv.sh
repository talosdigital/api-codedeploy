#!/usr/bin/env bash

export CODEDEPLOY=/opt/api-codedeploy
export WORKSPACE=/usr/share/tomcat/webapps

# Target
cd $CODEDEPLOY
export DEPLOY_ENV=$(ls -1 env-* | sed -e 's/env-//g')

# Tomcat config
export TOMCAT_HOME=/usr/share/tomcat

# Read variables.json
for s in $(cat deployment/variables.json | jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]" ); do
    export $s
done

