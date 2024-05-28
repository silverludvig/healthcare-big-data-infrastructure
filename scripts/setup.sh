#!/bin/bash

set -e

# Update and install required packages
echo "Updating system and installing required packages..."
sudo apt-get update
sudo apt-get install -y docker.io python3-pip curl

# Install Kubernetes CLI
if ! command -v kubectl &> /dev/null
then
  echo "Installing Kubernetes CLI..."
  curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
  chmod +x ./kubectl
  sudo mv ./kubectl /usr/local/bin/kubectl
else
  echo "Kubernetes CLI already installed."
fi

# Install Helm
if ! command -v helm &> /dev/null
then
  echo "Installing Helm..."
  curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
else
  echo "Helm already installed."
fi

# Install Ansible
if ! command -v ansible &> /dev/null
then
  echo "Installing Ansible..."
  sudo pip3 install ansible
else
  echo "Ansible already installed."
fi

# Install Terraform
if ! command -v terraform &> /dev/null
then
  echo "Installing Terraform..."
  wget https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip
  unzip terraform_1.0.0_linux_amd64.zip
  sudo mv terraform /usr/local/bin/
  rm terraform_1.0.0_linux_amd64.zip
else
  echo "Terraform already installed."
fi

echo "Setup complete. Please configure AWS CLI and run Terraform and Ansible scripts as described in the documentation."
