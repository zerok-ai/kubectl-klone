DEFAULT_ACTION='apply'
action="${1:-$DEFAULT_ACTION}"
service=$2

if [ $action = 'delete' ]; then 
    kubectl delete service zerok-target
    kubectl delete deployment zerok-target
    exit 0
fi

kubectl get service $service -o yaml > base/service.yaml
kubectl get deployment $service-deployment -o yaml > base/deployment.yaml

kubectl $action -f isolation/ingress.yaml
kubectl $action -k isolation
# kubectl $action -k instrumentation 
