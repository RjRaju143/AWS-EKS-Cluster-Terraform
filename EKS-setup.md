# How to create EKS cluster

- `https://dev.to/aws-builders/the-essential-guide-to-create-a-kubernetes-cluster-using-aws-ekscli-5f89`

1. Create a IAM role with EKS or Admin permissions
2. Create a Amazon Machine Image (AMI) EC2 Instance, and attach above role
3. Install EKSCTL AND KUBECTL
4. Install UNZIP and AWSCLI Latest Version

```sh
sudo yum update
sudo yum install unzip -y
```

- AWSCLI:

```sh
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

- EKSCTL:

```sh
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

sudo mv /tmp/eksctl /usr/bin
```

- Kubectl:

```sh
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

mv kubectl /usr/local/bin
```

```sh
eksctl create cluster --name dev-cluster --version 1.29 --region ap-south-1 --nodegroup-name dev-cluster-nodes --node-type t2.small --nodes 3 --nodes-min 1 --nodes-max 3 --managed
```

```sh
aws eks update-kubeconfig --name dev-cluster --region ap-south-1
```

```sh
kubectl get nodes
kubectl get all --all-namespaces
```

- Install k9s

```sh
## Linux
curl -sS https://webi.sh/k9s | sh
## Windows
curl.exe https://webi.ms/k9s | powershell
## MacOs
curl -sS https://webi.sh/k9s | sh
```

## Delete NodeGroup

```sh
eksctl delete nodegroup \
 --cluster dev-cluster \
 --name dev-cluster-nodes \
 --region ap-south-1
```

## create NodeGroup

```sh
eksctl create nodegroup \
 --cluster dev-cluster \
 --region ap-south-1 \
 --name dev-cluster-nodes \
 --node-ami-family ami-family \
 --node-type t2.small \
 --nodes 3 \
 --nodes-min 2 \
 --nodes-max 4 \
 --ssh-access \
 --ssh-public-key nodes-key
```

## Get Cluster Security Group Id

```sh
aws eks describe-cluster --name dev-cluster --query cluster.resourcesVpcConfig.clusterSecurityGroupId
```
