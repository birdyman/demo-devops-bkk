# Prerequisite for Terraform

* Create Route53 Private zone with "nonprod.demo.cloud"
* Create AccessKey and SecretKey to access AWS API call


terraform.tfvar
- fill AccessKey and SecretKey
  - access_key  = "[AccessKey]"
  - secret_key  = "[SecretKey]"
- fill 
  - route53_private_id = "[R53-ZONE-ID]"
**********************************

# Prerequisite for Kops

* After terraform done ssh to Kops server then install HELM

Note: If you cannot apply state to S3 please check the instance profile under EC2 then attached the new policy for S3

* Use kops-parameter to create K8S cluster

**********************************

# Prerequisite for K8S deployment

* Create name space "test-echo-pod"
* kubectl apply -f deployment.yaml

**********************************

# Install Monitor and ingress via HELM

helm install  stable/nginx-ingress --name nginx-ingress --namespace nginx-ingress

helm repo add coreos https://s3-eu-west-1.amazonaws.com/coreos-charts/stable/
helm install coreos/prometheus-operator --name prometheus-operator --namespace monitoring
helm install coreos/kube-prometheus --name kube-prometheus --set global.rbacEnable=true --namespace monitoring

Note: Aditional configuration for Prometheus and Ingress nginx please checkout more on chart
**********************************

email : phuwadon.potithong@gmail.com
facaebook : https://www.facebook.com/phuwadon.potithong
