variable "server_count" {
  default = 1
  type    = number
}


variable "vm_zone" {
  default = "ru-central1-b"
  type    = string
}


variable "subnet_v4_cidr_blocks" {
  default = ["10.0.10.0/24"]
  type    = list(string)
}


variable "vm_platform_id" {
  default = "standard-v1"
  type    = string
}
