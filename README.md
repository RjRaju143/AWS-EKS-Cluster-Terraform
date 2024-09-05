## AWS Public EKS

### Terraform: Plan and Apply Configuration

- **Change Directory to project main code**

  ```sh
  cd environments/dev
  ```

- **Init Terraform:**

  ```sh
  terraform init
  ```

- **Validating Terraform configuration**

  ```sh
  terraform validate
  ```

- **Planning Terraform changes**

  ```sh
  terraform plan -out=tfplan
  ```

- **Applying Terraform changes**

  ```sh
  terraform apply "tfplan"
  ```

### Verify Root Profile Configuration

- **Check Root Profile Configuration: `(optional)`**
  ```sh
  aws sts get-caller-identity
  ```

### Configure Kubeconfig for Root Profile

- **Create `kubeconfig.yaml` File to Access Cluster with Root Profile:**

  ```sh
  aws eks update-kubeconfig --region ap-south-1 --name dev-cluster
  ```

- **Check Permissions: `(optional)`**
  ```sh
  kubectl auth can-i "*" "*"
  ```

<!-- ### Configure Access for Developer User

1. **Create New Access and Secret Keys Using IAM (for Developer User Created by Terraform Code):**
   - Navigate to IAM in the AWS Console and create new access and secret keys for the developer user.

2. **Configure AWS CLI with New Developer Profile:**
   ```sh
   aws configure --profile dev
   ```

3. **Verify Developer Profile Configuration: `(optional)`**
   ```sh
   aws sts get-caller-identity --profile dev
   ``` -->

<!-- ### Configure Kubeconfig for Developer Profile

1. **Create `kubeconfig.yaml` File to Access Cluster with Developer Profile:**
   ```sh
   aws eks update-kubeconfig --region ap-south-1 --name dev-cluster --profile dev
   ``` -->

### Destroy Kubernetes Cluster

- **Destroy Kubernetes Cluster:**
   ```sh
   terraform destroy -auto-approve
   ```
   <!-- - **NOTE:** Before destroying the cluster delete Access and Secret Keys on IAM user manualy. -->


### **Run shell Script to automate above the process**
  ```sh
  ## change dir to env ..
  cd environments/dev
  chmod +x run.sh
  ./run.sh
  ```



<!-- ### To Find Addon Versions

1. **Enter the below command**

   ```sh
   aws eks describe-addon-versions --region ap-south-1 --addon-name eks-pod-identity-agent
   ```
   - Update the `addon_version` on `13-pod-identity-addon.tf` file

 -->




<!--
resource "aws_eks_cluster" "eks" {
  name     = "${local.env}-${local.eks_name}"
  version  = local.eks_version
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true

    subnet_ids = [
      aws_subnet.private_zone1.id,
      aws_subnet.private_zone2.id
    ]
  }

  access_config {
    authentication_mode                         = "API"
    bootstrap_cluster_creator_admin_permissions = true
  }

  depends_on = [aws_iam_role_policy_attachment.eks]
}
-->

<!-- 
[ 
    access_config on aws_eks_cluster,
    create a dev-user and admin-user for eks,
    check storage drivers EDS, EFS,
    check LoadBalancer
]
--->







