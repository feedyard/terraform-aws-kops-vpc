output "vpc_id" {
  description = "id of the vpc created"
  value = "${aws_vpc.mod.id}"
}

output "vpc_cidr" {
  description = "id of the vpc created"
  value = "${aws_vpc.mod.cidr_block}"
}

output "azs" {
  description = "list of azs"
  value = "${var.azs}"
}

output "public_subnet_cidrs" {
  description = "list of public subnet cidr"
  value = ["${aws_subnet.public_subnet.*.cidr_block}"]
}

output "public_subnet_ids" {
  description = "list of public subnet ids"
  value = ["${aws_subnet.public_subnet.*.id}"]
}

output "nat_subnet_cidrs" {
  description = "list of nat subnet cidr"
  value = ["${aws_subnet.nat_subnet.*.cidr_block}"]
}

output "nat_subnet_ids" {
  description = "list of public subnet ids"
  value = ["${aws_subnet.nat_subnet.*.id}"]
}

output "internal_subnet_cidrs" {
  description = "list of internal subnet cidr"
  value = ["${aws_subnet.internal_subnet.*.cidr_block}"]
}

output "internal_subnet_ids" {
  description = "list of public subnet ids"
  value = ["${aws_subnet.internal_subnet.*.id}"]
}

output "igw_id" {
  description = ""
  value = "${aws_internet_gateway.mod.id}"
}

output "nat_eips" {
  description = ""
  value = ["${aws_eip.nateip.*.id}"]
}

output "nat_eips_public_ips" {
  description = ""
  value = ["${aws_eip.nateip.*.public_ip}"]
}

output "natgw_ids" {
  description = ""
  value = ["${aws_nat_gateway.natgw.*.id}"]
}

output "public_route_table_ids" {
  description = ""
  value = ["${aws_route_table.public.*.id}"]
}

output "nat_route_table_ids" {
  description = ""
  value = ["${aws_route_table.nat.*.id}"]
}

output "internal_route_table_ids" {
  description = ""
  value = ["${aws_route_table.internal.*.id}"]
}