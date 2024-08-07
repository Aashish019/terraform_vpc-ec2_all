variable "ami_name" {
  description = "ami id for the image"
  type        = string

}

variable "ec2_type" {
  description = "ec2 instance type"
  type        = string


}

variable "ec2_key_name" {
  description = "ec2 key name"
  type        = string


}

variable "ec2_tag_name_1" {
  description = "ec2-tag name for the image"
  type        = map(string)
  default = {
    "Name" = "newinstancePub"
  }
}
variable "ec2_tag_name_2" {
  description = "ec2-tag name for the image"
  type        = map(string)
  default = {
    "Name" = "newinstancePvt"
  }
}

variable "all_traffic_cidr" {
  description = "all traffic cidr"
  type        = string
  default     = "0.0.0.0/0"

}
