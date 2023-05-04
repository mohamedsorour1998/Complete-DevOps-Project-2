output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnets_ids" {
  value = aws_subnet.private.*.id
}

output "public_subnets_ids" {
  value = aws_subnet.public.*.id
}

output "allow_ssh_from_anywhere_security_group_id" {
  value = aws_security_group.allow_ssh_from_anywhere.id
}

output "allow_ssh_and_port_3000_from_vpc_security_group_id" {
  value = aws_security_group.allow_ssh_and_port_3000_from_vpc.id
}
