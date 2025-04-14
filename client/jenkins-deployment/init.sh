#!/bin/bash -e

# Generate deployment and service for jenkins:

kubectl create deployment jenkins \
  --image=jenkins/jenkins:lts \
  --dry-run=client -o yaml > jenkins-deployment.yaml

kubectl create service nodeport jenkins \
  --tcp=80:8080 \
  --dry-run=client -o yaml > jenkins-service.yaml
