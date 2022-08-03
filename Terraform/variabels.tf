variable "aws-region" {
  description = "the AWS region in which resources are created, you must set the availability_zones variable as well if you define this value to something other than the default"
  default     = "eu-west-2"
}

variable "name" {
  description = "Name of your project."
  default = "demo"
}
