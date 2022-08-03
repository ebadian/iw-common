provider "aws" {
  region     = var.aws-region
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
    encrypt = true
    key     = "terraform.tfstate"
    region  = var.aws-region
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}
