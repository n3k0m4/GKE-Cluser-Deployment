#!/usr/bin/env bash

terraform init

terraform plan -out=tfplan

echo 'yes' | terraform apply

project_id=`grep 'project_id' terraform.tfvars | grep -o '".*"' | sed 's/"//g'`
region=`grep 'region' terraform.tfvars | grep -o '".*"' | sed 's/"//g'`
main_zone=`grep 'main_zone' terraform.tfvars | grep -o '".*"' | sed 's/"//g'`

gcloud container clusters get-credentials app-cluster --project $project_id --zone $region

gcloud beta compute ssh app-cluster-bastion --tunnel-through-iap --project $project_id --zone $main_zone -- -4 -L8888:127.0.0.1:8888 -N -q -f
