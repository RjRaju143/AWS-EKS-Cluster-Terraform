# Setup Harbor Docker Registry

## Helm Installation

First, create a namespace for Harbor and install it using Helm:

```sh
kubectl create ns harbor-system
helm repo add harbor https://helm.goharbor.io
helm upgrade --install harbor harbor/harbor --namespace harbor-system --create-namespace --set expose.ingress.hosts.core=harbor.registy.techboyraju.com --set externalURL=http://harbor.registy.techboyraju.com --wait
```

## Login Credentials

- Default super user creds
- **Domain**: `harbor.registy.techboyraju.com`
- **Username**: `admin`
- **Password**: `Harbor12345`

## Custom Ingress

### Step 1: Remove Existing Ingress

Remove any existing Ingress resources in the `harbor-system` namespace, we are creating our own custom ingress.

```sh
kubectl delete ing harbor-ingress -n harbor-system
```

### Step 2: Create a Custom Ingress

Ensure you have installed cert-manager for SSL on your Kubernetes cluster, then create the Ingress resource:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/proxy-body-size: "0"
    nginx.ingress.kubernetes.io/proxy-read-timeout: "900"
    nginx.ingress.kubernetes.io/proxy-send-timeout: "900"
    ## SSL
    cert-manager.io/cluster-issuer: "letsencrypt"
  name: harbor-ingress
  namespace: harbor-system
spec:
  tls:
    - hosts:
        - k8s-ingress-external-a6ffe2a3d1-dd08b5b1425b463b.elb.ap-south-1.amazonaws.com
      secretName: letsencrypt-secret
  rules:
    - host: k8s-ingress-external-a6ffe2a3d1-dd08b5b1425b463b.elb.ap-south-1.amazonaws.com
      http:
        paths:
          - backend:
              service:
                name: harbor-core
                port:
                  number: 80
            path: /api/
            pathType: Prefix
          - backend:
              service:
                name: harbor-core
                port:
                  number: 80
            path: /service/
            pathType: Prefix
          - backend:
              service:
                name: harbor-core
                port:
                  number: 80
            path: /v2/
            pathType: Prefix
          - backend:
              service:
                name: harbor-core
                port:
                  number: 80
            path: /chartrepo/
            pathType: Prefix
          - backend:
              service:
                name: harbor-core
                port:
                  number: 80
            path: /c/
            pathType: Prefix
          - backend:
              service:
                name: harbor-portal
                port:
                  number: 80
            path: /
            pathType: Prefix
```

### Step 3: Apply the Ingress

Finally, apply the Ingress resource:

```sh
kubectl apply -f ingress.yaml
```
