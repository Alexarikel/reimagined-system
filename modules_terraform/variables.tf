variable "ssh_user" { 
  description = "Username in the template with Sudo permissions"
  default = "alexa"
}

variable "datacenter" { 
  description = "Datacenter name in vCenter"
  default = "Datacenter"
}

variable "datastore" { 
  description = "datastore name in vCenter"
  default = "datastore1"  
}

variable "cluster" {  
  description = "Cluster name in vCenter"
  default = "cls"
}

variable "network" { 
  description = "Port Group new VM(s) will use"
  default = "T"
}

variable "vmtemp" { 
  description = "VMware Template Name"
  default = "vmtemp"
}

variable "vm_name" { 
  description = "New VM Name"
}

variable "vm_ip" { 
  description = "IP Address to assign to VM"
}

variable "vm_cidr" { 
  description = "CIDR Block for VM"
}

variable "cpu_number" { 
  description = "How many vCPUs do you want?"
  default = 2
}

variable "memory" { 
  description = "RAM in MB"
  default = 2048
}

variable "default_gw" { 
  description = "Default Gateway"
}

variable "domain_name" {
  default = "druid.ml"
}

variable "disk_size" {
  description = "Storage in GB"
  default = 40
}

variable "dns_list" {
  description = "DNS servers"
}
