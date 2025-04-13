#!/bin/bash -e

# Generate pod and service yaml:

kubectl run mynginx --image=nginx --port=80 --labels=app=mynginx --dry-run=client -o yaml > nginx-pod.yaml

# Create service with fixed NodePort
#kubectl create service nodeport myservice --tcp=80:80 --node-port=30080 --dry-run=client -o yaml > service.yaml

# Create service with random NodePort, better for workshop since we're starting many nginx pods:
#
# (Also note 'create service', not 'expose' to generate yaml. Expose requires the pod to exist:)
kubectl create service nodeport mynginx --tcp=80:80 --dry-run=client -o yaml > nginx-service.yaml
#--selector=app=mynginx
