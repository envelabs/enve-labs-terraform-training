resource "tls_private_key" "enve-labs-priv-key" {
  algorithm = "RSA"
  rsa_bits  = 4096

  provisioner "local-exec" {
    command = "echo '${self.private_key_pem}' > ./enve-labs-key.pem"
  }
}

resource "aws_key_pair" "enve-labs-pub-key" {
  key_name   = "enve-labs-key"
  public_key = tls_private_key.enve-labs-priv-key.public_key_openssh
}
