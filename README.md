# Terraform Modules Project

This project demonstrates Terraform module best practices by creating reusable modules for AWS EC2 and S3 bucket resources.

## Project Structure

```
terraform-modules/
├── modules/
│   ├── ec2/           # EC2 instance module
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── s3/            # S3 bucket module
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── main.tf            # Root configuration that calls modules
├── provider.tf        # AWS provider configuration
├── variables.tf       # Root-level variables
├── outputs.tf         # Root-level outputs
├── terraform.tfvars.example # Example terraform variables
└── README.md
```

## Modules

### EC2 Module (`modules/ec2/`)

Creates an AWS EC2 instance with customizable properties.

**Variables:**
- `instance_name` - Name of the EC2 instance (default: "my-ec2-instance")
- `instance_type` - Instance type (default: "t2.micro")
- `ami` - AMI ID (default: Amazon Linux 2)
- `availability_zone` - AZ for the instance
- `tags` - Additional tags to apply

**Outputs:**
- `instance_id` - The EC2 instance ID
- `instance_public_ip` - Public IP of the instance
- `instance_private_ip` - Private IP of the instance
- `instance_arn` - ARN of the instance

### S3 Module (`modules/s3/`)

Creates an AWS S3 bucket with versioning and ACL support.

**Variables:**
- `bucket_name` - S3 bucket name (must be globally unique)
- `environment` - Environment name (default: "dev")
- `versioning_enabled` - Enable versioning (default: false)
- `acl` - Access Control List (default: "private")
- `tags` - Additional tags to apply

**Outputs:**
- `bucket_id` - The S3 bucket ID
- `bucket_arn` - ARN of the bucket
- `bucket_region` - AWS region where bucket resides

## Usage

### 1. Clone or initialize the repository

```bash
cd terraform-modules
```

### 2. Create a terraform.tfvars file

Copy and customize the example:

```bash
cp terraform.tfvars.example terraform.tfvars
```

**Important:** Edit `terraform.tfvars` and provide:
- A unique S3 bucket name (must be globally unique across AWS)
- Customize other variables as needed

Example `terraform.tfvars`:
```hcl
aws_region = "us-east-1"
environment = "dev"

ec2_instance_name     = "web-server-1"
ec2_instance_type     = "t2.micro"
ec2_availability_zone = "us-east-1a"

s3_bucket_name        = "my-unique-bucket-prod-12345"
s3_versioning_enabled = false
s3_acl                = "private"

common_tags = {
  Project     = "TerraformModules"
  ManagedBy   = "Terraform"
  Environment = "dev"
}
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Plan the deployment

```bash
terraform plan
```

### 5. Apply the configuration

```bash
terraform apply
```

### 6. View outputs

```bash
terraform output
```

### 7. Destroy resources (when done)

```bash
terraform destroy
```

## Key Features

✅ **Modular Design** - Reusable modules for EC2 and S3  
✅ **Flexible Configuration** - Customize instances and buckets via variables  
✅ **Best Practices** - Proper separation of concerns and outputs  
✅ **Tagging** - Automatic tagging for resource management  
✅ **Version Control** - .gitignore configured for Terraform files  

## Requirements

- Terraform >= 1.0
- AWS provider >= 5.0
- AWS credentials configured (`aws configure`)

## Notes

- S3 bucket names must be globally unique across all AWS accounts
- Ensure you have appropriate AWS permissions to create EC2 and S3 resources
- Review and adjust AMI ID for your desired region
- Always run `terraform plan` before applying changes

## Troubleshooting

**Error: "S3 bucket name already exists"**
- S3 bucket names must be globally unique. Update `s3_bucket_name` in `terraform.tfvars`

**Error: "Invalid availability zone"**
- Ensure the specified AZ is available in your AWS region

**Error: Invalid AMI**
- AMI IDs are region-specific. Update the AMI ID for your target region