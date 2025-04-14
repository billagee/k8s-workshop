#!/bin/bash -e

kubectl apply \
  -f jenkins-deployment.yaml \
  -f jenkins-service.yaml
