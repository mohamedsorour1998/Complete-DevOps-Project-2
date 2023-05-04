resource "aws_instance" "bastion" {
  ami           = "ami-007855ac798b5175e" # Ubuntu 22.04 LTS
  instance_type = var.instance_type
  subnet_id     = module.networking.public_subnets_ids[0]

  vpc_security_group_ids = [
    module.networking.allow_ssh_from_anywhere_security_group_id
  ]

  key_name = var.key_name

  tags = {
    Name = "${var.environment}-bastion-instance"
  }

  provisioner "local-exec" {
    command = "echo 'Bastion Host Public IP: ${self.public_ip}'"
  }
}

resource "aws_instance" "app" {
  ami           = "ami-007855ac798b5175e" # Ubuntu 22.04 LTS
  instance_type = var.instance_type
  subnet_id     = module.networking.private_subnets_ids[0]

  vpc_security_group_ids = [
    module.networking.allow_ssh_and_port_3000_from_vpc_security_group_id
  ]

  key_name = var.key_name

  tags = {
    Name = "${var.environment}-app-instance"
  }
}
# resource "aws_key_pair" "ssh" {
#   key_name   = "ssh"
#   public_key = file("./ssh.pub")


#   tags = {
#     Name = "ssh"
#   }
# }
