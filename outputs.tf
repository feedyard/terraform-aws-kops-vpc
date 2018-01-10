# id of the vpc created
output "vpc_id" {
  value = "${aws_vpc.mod.id}"
}

# cidr block of vpc created
output "vpc_cidr" {
  value = "${aws_vpc.mod.cidr_block}"
}

# list of azs
output "azs" {
  value = "${var.azs}"
}

# list of public subnet cidr blocks
output "public_subnet_cidrs" {
  value = ["${aws_subnet.public_subnet.*.cidr_block}"]
}
# list of public subnet ids
output "public_subnet_ids" {
  value = ["${aws_subnet.public_subnet.*.id}"]
}

# list of nat subnet cidr blocks
output "nat_subnet_cidrs" {
  value = ["${aws_subnet.nat_subnet.*.cidr_block}"]
}

# list of nat subnet ids
output "nat_subnet_ids" {
  value = ["${aws_subnet.nat_subnet.*.id}"]
}

# list of internal subnet cidr blocks
output "internal_subnet_cidrs" {
  value = ["${aws_subnet.internal_subnet.*.cidr_block}"]
}

# list of internal subnet ids
output "internal_subnet_ids" {
  value = ["${aws_subnet.internal_subnet.*.id}"]
}

# internet gateway id
output "igw_id" {
  value = "${aws_internet_gateway.mod.id}"
}

# list of nat gateway internal ip addresses
output "nat_eips" {
  value = ["${aws_eip.nateip.*.id}"]
}

# list of net gateway public ip addresses
output "nat_eips_public_ips" {
  value = ["${aws_eip.nateip.*.public_ip}"]
}

# list of nat gateway ids
output "natgw_ids" {
  value = ["${aws_nat_gateway.natgw.*.id}"]
}

# list of public routing table ids
output "public_route_table_ids" {
  value = ["${aws_route_table.public.*.id}"]
}

# list of nat routing table ids
output "nat_route_table_ids" {
  value = ["${aws_route_table.nat.*.id}"]
}

# list of internal routing table ids
output "internal_route_table_ids" {
  value = ["${aws_route_table.internal.*.id}"]
}

# maps currently used by kops pipeline
output "vpc" {
  value = "${
     map(
        "id", "${aws_vpc.mod.id}",
        "cidr", "${aws_vpc.mod.cidr_block}",
       )
     }"
}

output "public_subnet_objects" {
  value = "${
   map(
       "${aws_subnet.public_subnet.0.tags.Name}" , map(
          "id", "${aws_subnet.public_subnet.0.id}",
          "az", "${aws_subnet.public_subnet.0.availability_zone}",
          "cidr", "${aws_subnet.public_subnet.0.cidr_block}",
          "name", "${aws_subnet.public_subnet.0.tags.Name}"
        ),
        "${aws_subnet.public_subnet.1.tags.Name}" , map(
          "id", "${aws_subnet.public_subnet.1.id}",
          "az", "${aws_subnet.public_subnet.1.availability_zone}",
          "cidr", "${aws_subnet.public_subnet.1.cidr_block}",
          "name", "${aws_subnet.public_subnet.1.tags.Name}"
        ),
        "${aws_subnet.public_subnet.2.tags.Name}" , map(
          "id", "${aws_subnet.public_subnet.2.id}",
          "az", "${aws_subnet.public_subnet.2.availability_zone}",
          "cidr", "${aws_subnet.public_subnet.2.cidr_block}",
          "name", "${aws_subnet.public_subnet.2.tags.Name}"
        ),
        "${aws_subnet.public_subnet.3.tags.Name}" , map(
          "id", "${aws_subnet.public_subnet.3.id}",
          "az", "${aws_subnet.public_subnet.3.availability_zone}",
          "cidr", "${aws_subnet.public_subnet.3.cidr_block}",
          "name", "${aws_subnet.public_subnet.3.tags.Name}"
        ),
    )
  }"
}

output "nat_subnet_objects" {

  value = "${
   map(
       "${aws_subnet.nat_subnet.0.tags.Name}" , map(
          "id", "${aws_subnet.nat_subnet.0.id}",
          "az", "${aws_subnet.nat_subnet.0.availability_zone}",
          "cidr", "${aws_subnet.nat_subnet.0.cidr_block}",
          "name", "${aws_subnet.nat_subnet.0.tags.Name}"
        ),
        "${aws_subnet.nat_subnet.1.tags.Name}" , map(
          "id", "${aws_subnet.nat_subnet.1.id}",
          "az", "${aws_subnet.nat_subnet.1.availability_zone}",
          "cidr", "${aws_subnet.nat_subnet.1.cidr_block}",
          "name", "${aws_subnet.nat_subnet.1.tags.Name}"
        ),
        "${aws_subnet.nat_subnet.2.tags.Name}" , map(
          "id", "${aws_subnet.nat_subnet.2.id}",
          "az", "${aws_subnet.nat_subnet.2.availability_zone}",
          "cidr", "${aws_subnet.nat_subnet.2.cidr_block}",
          "name", "${aws_subnet.nat_subnet.2.tags.Name}"
        ),
        "${aws_subnet.nat_subnet.3.tags.Name}" , map(
          "id", "${aws_subnet.nat_subnet.3.id}",
          "az", "${aws_subnet.nat_subnet.3.availability_zone}",
          "cidr", "${aws_subnet.nat_subnet.3.cidr_block}",
          "name", "${aws_subnet.nat_subnet.3.tags.Name}"
        ),
    )
  }"
}


output "internal_subnet_objects" {
  value = "${
   map(
       "${aws_subnet.internal_subnet.0.tags.Name}" , map(
          "id", "${aws_subnet.internal_subnet.0.id}",
          "az", "${aws_subnet.internal_subnet.0.availability_zone}",
          "cidr", "${aws_subnet.internal_subnet.0.cidr_block}",
          "name", "${aws_subnet.internal_subnet.0.tags.Name}"
        ),
        "${aws_subnet.internal_subnet.1.tags.Name}" , map(
          "id", "${aws_subnet.internal_subnet.1.id}",
          "az", "${aws_subnet.internal_subnet.1.availability_zone}",
          "cidr", "${aws_subnet.internal_subnet.1.cidr_block}",
          "name", "${aws_subnet.internal_subnet.1.tags.Name}"
        ),
        "${aws_subnet.internal_subnet.2.tags.Name}" , map(
          "id", "${aws_subnet.internal_subnet.2.id}",
          "az", "${aws_subnet.internal_subnet.2.availability_zone}",
          "cidr", "${aws_subnet.internal_subnet.2.cidr_block}",
          "name", "${aws_subnet.internal_subnet.2.tags.Name}"
        ),
        "${aws_subnet.internal_subnet.3.tags.Name}" , map(
          "id", "${aws_subnet.internal_subnet.3.id}",
          "az", "${aws_subnet.internal_subnet.3.availability_zone}",
          "cidr", "${aws_subnet.internal_subnet.3.cidr_block}",
          "name", "${aws_subnet.internal_subnet.3.tags.Name}"
        ),
    )
  }"
}