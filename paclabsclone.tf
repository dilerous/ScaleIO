provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"
  allow_unverified_ssl = true
}

module "GATEWAYvm"{
  source = "Services/Gateway"
  servers = "1"
  datastore = "PacLabs001_Boot"
  ipv4_344     = "10.237.198.170"
  ipv4_siopg1  = "192.168.10.200"
  ipv4_siopg2  = "192.168.11.200"
  root_password = "${var.root_password}"
}

module "SDSvm1"{
  source       = "Services/SDS"
  servers      = "0"
  datastore    = "PacLabs001_Boot"
  ipv4_344     = "10.237.198.171"
  ipv4_siopg1  = "192.168.10.201"
  ipv4_siopg2  = "192.168.11.201"
}

module "SDSvm2"{
  source = "Services/SDS"
  servers = "0"
  datastore = "PacLabs002_Boot"
  ipv4_344     = "10.237.198.172"
  ipv4_siopg1  = "192.168.10.202"
  ipv4_siopg2  = "192.168.11.202"
}

module "SDSvm3"{
  source = "Services/SDS"
  servers = "0"
  datastore = "PacLabs003_Boot"
  ipv4_344     = "10.237.198.173"
  ipv4_siopg1  = "192.168.10.203"
  ipv4_siopg2  = "192.168.11.203"
}
