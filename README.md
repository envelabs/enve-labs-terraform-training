# Enve Labs Terraform Training
Hashicorp Terraform is an orchestration tool for resources management (Cloud, on-promise, etc.) that provides `Infrastructure as Code` definition

### initialize project
in order to config local settings and download the modules needed to interact with the infrastructure api provider (AWS, Google Cloud, Azure, etc), we need to initialize the project the first time

    terraform init


### test the project
validate the changes to be applied with an execution `plan` test

    terraform plan


### execute the plan
execute the TF code in order to achieve the desired defined state

    terraform apply


### check current status
check the current status tracked in the tfstate file

    terraform show
