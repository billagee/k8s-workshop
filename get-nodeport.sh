#!/bin/bash -e

kubectl get service mynginx -o jsonpath='{.spec.ports[?(@.name=="80-80")].nodePort}'
