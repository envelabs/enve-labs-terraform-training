# enve-labs-terraform-training
`terrarom` is an orchestration tool that provides support for infrastructure as code definition for resources management

### initialize project
in order to config local settings and download the modules needed to interact with the infrastructure api providers (AWS, Google Cloud, Azure, etc), we need to initialize the project the first time
```
terraform init
```

### test the project
in order to validate beforehand the TF code and what we are going to deploy, we `plan` the execution of any changes
```
terraform plan
```

### execute the plan
execute the TF code in order to achieve the desired defined state
```
terraform apply
```

### check current status
check the current status tracked in the tfstate file
```
terraform show
```
