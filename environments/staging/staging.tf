variable "environment" {
}
variable "region" {
}
variable "access_key" {
  description = "The access key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "The secret key"
  type        = string
  sensitive   = true
}
variable "ami_id" {
}
#Ideally you wouldn't provide your keys in terraform, running 'aws configure' or setting environment variables is a better and more secure alternative
provider "aws" {
   region     = var.region
   access_key = var.access_key
   secret_key = var.secret_key
}

module "infrastructure" {
  source      = "../../modules/infrastructure"
  environment = var.environment
  region      = var.region
  ami_id      = var.ami_id
}