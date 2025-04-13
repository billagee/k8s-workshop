#!/bin/bash -e

kubectl apply \
  -f nginx-pod.yaml \
  -f nginx-service.yaml
