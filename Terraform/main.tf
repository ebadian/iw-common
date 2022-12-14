provider "aws" {
  region = var.aws-region
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "terraform-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "DynamoDB Terraform State Lock Table"
  }
}

terraform {
  backend "s3" {
    encrypt        = true
    key            = "terraform.tfstate"
    region         = var.aws-region
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}

module "vpc" {
  source             = "./vpc"
  name               = var.name
  cidr               = var.cidr
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  availability_zones = var.availability_zones
  environment        = var.environment
}

module "security_groups" {
  source         = "./security-groups"
  name           = var.name
  vpc_id         = module.vpc.id
  environment    = var.environment
  container_port = var.container_port
}

#module "alb" {
#  source              = "./alb"
#  name                = var.name
#  vpc_id              = module.vpc.id
#  subnets             = module.vpc.public_subnets
#  environment         = var.environment
#  alb_security_groups = [module.security_groups.alb]
#  alb_tls_cert_arn    = var.tsl_certificate_arn
#  health_check_path   = var.health_check_path
#}

module "ecr" {
  source = "./ecr"
  name = var.name
  environment = var.environment
}
