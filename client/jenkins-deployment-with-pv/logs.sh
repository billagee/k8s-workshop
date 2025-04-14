#!/bin/bash -e

kubectl logs -l app=jenkins --tail=-1
