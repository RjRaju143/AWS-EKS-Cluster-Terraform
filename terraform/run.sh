#!/bin/sh

# Define the environment variable
ENVIRONMENT="dev"
WORKING_DIR="environments/$ENVIRONMENT"

# Check if the environment directory exists
if [ ! -d "$WORKING_DIR" ]; then
  echo "Error: Environment directory '$WORKING_DIR' does not exist."
  exit 1
fi

# Navigate to the environment directory
cd "$WORKING_DIR"

# Display options to the user
echo "Terraform Operations Menu:"
echo "1. Initialize, Validate, Plan and Apply changes"
echo "2. Destroy Terraform-managed infrastructure"

# Prompt user to enter an option
read -p "Enter your option (1 or 2): " OPTION

# Execute actions based on the user’s selection
case $OPTION in
  1)
    echo "Starting Terraform initialization, validation, planning, and apply process..."

    echo "Initializing Terraform..."
    terraform init

    echo "Validating Terraform configuration..."
    terraform validate

    echo "Planning Terraform changes..."
    terraform plan -out=tfplan

    echo "Applying Terraform changes..."
    terraform apply "tfplan"

    echo "Terraform apply completed successfully."
    ;;

  2)
    echo "Destroying Terraform-managed infrastructure..."

    echo "Initializing Terraform..."
    terraform init

    echo "Destroying resources..."
    terraform destroy -auto-approve

    echo "Terraform destroy completed successfully."
    ;;

  *)
    echo "Error: Unknown option '$OPTION'. Please enter either 1 or 2."
    exit 1
    ;;
esac
