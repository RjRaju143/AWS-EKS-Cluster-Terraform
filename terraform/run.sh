#!/bin/sh

set -e
set -x

ENVIRONMENT="dev"

cd environments/$ENVIRONMENT

echo "1. Initializing, Validating Terraform configuration, Plan and Applying changes"

echo "2. Destroy Terraform"

echo -n "Enter your option ex: 1, 2: "
read OPTION

case $OPTION in

  1)
    echo "Initializing Terraform..."
    terraform init

    echo "Validating Terraform configuration..."
    terraform validate

    echo "Planning Terraform changes..."
    terraform plan -out=tfplan

    echo "Applying Terraform changes..."
    terraform apply "tfplan"
    ;;

  2)
    echo "Destroying Terraform-managed infrastructure..."
    terraform destroy -auto-approve
    ;;

  *)
    echo -n "unknown option '$OPTION'"
    ;;

esac
