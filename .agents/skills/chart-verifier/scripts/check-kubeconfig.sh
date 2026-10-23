#!/bin/sh

if [ "${KUBECONFIG+x}" = x ]; then
  echo "KUBECONFIG is set"
else
  echo "KUBECONFIG is not set"
fi
