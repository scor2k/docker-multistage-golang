#!/bin/bash 

USER_NAME="scor2k"
IMAGE_NAME=`cat server.go | grep "var appName" | awk -F '=' '{print $2}' | sed 's/ //g' | sed 's/"//g'`
VER=`cat server.go | grep "var appVersion" | awk -F '=' '{print $2}' | sed 's/ //g' | sed 's/"//g'`

docker build --tag $USER_NAME/$IMAGE_NAME:$VER .
docker push $USER_NAME/$IMAGE_NAME:$VER