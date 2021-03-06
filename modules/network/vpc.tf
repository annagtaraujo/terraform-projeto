resource "aws_vpc" "infra_vpc"{
    cidr_block = var.cidr_block
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        Name = format("%s-vpc",var.infra_name)
    }
}