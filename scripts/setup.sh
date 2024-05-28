#!/bin/bash

# Update and install required packages
sudo apt-get update
sudo apt-get install -y docker.io python3-pip curl

# Install Kubernetes CLI
if ! command -v kubectl &> /dev/null
then
    echo "Installing kubectl..."
    curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
else
    echo "kubectl already installed"
fi

# Install Helm
if ! command -v helm &> /dev/null
then
    echo "Installing Helm..."
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
else
    echo "Helm already installed"
fi

# Install Ansible
if ! command -v ansible &> /dev/null
then
    echo "Installing Ansible..."
    sudo apt-get install -y ansible
else
    echo "Ansible already installed"
fi

# Install Python packages
sudo pip3 install openshift boto3

# Configure AWS CLI (requires AWS CLI to be installed and configured separately)
aws eks update-kubeconfig --region us-west-2 --name hadoop-eks-cluster

# Clone the Hadoop Helm charts repository
if [ ! -d "helm-charts" ]; then
  git clone https://github.com/helm/charts.git helm-charts
fi

echo "Setup complete. You can now run the Ansible playbook to deploy the Hadoop ecosystem."
