# Devops Advanced demo

> This project is a small demo for our devops courses.

## Terraform demo

### Details:

- This project to deploy a droplet (VM) into an existing VPC on DigitalOcean
- The `user-data` is commands to install nginx into the VM that deployed in a first step

### Usage:

- First of all, you need to specific your DO token into file [terraform.tfvars](/demo-terraform/terraform.tfvars)
- After that, you can run the following command

```shell
terraform apply --autoapprove
```

## Ansible demo

### Details:


### Usages:

```shell
ansible-playbook
```