#!/bin/bash -e

kubectl delete \
  -f jenkins-deployment.yaml \
  -f jenkins-service.yaml
