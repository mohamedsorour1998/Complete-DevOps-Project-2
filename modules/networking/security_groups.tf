resource "aws_security_group" "allow_ssh_from_anywhere" {
  name        = "${var.environment}-allow-ssh-from-anywhere"
  description = "Allow SSH from anywhere"
  vpc_id      = aws_vpc.main.id
}

resource "aws_security_group_rule" "allow_ssh_from_anywhere" {
  security_group_id = aws_security_group.allow_ssh_from_anywhere.id

  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group" "allow_ssh_and_port_3000_from_vpc" {
  name        = "${var.environment}-allow-ssh-and-port-3000-from-vpc"
  description = "Allow SSH and port 3000 from VPC CIDR"
  vpc_id      = aws_vpc.main.id
}

resource "aws_security_group_rule" "allow_ssh_and_port_3000_from_vpc" {
  security_group_id = aws_security_group.allow_ssh_and_port_3000_from_vpc.id

  type        = "ingress"
  from_port   = 0
  to_port     = 65535
  protocol    = "tcp"
  cidr_blocks = [aws_vpc.main.cidr_block]
}
