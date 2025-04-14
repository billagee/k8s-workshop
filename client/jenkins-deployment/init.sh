#!/bin/bash -e

# Generate deployment, service, and pv/pvc yaml for jenkins:

kubectl create deployment jenkins \
  --image=jenkins/jenkins:lts \
  --dry-run=client -o yaml > jenkins-deployment.yaml

kubectl create service nodeport jenkins \
  --tcp=80:8080 \
  --dry-run=client -o yaml > jenkins-service.yaml

#kubectl create pv jenkins-pv \
#  --storage-class=manual \
#  --capacity=1Gi \
#  --access-modes=ReadWriteOnce \
#  --host-path=/mnt/data/jenkins \
#  --dry-run=client -o yaml > jenkins-pv.yaml

#kubectl create pvc jenkins-pvc \
#  --storage-class=manual \
#  --access-mode=ReadWriteOnce \
#  --resources=requests.storage=1Gi \
#  --dry-run=client -o yaml > jenkins-pvc.yaml
