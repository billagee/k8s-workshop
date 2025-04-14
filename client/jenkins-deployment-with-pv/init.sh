#!/bin/bash -e

# Since this Jenkins deployment uses a pv/pvc, and kubectl create doesn't
# support volume creation, use this guide to build your YAML:
#
echo "See https://www.jenkins.io/doc/book/installing/kubernetes/"
