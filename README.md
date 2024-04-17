# Terraform projects
create terraform.tfvars and put your credentials 
domain   = "xxxxx"
username = "xxxxx"
password = "xxxxx"
region   = "xxxxx"

basic commands:
	terraform init		--> downloading plugins for provider
	terraform plan		--> refershing desired and current state , show the changes 
	terraform apply		--> applying action 
  terraform fmt     --> adjust format
  terraform validate  --> check your syntax
	terraform destroy --> Destroy All 
	terraform destroy -target flexibleengine_compute_instance_v2.basic[0] --> Destroy specific resource
  terraform refresh --> refresh current and desired state  
  terraform taint flexibleengine_compute_instance_v2.basic[0] --> will be marked with taint flag and will be destroyed and recreated on next apply 
  terraform import "resource" --> import resource which is created before using terraform to add it in tfstate file to be under terraform provisioning 
  
