#!/bin/bash -e

THEPORT=$(kubectl get service mynginx -o jsonpath='{.spec.ports[?(@.name=="80-80")].nodePort}')

echo "Your service's NodePort is '${THEPORT}'"
