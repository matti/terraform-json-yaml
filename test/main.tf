locals {
  map = {
    hosts = [
      {
        role            = "master"
        address         = "35.190.177.65"
        user            = "ubuntu"
        private_address = "10.142.0.3"
      },
      {
        role            = "worker"
        address         = "35.229.87.147"
        user            = "ubuntu"
        private_address = "10.142.0.4"

        labels = {
          disk    = "ssd"
          ingress = "nginx"
        }
      },
    ]

    network = {
      service_cidr     = "10.96.0.0/12"
      pod_network_cidr = "10.32.0.0/12"
      trusted_subnets  = ["10.10.0.0/16"]
    }
  }
}

module "json2yaml" {
  source = ".."

  json = "${jsonencode(local.map)}"
}

output "rendered" {
  value = "${module.json2yaml.rendered}"
}
