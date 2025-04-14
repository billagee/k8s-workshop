#!/bin/bash -e

kubectl exec $(kubectl get pods -l app=jenkins -o jsonpath='{.items[0].metadata.name}') -it -- /bin/bash
