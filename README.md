# Enve Labs Terraform Training
Hashicorp Terraform is an orchestration tool for resources management (Cloud, on-promise, etc.) that provides `Infrastructure as Code` definition

### AWS credentials setup
AWS credential configuration allow us to interact with the AWS API (https://docs.aws.amazon.com/cli/latest/reference/)

how to add credentials to my profile? (~/.aws/credentials)

    aws configure
    AWS Access Key ID: ***
    AWS Secret Access Key: ***
    Default region name [us-east-1]:
    Default output format [None]:


at the end of the process, your ~/.aws/credentials should have a block in init format with the credentials provided

    [default]
    aws_access_key_id = XXX
    aws_secret_access_key = XXX


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
