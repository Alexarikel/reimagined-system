module "vm1" {
  source = "../modules_terraform/"
  vm_name = "k8s1"
  disk_size = 40
  vm_ip = "192.168.5.40"
  vm_cidr = 24
  default_gw = "192.168.5.254"
  dns_list = ["192.168.5.20","192.168.5.254"]
  domain_name = "druid.ml"
  memory = 2048
  cpu_number = 2
}

module "vm2" {
  source = "../modules_terraform/"
  vm_name = "k8s2"
  disk_size = 40
  vm_ip = "192.168.5.41"
  vm_cidr = 24
  default_gw = "192.168.5.254"
  dns_list = ["192.168.5.20","192.168.5.254"]
  domain_name = "druid.ml"
  memory = 2048
  cpu_number = 2
}

module "vm3" {
  source = "../modules_terraform/"
  vm_name = "k8s3"
  disk_size = 40
  vm_ip = "192.168.5.42"
  vm_cidr = 24
  default_gw = "192.168.5.254"
  dns_list = ["192.168.5.20","192.168.5.254"]
  domain_name = "druid.ml"
  memory = 2048
  cpu_number = 2
}

module "vm4" {
  source = "../modules_terraform/"
  vm_name = "k8s4"
  disk_size = 40
  vm_ip = "192.168.5.43"
  vm_cidr = 24
  default_gw = "192.168.5.254"
  dns_list = ["192.168.5.20","192.168.5.254"]
  domain_name = "druid.ml"
  memory = 2048
  cpu_number = 2
}

module "vm5" {
  source = "../modules_terraform/"
  vm_name = "k8s5"
  disk_size = 40
  vm_ip = "192.168.5.44"
  vm_cidr = 24
  default_gw = "192.168.5.254"
  dns_list = ["192.168.5.20","192.168.5.254"]
  domain_name = "druid.ml"
  memory = 2048
  cpu_number = 2
}
