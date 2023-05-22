# kubectl-klone
Klone is a tool that creates a replica of any Kubernetes pod in the same environment as the original
The replica retains the following characteristics of the original
- Egress connections
- Resourcing
- Configurations
- Flags

Differences from the original pod
- Klone creates a separate port forward tunnel to the ingress of the replica. The replica can only be accessed through this tunnel.
- The port forward tunnels can be used to send a request to this duplicate pod (using Curl/ Postman) or to connect to the pod directly from IDE and debug remotely

Klone is language-agnostic

## About
kubectl klone extension helps create an isolated pod for a deployment.
Newly created pod has a new service and ingress path created for it. The egress dependencies remain same as other deployment pods. 

## How To
### Install

TODO: add installation instructions. 

#### Confirming installation
```
sh$ kubectl klone
```

![Confirm installation](resources/installation.png)


### Duplicate a pod
```
sh$ kubectl klone duplicate pod <pod-name> -n external
```

![Duplicate a pod](resources/duplicate-pod.png)

### Connect to duplicated pod
```
sh$ kubectl klone connect service klone-pod -n external
```

![Connect services to the duplicated pod](resources/connect-services.png)


clean up:
```
kubectl klone clean -n external
```

![Clean up klone](resources/clean.png)
