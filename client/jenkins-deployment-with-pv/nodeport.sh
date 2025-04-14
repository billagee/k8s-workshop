#!/bin/bash -e

THEPORT=$(kubectl get service jenkins \
  -o jsonpath='{.spec.ports[?(@.name=="80-8080")].nodePort}')

echo "Your service's NodePort is '${THEPORT}'"
