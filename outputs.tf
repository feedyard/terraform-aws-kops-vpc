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
    )
  }"
}