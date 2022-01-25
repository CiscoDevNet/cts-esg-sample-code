terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
    }
  }
}

provider "aci" {
  username = "admin"
  password = "C1sco12345"
  url      = "https://10.10.20.14"
  insecure = true
}

resource "aci_tenant" "terraform_tenant" {
  name        = "Consul"
  description = "This tenant is created by terraform for the CTS Lab"
}

resource "aci_application_profile" "terraform_ap" {
  tenant_dn = aci_tenant.terraform_tenant.id
  name      = "esg_ap"
}

resource "aci_vrf" "terraform_vrf" {
  tenant_dn          = aci_tenant.terraform_tenant.id
  name               = "esg_vrf"
}
