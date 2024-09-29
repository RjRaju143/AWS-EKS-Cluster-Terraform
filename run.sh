#!/bin/sh

# Exit immediately if a command exits with a non-zero status and enable debug mode
set -e
# set -x

ENV="staging"

PUBLIC_VPC="environments/$ENV/vpc/public/"
PRIVATE_VPC="environments/$ENV/vpc/private/"
EKS_CLUSTER="environments/$ENV/EKS-cluster/"
ADDONS="environments/$ENV/Addons/"

if [ ! -d "$PUBLIC_VPC" ]; then
    echo "Error: Environment directory '$PUBLIC_VPC' does not exist."
    exit 1
fi

if [ ! -d "$PRIVATE_VPC" ]; then
    echo "Error: Environment directory '$PRIVATE_VPC' does not exist."
    exit 1
fi

if [ ! -d "$EKS_CLUSTER" ]; then
    echo "Error: Environment directory '$EKS_CLUSTER' does not exist."
    exit 1
fi

if [ ! -d "$ADDONS" ]; then
    echo "Error: Environment directory '$ADDONS' does not exist."
    exit 1
fi

WORK_DIR=`pwd`
# WORK_DIR=$(pwd)

# Display options to the user
echo "Terraform Operations Menu:"
echo "1. Create"
echo "2. Destroy"

# Prompt user to enter an option
read -p "Enter your option (1, 2): " OPTION

# Execute actions based on the user’s selection
case $OPTION in
    1)
        echo "Executing Initialize, Validate, Plan, and Apply steps..."
        # Public_VPC
        # cd "$WORK_DIR"/"$PUBLIC_VPC"
        cd "$WORK_DIR"/"$PRIVATE_VPC"
        echo 1 | /bin/sh ./run.sh
        # Cluster
        cd "$WORK_DIR"/"$EKS_CLUSTER"
        echo 1 | /bin/sh ./run.sh
        # Addons
        cd "$WORK_DIR"/"$ADDONS"
        echo 1 | /bin/sh ./run.sh
    ;;
    
    2)
        echo "Executing Destroy for Terraform-managed infrastructure..."
        # Addons
        cd "$WORK_DIR"/"$ADDONS"
        echo 2 | /bin/sh ./run.sh
        # Cluster
        cd "$WORK_DIR"/"$EKS_CLUSTER"
        echo 2 | /bin/sh ./run.sh
        # Public_VPC
        cd "$WORK_DIR"/"$PUBLIC_VPC"
        echo 2 | /bin/sh ./run.sh
    ;;
    
    *)
        echo "Error: Unknown option '$OPTION'. Please enter either 1 (Create) or 2 (Destroy)."
        exit 1
    ;;
esac

