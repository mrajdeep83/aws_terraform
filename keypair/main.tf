resource "aws_key_pair" "production" {
    key_name = "rajdeep_aws_key"
    public_key = file(var.ssh_pubkey_file)
}