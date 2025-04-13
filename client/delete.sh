#!/bin/bash -e

kubectl delete \
  -f nginx-pod.yaml \
  -f nginx-service.yaml
