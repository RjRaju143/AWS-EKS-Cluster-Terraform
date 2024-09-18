#!/bin/sh

# Exit immediately if a command exits with a non-zero status and enable debug mode
set -e
set -x

EKS_CLUSTER='./environments/dev/1-eks/'
METRICS_SERVER='./environments/dev/2-metrics-server/'
EBS_CSI_DRIVER='./environments/dev/3-ebs-csi-driver/'
MANAGER_USER='./environments/dev/4-manager-user/'

# Display options to the user
echo "Terraform Operations Menu:"
echo "1. EKS cluster"
echo "2. Metrics server"
echo "3. EBS-CSI driver"
echo "4. MANAGER User"
# Prompt user to enter an option
read -p "Enter your option (1, 2, 3, 4): " OPTION

# Execute actions based on the user’s selection
case $OPTION in
  1)
    echo "EKS_CLUSTER"
    cd "$EKS_CLUSTER"
    ./run.sh
    ;;

  2)
    echo "METRICS_SERVER"

    cd "$METRICS_SERVER"
    ./run.sh
    ;;

  3)
    echo "METRICS_SERVER"

    cd "$EBS_CSI_DRIVER"
    ./run.sh
    ;;

  4)
    echo "MANAGER_USER"

    cd "$MANAGER_USER"
    ./run.sh
    ;;

  *)
    echo "Error: Unknown option '$OPTION'. Please enter either 1 or 2."
    exit 1
    ;;
esac
