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
  # aws eks update-kubeconfig --region <region> --name <cluster-name>
  aws eks update-kubeconfig --region ap-south-1 --name dev-cluster
  ```

- **Check Permissions: `(optional)`**
  ```sh
  kubectl auth can-i "*" "*"
  ```

---

### Configure Access for Developer User

1. **Create New Access and Secret Keys Using IAM (for Developer User Created by Terraform Code):**
   - Navigate to IAM in the AWS Console and create new access and secret keys for the developer user.

2. **Configure AWS CLI with New Developer Profile:**
   ```sh
   aws configure --profile dev
   ```

3. **Verify Developer Profile Configuration: `(optional)`**
   ```sh
   aws sts get-caller-identity --profile dev
   ```

---

### Configure Kubeconfig for Developer Profile

- **Create `kubeconfig.yaml` File to Access Cluster with Developer Profile:**
   ```sh
   aws eks update-kubeconfig --region ap-south-1 --name dev-cluster --profile dev
   ```

---

### Configure Access for Cluster Admin User

- Create New Access and Secret Keys for Admin User
- Navigate to the IAM section in the AWS Console.
- Generate new Access and Secret keys for the Admin user (created via Terraform).

1. Configure AWS CLI for Manager Profile
   ```bash
   aws configure --profile manager
   ```

2. Check if You Have Proper Admin Permissions
   ```bash
   # aws sts assume-role --role-arn <arn-id> --role-session-name manager-session --profile <profile-name>
   aws sts assume-role --role-arn arn:aws:iam::654654428184:role/dev-cluster-eks-admin --role-session-name manager-session --profile manager
   ```

3. Edit Manualy .aws/config file.
   ```sh
   [profile eks-admin]
   role_arn = arn:aws:iam::654654428184:role/dev-cluster-eks-admin
   source_profile = manager
   ```
4. **Create `kubeconfig.yaml` File to Access Cluster with Admin Profile:**
   ```sh
   aws eks update-kubeconfig --region ap-south-1 --name dev-cluster --profile eks-admin
   ```

---

### Destroy Kubernetes Cluster

- **Destroy Kubernetes Cluster:**
   ```sh
   terraform destroy -auto-approve
   ```
   - **NOTE:** Before destroying the cluster delete Access and Secret Keys on IAM user manualy.


### **Run shell Script to automate above the process**
   ```sh
   ## change dir to env ..
   cd terraform/
   chmod +x run.sh
   ./run.sh
   ```


<!-- 
[ 
    check storage drivers EFS,
    File system & module structure
]
--->


