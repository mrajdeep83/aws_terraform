output "production_vpc_id" {
  value = aws_vpc.production-vpc.id
}

output "public_subnet_1" {
  value = element(aws_subnet.public-subnet.*.id, 1 )
}
output "public_subnet_2" {
  value = element(aws_subnet.public-subnet.*.id, 2 )
}
output "private_subnet_1" {
  value = element(aws_subnet.private-subnet.*.id, 1)
}
output "private_subnet_2" {
  value = element(aws_subnet.private-subnet.*.id, 2)
}