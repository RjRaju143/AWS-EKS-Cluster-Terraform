# ArgoCD Setup

## Install ArgoCD

1. **Create Namespace and Install ArgoCD:**

   ```sh
   kubectl create namespace argocd
   kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

   # port forward
   kubectl port-forward svc/argocd-server -n argocd 8080:443
   ```

   This will install ArgoCD in the `argocd` namespace.

2. **Create Ingress (Assuming you have Ingress installed on your cluster):**

   ```yaml
   apiVersion: networking.k8s.io/v1
   kind: Ingress
   metadata:
     name: argocd-server-ingress
     namespace: argocd # argicd namespace
     annotations:
       cert-manager.io/cluster-issuer: letsencrypt
       kubernetes.io/ingress.class: nginx
       kubernetes.io/tls-acme: "true"
       nginx.ingress.kubernetes.io/ssl-passthrough: "true"
       # If you encounter a redirect loop or are getting a 307 response code
       # then you need to force the nginx ingress to connect to the backend using HTTPS.
       nginx.ingress.kubernetes.io/backend-protocol: "HTTPS"
     tls:
       - hosts:
           - argocd.techboyraju.com
         secretName: argocd-secret # do not change, this is provided by Argo CD, SSL secret
   spec:
     rules:
       - host: argocd.techboyraju.com
         http:
           paths:
             - path: /
               pathType: Prefix
               backend:
                 service:
                   name: argocd-server
                   port:
                     name: https
   ```

   apply the `Ingress.yaml`

   ```sh
   kubectl apply -f Ingress.yaml
   ```

3. **Retrieve Initial Login Password:**

   ```sh
   kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
   ```

   This command decodes and displays the initial admin password required to log in to ArgoCD.
   You can change your password on GUI.

### Resources

- Argocd Install: [https://argo-cd.readthedocs.io/en/stable/](https://argo-cd.readthedocs.io/en/stable/)
- Install Ingress for ArgoCD: [https://gaunacode.com/install-argocd-on-an-aks-cluster-with-nginx](https://gaunacode.com/install-argocd-on-an-aks-cluster-with-nginx)

---

## Deploying a Sample Application

1. **Create Kubernetes Manifests:**

   Prepare your Kubernetes manifest files for your application and store them in a Git repository.

2. **Create Application Manifest (Application.yaml):**

   Create an `Application.yaml` manifest to automate the deployment of your application:

   ```yaml
   apiVersion: argoproj.io/v1alpha1
   kind: Application
   metadata:
     name: nginx # update the deploy application name
     namespace: argocd # argocd namespace
   spec:
     destination: # target cluster
       server: https://kubernetes.default.svc # k8s internal service    cluster API
       namespace: default # deploy application namespace
     source: # k8s manifest git repo
       repoURL: https://git-repo-url # update with git repo
       path: path/of/the/manifest/files # update with k8s manifest path
       targetRevision: HEAD # latest commit
     project: default # argocd project name # default is the project name # we can create our own project env.. on argocd
     syncPolicy:
       automated:
         prune: true # recreate new deployment
         selfHeal: true # recreate if any error occur
       syncOptions:
         - CreateNamespace=true # automatic creation of the deployment namespace if it does not already exist during application deployment
   ```

3. **Apply the Application Manifest:**

   Apply the `Application.yaml` manifest to initiate deployment:

   ```sh
   kubectl apply -f Application.yaml
   ```

   This will deploy your application using ArgoCD.

## Deployment via ArgoCD GUI

1. **Login to ArgoCD GUI:**

   Open your web browser and navigate to the ArgoCD UI. Use the retrieved initial admin password to log in.

2. **Create New Application:**

   Inside the ArgoCD UI, select "Create New App" and fill in the details according to your application and deployment needs.
