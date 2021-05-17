#!/usr/bin/env sh

namespace="$1"
appName="$2"
version="$3"

#echo details
echo "$namespace $appName $version"
pwd
whoami

#copy ms infra
# rm -rf infra
# cp -r "/var/emas-infra/ms/${namespace}" infra

#replace ms-name for backend state

sed -i "s/MS_NAME/${appName}/g" tf/backend.tf

# run terraform

cd tf

terraform init
terraform validate .
terraform plan -var DOCKER_IMG_TAG=$version -var APP_NAME=$appName

terraform taint ms-deployment
terraform taint ms-service

terraform apply -var DOCKER_IMG_TAG=$version -var APP_NAME=$appName -auto-approve
