#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

echo "Updating system packages..."
sudo apt-get update -y

echo "Installing required dependencies..."
sudo apt-get install -y gnupg software-properties-common curl

echo "Adding HashiCorp GPG key..."
curl -fsSL https://apt.releases.hashicorp.com/gpg | \
  sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "Adding HashiCorp repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

echo "Updating package list..."
sudo apt-get update -y

echo "Installing Terraform..."
sudo apt-get install -y terraform

echo "Verifying Terraform installation..."
terraform -version

echo "Terraform installation completed successfully."

# chmod +x install_terraform.sh
