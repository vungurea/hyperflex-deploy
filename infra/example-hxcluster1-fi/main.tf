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

# Declare required provider and use the hyperflex_profile module to deploy
# a HyperFlex cluster

provider "intersight" {
    apikey    = var.apikey
    secretkey = var.secretkeyfile
    endpoint  = "intersight.com"
}

module "hyperflex_profile" {
    source = "../../modules/hyperflex_profile"

    org_name = var.org_name
    cluster_profile_action = var.cluster_profile_action
    hx_system_name = var.hx_system_name
    hx_deployment_type = var.hx_deployment_type
    replication = var.replication
    mgmt_ip_address = var.mgmt_ip_address
    data_ip_address = var.data_ip_address
    timezone = var.timezone
    dns_servers = var.dns_servers
    ntp_servers = var.ntp_servers
    vdi_optimization = var.vdi_optimization
    dns_domain_name = var.dns_domain_name
    disk_partition_cleanup = var.disk_partition_cleanup
    laz_auto_config = var.laz_auto_config
    hxdp_version = var.hxdp_version
    server_firmware_version = var.server_firmware_version
    auto_support_enabled = var.auto_support_enabled
    auto_support_email = var.auto_support_email
    vcenter_data_center = var.vcenter_data_center
    vcenter_hostname = var.vcenter_hostname
    vcenter_username = var.vcenter_username
    vcenter_password = var.vcenter_password
    jumbo_frames_enable = var.jumbo_frames_enable
    uplink_speed = var.uplink_speed
    vlan_id_mgmt = var.vlan_id_mgmt
    vlan_id_vmotion = var.vlan_id_vmotion
    vlan_id_vmnetwork = var.vlan_id_vmnetwork
    vlan_id_data = var.vlan_id_data
    ip_range_kvm = var.ip_range_kvm
    ip_range_mgmt = var.ip_range_mgmt
    ip_range_hxdp = var.ip_range_hxdp
    ip_range_data = var.ip_range_data
    mac_pool_prefix = var.mac_pool_prefix
    hypervisor_admin_user = var.hypervisor_admin_user
    hypervisor_default_pwd = var.hypervisor_default_pwd
    hypervisor_admin_pwd = var.hypervisor_admin_pwd
    hxdp_root_pwd = var.hxdp_root_pwd
    hx_node_profiles = var.hx_node_profiles
}