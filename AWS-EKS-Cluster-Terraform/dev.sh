#!/bin/sh

# Exit immediately if a command exits with a non-zero status and enable debug mode
set -e
# set -x

ENV="dev"
WORK_DIR=$(pwd)
EKS_CLUSTER="environments/$ENV/"

if [ ! -d "$EKS_CLUSTER" ]; then
    echo "Error: Environment directory '$EKS_CLUSTER' does not exist."
    exit 1
fi

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
        # Cluster
        cd "$WORK_DIR"/"$EKS_CLUSTER"
        echo 1 | /bin/sh ./run.sh
    ;;
    
    2)
        echo "Executing Destroy for Terraform-managed infrastructure..."
        # Cluster
        cd "$WORK_DIR"/"$EKS_CLUSTER"
        echo 2 | /bin/sh ./run.sh
    ;;
    
    *)
        echo "Error: Unknown option '$OPTION'. Please enter either 1 (Create) or 2 (Destroy)."
        exit 1
    ;;
esac

