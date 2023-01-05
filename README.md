# reimagined-system
Create virtual machines and join them to Active Directory Domain using Terraform and Ansible

## Requirement
Before launching ***terraform apply***, you must set parametres in following files:<br/><br/>
Specify vSphere server in **terraform.tfvars**:
```
vsphere_server = "my-vcenter-or-esxi-dnsname (ex: xxx.xxx.xxx.xxx)"
```
Active Directory authentification params in **credentials.yml**:
```
ansible_ssh_private_key: <path to ssh private key>
ad_admin_username: <username>
ad_admin_password: <secret>
AD_Domain: <AD domain name>
sudo_groups: [<List of AD groups with sudo permissions>]
sudo_users: [<List of AD users with sudo permissions>]
```
Update castomization params in **instances.tf** file<br/><br/>
Run **input_creds.sh** script for vSphere authentification<br/><br/>
## Getting Started
Before running Terraform operations, download plugins using the ***terraform init*** command:
```
terraform init
```
Check what Terraform is going to do before runninng the operation:
```
terraform plan
```
Apply changes (This action will provision our VMs):
```
terraform apply
```
Delete previously created infrastructure:
```
terraform destroy
```
> **Note**<br/>
&emsp;&emsp;Without options ***terraform destroy*** command destroys all instances!<br/>
&emsp;&emsp;For destroying specific instance use -target option:
   ```
        terraform destroy -target <vm_instance.instance-name>
   ```

