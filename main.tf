resource "aws_vpc" "mod" {
  cidr_block           = "${var.cidr}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support   = "${var.enable_dns_support}"
  tags                 = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}

# public subnets
resource "aws_subnet" "public_subnet" {
  vpc_id            = "${aws_vpc.mod.id}"
  cidr_block        = "${var.public_subnets[count.index]}"
  availability_zone = "${element(var.azs, count.index)}"
  count             = "${length(var.public_subnets)}"
  tags              = "${merge(var.tags, map("Name", format("%s-public-subnet-%s", var.name, element(var.azs, count.index))))}"

  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"
}

resource "aws_internet_gateway" "mod" {
  vpc_id = "${aws_vpc.mod.id}"
  tags   = "${merge(var.tags, map("Name", format("%s-igw", var.name)))}"
}

resource "aws_route_table" "public" {
  vpc_id           = "${aws_vpc.mod.id}"
  propagating_vgws = ["${var.public_propagating_vgws}"]
  tags             = "${merge(var.tags, map("Name", format("%s-rt-public", var.name)))}"
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.mod.id}"
}

resource "aws_route_table_association" "public" {
  count          = "${length(var.public_subnets)}"
  subnet_id      = "${element(aws_subnet.public_subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}

# nat subnets
resource "aws_subnet" "nat_subnet" {
  vpc_id            = "${aws_vpc.mod.id}"
  cidr_block        = "${var.nat_subnets[count.index]}"
  availability_zone = "${element(var.azs, count.index)}"
  count             = "${length(var.nat_subnets)}"
  tags              = "${merge(var.tags, map("Name", format("%s-nat-subnet-%s", var.name, element(var.azs, count.index))))}"
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = "${element(aws_eip.nateip.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.public_subnet.*.id, count.index)}"
  count         = "${length(var.azs) * lookup(map(var.enable_nat_gateway, 1), "true", 0)}"

  depends_on = ["aws_internet_gateway.mod"]
}

resource "aws_eip" "nateip" {
  vpc   = true
  count = "${length(var.azs) * lookup(map(var.enable_nat_gateway, 1), "true", 0)}"
}

resource "aws_route_table" "nat" {
  vpc_id           = "${aws_vpc.mod.id}"
  propagating_vgws = ["${var.private_propagating_vgws}"]
  count            = "${length(var.azs)}"
  tags             = "${merge(var.tags, map("Name", format("%s-rt-nat-%s", var.name, element(var.azs, count.index))))}"
}

resource "aws_route" "nat_gateway" {
  route_table_id         = "${element(aws_route_table.nat.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${element(aws_nat_gateway.natgw.*.id, count.index)}"
  count                  = "${length(var.azs) * lookup(map(var.enable_nat_gateway, 1), "true", 0)}"
}

resource "aws_route_table_association" "nat_subnet" {
  count          = "${length(var.nat_subnets)}"
  subnet_id      = "${element(aws_subnet.nat_subnet.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.nat.*.id, count.index)}"
}

# internal subnets
resource "aws_subnet" "internal_subnet" {
  vpc_id            = "${aws_vpc.mod.id}"
  cidr_block        = "${var.internal_subnets[count.index]}"
  availability_zone = "${element(var.azs, count.index)}"
  count             = "${length(var.internal_subnets)}"
  tags              = "${merge(var.tags, map("Name", format("%s-internal-subnet-%s", var.name, element(var.azs, count.index))))}"
}

resource "aws_route_table" "internal" {
  vpc_id           = "${aws_vpc.mod.id}"
  propagating_vgws = ["${var.private_propagating_vgws}"]
  count            = "${length(var.azs)}"
  tags             = "${merge(var.tags, map("Name", format("%s-rt-internal-%s", var.name, element(var.azs, count.index))))}"
}

resource "aws_route_table_association" "internal" {
  count          = "${length(var.internal_subnets)}"
  subnet_id      = "${element(aws_subnet.internal_subnet.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.internal.*.id, count.index)}"
}