# Terraform

Turn your infrastructure into code.

# Stuff you want to protect 

You always want to keep the following files and directories from being version controlled, and should add them to a `.gitignore` file:

```
.terraform
*.tfstate
*.tfstate.backup
*.backup
terraform.tfstate.backup
```

If you're working in a team based environment, you want to keep these files stored on a secured S3 bucket, or some other type of access-based system, such as Hashicorp Vault, etc.

# Notes

Just some notes on various thoughts related to infrastructure design and development. 

**Load Balancers:** you can use Amazon's ELB or use Nginx to handle load balancing between the EC2 instances you're using.