# CommonAWS


# Makefile
Makefiles help unify the CLI use across teams and projects.
Don't repeat yourself.

# Terraform
This project creates simple long-lived components such as VPC and ECR.
Components here are meant to be used with `terraform_remote_state`.

### Example:
```terraform
data "terraform_remote_state" "vpc" {
 backend     = "s3"
 config {
   bucket = "ae-terraform-backends-dev"
   key    = "terraform.tfstate"
   region = "eu-west-2"
 }
}

module "app" {
 source  = "./child"
 name    = "app"
 vpc_id  = "${data.terraform_remote_state.vpc.vpc_id}"
}
```


