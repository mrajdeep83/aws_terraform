variable "public_subnet_cidr" {
  description = "CIDR Block for Public Subnet"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

// variable "public_subnet_2_cidr" {
//   description = "CIDR Block for Public Subnet 2"
//   default     = "10.0.2.0/24"
// }

variable "private_subnet_cidr" {
  description = "CIDR Block for Private Subnet"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-west-1a", "us-west-1b"]
}