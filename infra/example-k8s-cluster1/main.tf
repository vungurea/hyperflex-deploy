# Copyright (c) 2021 Cisco and/or its affiliates.

# This software is licensed to you under the terms of the Cisco Sample
# Code License, Version 1.1 (the "License"). You may obtain a copy of the
# License at

#                https://developer.cisco.com/docs/licenses

# All use of the material herein must be in accordance with the terms of
# the License. All rights not expressly granted by the License are
# reserved. Unless required by applicable law or agreed to separately in
# writing, software distributed under the License is distributed on an "AS
# IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
# or implied.


# Declare required provider
provider "intersight" {
  apikey    = var.apikey
  secretkey = var.secretkeyfile
  endpoint  = "intersight.com"
}

# Use the kubernetes_profile module to deploy a k8s cluster
module "kubernetes_profile" {
  # Using hyperflex_profile module
  source = "../../modules/kubernetes_profile"

  # Deployment specific
  # Intersight moid for the organization where policies will be created
  org_name = "WLSN"

  # Action to take on the cluster profile object
  cluster_profile_action = "No-op"

  # Cluster Name
  cluster_name = "test-cluster"

  # Cluster Version
  cluster_version = "v1.19.5"

  load_balancer_count = 1
  ssh_user = "iksadmin"
  ssh_keys = ["ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBACNXzYWF/C7oqrrKTGYOLk4bbZFU0PvaPw0rG2QCLnHIkNekYysebu+7OqU7HoYfVEt9omtCGtH3epoy5V1Wut+ggARZ80Om/e5T6R8iXzR2WSoKrmS9rf3KIQ4k/DzVo9ML+EGF0efxk4XPYRRaJUL0e+ZoXgurL5d+SkiXp/nTC5gpg== iksadmin@fakehostaname"]

  root_ca_registries = null # [""]
  unsigned_registries = null # [""]

  # POD and Service cidr ranges
  pod_cidr     = "192.168.0.0/16"
  service_cidr = "10.96.0.0/12"

  # CNI type
  cni_type = "Calico"

  # size for node_profile
  controlplane_desired_size = 1
  worker_desired_size = 3
  worker_max_size = 3

  # DNS Servers
  dns_servers = [
    "8.8.8.8"
  ]

  # NTP Servers
  ntp_servers = [
    "10.11.0.1"
  ]

  # Domain Name
  dns_domain_name = "ceclabs.local"

  # Timezone
  timezone = "Europe/Zurich"

  # IP Pool
  ip_pool = {
    from          = "10.24.0.190"
    size          = "10"
    netmask       = "255.255.255.0"
    gateway       = "10.24.0.1"
    primary_dns   = ""
    secondary_dns = ""
  }

  # Infrastructure Target
  infra_target = {
    target_name   = "hxlab-vcenter.ceclabs.local"
    datastore     = "hxlab-hyperflex"
    cluster       = "DS01"
    resource_pool = ""
    password      = "x"
  }
  infra_target_portgroup = ["hxlab-vmnetwork-2400"]

  # VM Instance Parameters
  vminstance_cpu = 4
  vminstance_disk_size = 40
  vminstance_memory = 16384
}
