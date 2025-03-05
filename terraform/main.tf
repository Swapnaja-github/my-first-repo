module "payroll" {
  source              = "./modules/payroll"
  ami_id              = "ami-053e5b2b49d1b2a82"  # Ensure this AMI is valid for your region
  instance_type       = "t2.micro"
  s3_bucket_name      = "swap-payroll-docs-us-east-1"
  dynamodb_table_name = "swap-PayrollDB"
}
