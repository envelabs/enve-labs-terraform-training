variable "region" {
  default = "us-east-1"
}

variable "enve-labs-tf-state" {
  default = "enve-labs-tf-state"
}

variable "enve-labs-tf-state-key" {
  default = "enve-labs-dev-tf-state"
}

variable "enve-labs-vpc-cidr" {
  default = "10.1.0.0/16"
}

variable "subnet-cidr-pub-a" {
  default = "10.1.1.0/24"
}

variable "subnet-cidr-pub-b" {
  default = "10.1.2.0/24"
}

variable "ssh_port" {
  default = "22"
}

variable "http_port" {
  default = "80"
}

variable "webapp_port" {
  default = "8080"
}
