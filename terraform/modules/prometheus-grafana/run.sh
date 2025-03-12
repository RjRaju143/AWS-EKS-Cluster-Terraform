#!/bin/bash

set -x
set -e

# Directory containing the YAML files
YAML_DIR=$PWD

# Function to apply YAML files
apply_yaml() {
    for file in $1/*.yaml; do
        if [ -f "$file" ]; then
            echo "Applying $file..."
            kubectl apply -f "$file"
        else
            echo "No YAML files found in $1."
            exit 1
        fi
    done
}

# Function to delete YAML files
delete_yaml() {
    for file in $1/*.yaml; do
        if [ -f "$file" ]; then
            echo "Deleting $file..."
            kubectl delete -f "$file"
        else
            echo "No YAML files found in $1."
            exit 1
        fi
    done
}

case "$1" in
    create)
        # deploy node-exporter namespace
        apply_yaml "$YAML_DIR"

        # deploy prometheus
        apply_yaml "$YAML_DIR/prometheus"

        # deploy grafana
        apply_yaml "$YAML_DIR/grafana"
        ;;
    destroy)
        # delete node-exporter namespace
        delete_yaml "$YAML_DIR"

        # delete prometheus
        delete_yaml "$YAML_DIR/prometheus"

        # delete grafana
        delete_yaml "$YAML_DIR/grafana"
        ;;
    *)
        echo "Usage: $0 {create|destroy}"
        exit 1
        ;;
esac

echo "Operation $1 completed."
