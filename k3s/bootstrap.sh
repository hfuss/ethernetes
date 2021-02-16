#!/bin/bash

set -e

kubectl create ns e8s-system || true
helm repo add argo https://argoproj.github.io/argo-helm
helm upgrade --install \
    argocd argo/argo-cd \
    -n e8s-system \
    -f argocd.yaml \
    --atomic \
    --wait
kubectl create ns longhorn-system || true
kubectl create ns cert-manager || true
kubectl create ns kaleido || true
kubectl create ns datadog || true


set +e
if ! kubectl get secret -n datadog datadog-creds 2> /dev/null; then
  set -e
  kubectl create secret generic datadog-creds --from-literal api-key="$(lpass show --password datadog-api-key)" --namespace="datadog"
fi

set -e

