# Prerequisite for Terraform

* Create Route53 Private zone with "nonprod.demo.cloud"
* Create AccessKey and SecretKey to access AWS API call

**********************************

# Prerequisite for Kops

* After terraform done ssh to Kops server then install HELM

Note: If you cannot apply state to S3 please check the instance profile under EC2 then attached the new policy for S3

**********************************

# Prerequisite for K8S deployment

* Create name space "test-echo-pod"
** kubectl apply -f deployment.yaml

**********************************

email : phuwadon.potithong@gmail.com
facaebook : https://www.facebook.com/phuwadon.potithong
