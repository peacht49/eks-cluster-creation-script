#!/bin/bash

# Function to install eksctl 
install_eksctl() {
  if ! command -v eksctl &> /dev/null
  then 
    read -p "Enter your architecture (e.g., amd64 or arm64): " ARCH
    PLATFORM=$(uname -s)_$ARCH
    echo "Installing eksctl at /usr/local/bin..."
    curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
    tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
    sudo mv /tmp/eksctl /usr/local/bin
    echo "eksctl version: $(eksctl version)"
  else
    echo "eksctl successfully installed"
  fi
}

# Function to install kubectl
install_kubectl() {
  if ! command -v kubectl &> /dev/null
  then
    echo "Installing kubectl at /usr/local/bin..."
    latest_kubectl_version=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
    curl -LO "https://storage.googleapis.com/kubernetes-release/release/${latest_kubectl_version}/bin/linux/${ARCH}/kubectl"
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
    kubectl version --client
  else
    echo "kubectl is installed"
  fi
}

install_eksctl
install_kubectl

# Prompt
echo "Enter the following details to create your EKS cluster:"
read -p "Cluster Name (e.g., my-cluster): " cluster_name
read -p "Node Instance Type (e.g., t3.medium): " node_type
read -p "Min Nodes (e.g., 1): " min_nodes
read -p "Max Nodes (e.g., 4): " max_nodes
read -p "Number of Desired Nodes (e.g., 2): " desired_nodes

# Confirmation
echo "You have entered the following values:"
echo "Cluster Name: $cluster_name"
echo "Region: $region"
echo "Node Instance Type: $node_type"
echo "Min Nodes: $min_nodes"
echo "Max Nodes: $max_nodes"
echo "Desired Nodes: $desired_nodes"

# Verify region
echo "Current region is $(aws configure get region) , do you want to deploy here?"
read -p "Y/N: " answer

if [[ "$answer" == "Y" ]]; then
  region=$(aws configure get region)
  eksctl create cluster \
    --name "$cluster_name" \
    --region "$region" \
    --nodegroup-name "standard-workers" \
    --node-type "$node_type" \
    --nodes "$desired_nodes" \
    --nodes-min "$min_nodes" \
    --nodes-max "$max_nodes" \
    --managed \
    --region "$region" 
  elif [[ "$answer" == "N" ]]; then
    read -p "Input region: " region
    eksctl create cluster \
    --name "$cluster_name" \
    --region "$region" \
    --nodegroup-name "standard-workers" \
    --node-type "$node_type" \
    --nodes "$desired_nodes" \
    --nodes-min "$min_nodes" \
    --nodes-max "$max_nodes" \
    --managed \
    --region "$region" 
  else
    echo "Input Y or N only"
fi 

# Configure kubectl to access cluster once created -1
aws eks --region $region update-kubeconfig --name $(eksctl get clusters --output json | jq -r '.[0].name')

