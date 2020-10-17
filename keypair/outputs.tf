output "key_pair" {
    value = aws_key_pair.production.id
}
output "key_pair_name" {
    value = aws_key_pair.production.key_name
}