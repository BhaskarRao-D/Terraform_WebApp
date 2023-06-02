resource "aws_instance" "Terraform_WebApp" {

ami = "ami-01acac09adf473073"
instance_type = "t2.micro"
key_name = "WebApp"
availability_zone = "us-west-2a"
security_groups = [ "default" ]
}