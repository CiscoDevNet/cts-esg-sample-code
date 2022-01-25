#!/bin/bash

echo "##################################################################"
echo "# $(tput setaf 2)Downloading source code.... $(tput setaf 7)####################################"
echo "##################################################################"
git clone https://github.com/CiscoDevNet/cts-esg-sample-code.git

echo "##################################################################"
echo "# $(tput setaf 2)Downloading Consul-Terraform-Sync (CTS) binary.... $(tput setaf 7)####################################"
echo "##################################################################"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    curl https://releases.hashicorp.com/consul-terraform-sync/0.4.3/consul-terraform-sync_0.4.3_linux_amd64.zip -o cts-esg-sample-code/cts/cts.zip
elif [[ "$OSTYPE" == "darwin"* ]]; then
    curl https://releases.hashicorp.com/consul-terraform-sync/0.4.3/consul-terraform-sync_0.4.3_darwin_amd64.zip -o cts-esg-sample-code/cts/cts.zip
fi
unzip cts-esg-sample-code/cts/cts.zip
rm -rf cts-esg-sample-code/cts/cts.zip

echo "##################################################################"
echo "# $(tput setaf 2)Downloading Terraform binary.... $(tput setaf 7)####################################"
echo "##################################################################"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    curl https://releases.hashicorp.com/terraform/1.1.4/terraform_1.1.4_linux_amd64.zip -o cts-esg-sample-code/pre-req/tf.zip
elif [[ "$OSTYPE" == "darwin"* ]]; then
    curl https://releases.hashicorp.com/terraform/1.1.4/terraform_1.1.4_darwin_amd64.zip -o cts-esg-sample-code/pre-req/tf.zip
unzip cts-esg-sample-code/pre-req/tf.zip
rm -rf cts-esg-sample-code/pre-req/tf.zip

echo "##################################################################"
echo "# $(tput setaf 2)Ensuring scripts are executable.... $(tput setaf 7)####################################"
echo "##################################################################"
chmod +x cts-esg-sample-code/cts/app-exec.sh
chmod +x cts-esg-sample-code/cts/app01-start.sh
chmod +x cts-esg-sample-code/cts/app02-start.sh
chmod +x cts-esg-sample-code/cts/consul-srv-start.sh
chmod +x cts-esg-sample-code/cts/cts-start.sh

echo "##################################################################"
echo "# $(tput setaf 2)Pulling Consul server container.... $(tput setaf 7)####################################"
echo "##################################################################"
docker pull consul

echo "##################################################################"
echo "# $(tput setaf 2)Building application container.... $(tput setaf 7)####################################"
echo "##################################################################"
docker build -t cts-nginx:0.1 cts-esg-sample-code/docker/.

echo ""
echo "##################################################################"
echo "# $(tput setaf 2)Source code and binaries downloaded.  Containers built. $(tput setaf 7)####################################"
echo "# $(tput setaf 2)Next Steps: $(tput setaf 7)###############################################"
echo "# $(tput setaf 6)  - Apply tenant config to fabric $(tput setaf 7)#################################################"
echo "# $(tput setaf 6)  - Start CTS binary  $(tput setaf 7)#################################################"
echo "# $(tput setaf 6)  - Run containers $(tput setaf 7)#################################################"
echo "# $(tput setaf 6)  - Start nginx on app containers $(tput setaf 7)###########################"
echo "##################################################################"⏎