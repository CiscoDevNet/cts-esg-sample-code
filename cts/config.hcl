consul {
  address = "localhost:8500"
}

driver "terraform" {
  log = true
  persist_log = true
  required_providers {
    aci = {
    source =  "CiscoDevNet/aci"
    }
  }
}

terraform_provider "aci" {
  alias = "aci1"
  username = "admin"
  url  = "https://10.10.20.14"
  password = "C1sco12345"
}

buffer_period {
  min = "5s"
  max = "20s"
}

task {
  name = "cts-svc-esg"
  description = "Automatically Scale ACI Service ESGs"
  source = "CiscoDevNet/esg-nia/aci"
  providers = ["aci.aci1"]
  services = ["app"]
  variable_files = [ "input.tf"]
}