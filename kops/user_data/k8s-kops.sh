#!/bin/bash

############## Definition (Required changes) ########################################
hostname="kops-nonprod"
domain="nonprod.demo.cloud"
fqdn="$hostname.$domain"
##pub_file="k8s-kops-dev.pub"

## id_rsa_pub_content="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCw7obfuOqtLYnugMNGwG5sAzva39QZ6c+8v+VToF/5mLLe3Ry5nBl54sfkymtGE6kLCKoz434g5rC67d55HzkUrzP11v2mwzqRsFoMG/wnC03DIkQjKsNSAVS1gZ2OJSIri38nGodMv6+/Io5Tto3y+xCZiBJGUMlmAhJSId5PXBiHy+efOmBvBnBtYhGwwpZKUOy61WvFmU9AyQ/sax99OfFWL/G4nUAxAy8pGvNCrQnW9bNxlnLF7Vb3Ub1STjdosKOI53PJgxxDXImX2NX1/1ijZPJLTV2XEHnabvBSKCNsPnu1jQ2+mAR64InOhxTbhibIjvHEK3IDlG6+zWn7 rain-tidc-internal"

############## Definition (no changes) ########################################
##id_rsa_pub_file="/root/.ssh/$pub_file"
##echo "Restore id_rsa"
##echo $id_rsa_pub_content >> $id_rsa_pub_file
##chmod 600 $id_rsa_pub_file
##cat ~/$pub_file >> ~/.ssh/authorized_keys
##cp $id_rsa_pub_file /home/centos/.ssh/
##chown centos:centos /home/centos/.ssh/$pub_file

echo "Replace Hostname in /etc/sysconfig/network"
echo "HOSTNAME=$fqdn" >> /etc/sysconfig/network

echo "Set hostname"
hostnamectl set-hostname --static $fqdn
echo -e "$( hostname -I | awk '{ print $1 }' )\t$fqdn" >> /etc/hosts

#append data to a cloud.cfg file
echo "preserve_hostname: true" >> /etc/cloud/cloud.cfg

echo "stop Selinux"
setenforce 0

#system update
echo "update system"
yum update
yum install epel-release

#install others
yum install bind-utils

yum install wget

yum install screen 

yum install unzip 

#install terrrafrom v0.11.7
cd /tmp && curl -O https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip
unzip terraform_0.11.7_linux_amd64.zip -d /usr/local/bin


#install jq
echo "install jq"
cd /tmp && curl -O http://dl.fedoraproject.org/pub/epel/7/x86_64/
rpm -Uvh epel-release*rpm
yum install jq -y

#install python
echo "install python"
yum install python

#install aws cli#
cd /tmp && curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py
echo "install pip Done!"
pip install awscli

#install kops
curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops-linux-amd64
mv kops-linux-amd64 /usr/local/bin/kops

#install bash-completion
yum install bash-completion

#install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
echo "source <(kubectl completion bash)" >> ~/.bashrc

echo "Done!"