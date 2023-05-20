#!/bin/bash

DEFAULT_ACTION='apply'
action="${1:-$DEFAULT_ACTION}"
service=$2
ns=$3

if [ $action = 'delete' ]; then 
    kubectl delete service klone-target
    kubectl delete deployment klone-target
    exit 0
fi

kubectl get service $service -o yaml -n $ns > base/service.yaml
kubectl get deployment $service-deployment -o yaml -n $ns > base/deployment.yaml

kubectl $action -f isolation/ingress.yaml
kubectl $action -k isolation
# kubectl $action -k instrumentation 
