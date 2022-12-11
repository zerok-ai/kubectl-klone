# kube-depl-replica
Kubernetes scripts to replicate a deployment pod, with independent ingress attached to it. 

## About
kube-depl-replica helps create an isolated pod for a deployment.
Newly created pod has a new service and ingress path created for it. The egress dependencies remain same as other deployment pods. 

## How To

Replicate a pod:
```
./setup.sh apply <service-name>
```

clean up:
```
./setup.sh delete
```
