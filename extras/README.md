### SSH keys process generation
In order to connect to a particular ec2 instance through ssh, credentials needs to be generated previous to the instance generation.

#### openssh

    ssh-keygen -t rsa -C <comment> -f <key_name>.pem


import your public key to AWS

    aws --region us-east-1 ec2 import-key-pair --key-name "<key_name>" --public-key-material file://<path_to_key>/<key_name>.pub

#### AWS cli

    aws --region us-east-1 ec2 create-key-pair --key-name "<key_name>"


    {
        "KeyMaterial": "-----BEGIN RSA PRIVATE KEY-----\n... n-----END RSA PRIVATE KEY-----",
        "KeyName": "<key_name>",
        "KeyFingerprint": "XX:51:fc:eb:a5:75:52:ff:ba:7f:cb:4d:57:54:89:61:3e:c1:e5:74"
    }


generate and save private key (`jq` command is required)

    aws --region us-east-1 ec2 create-key-pair --key-name <key_name> | \
    jq -r ".KeyMaterial" > <path_to_key>/<key_name>.pem


### terraform
through the `tls provider` (https://registry.terraform.io/providers/hashicorp/tls/latest), terraform allow us to create ssh keys (among other things) and store it in the local system.
This approach is NOT secure because it keeps a copy of the key generated in the state file, but is useful for fast deployment of development environments.

    resource "tls_private_key" "enve-labs-priv-key" {
      algorithm = "RSA"
      rsa_bits  = 4096    

      provisioner "local-exec" {
        command = "echo '${self.private_key_pem}' > ./enve-labs-key.pem"
        command = "echo '${self.public_key_openssh}' > ./enve-labs-key.pub"
      }
    }


upload the key to aws

    resource "aws_key_pair" "enve-labs-pub-key" {
      key_name   = "enve-labs-key"
      public_key = tls_private_key.enve-labs-priv-key.public_key_openssh
    }


commands:

    terraform apply -target tls_private_key.enve-labs-priv-key -target aws_key_pair.enve-labs-pub-key
