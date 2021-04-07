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

# Use the hyperflex_profile module to deploy a HyperFlex cluster
module "hyperflex_profile" {
    # Using hyperflex_profile module
    source = "../../modules/hyperflex_profile"

    # Deployment specific
    # Intersight moid for the organization where policies will be created
    org_name = "my_organization"

    # Action to take on the cluster profile object
    cluster_profile_action = "No-op" 

    # Hyperflex System Name
    hx_system_name = "hx_cluster2-edge"

    # Deployment type: FI or EDGE
    hx_deployment_type = "EDGE"

    # Replication factor
    replication = 2

    # HX Cluster Management IP
    mgmt_ip_address = "10.21.0.10"

    # HX Cluster Data IP
    data_ip_address = "10.22.0.10"

    # HX DNS Servers
    dns_servers = [ 
        "8.8.8.8"
    ]

    # HX NTP Servers
    ntp_servers = [ 
        "10.11.0.1"
    ]

    # HX Domain Name
    dns_domain_name = "domain.local"

    # HX Timezone
    timezone = "Europe/Zurich"

    # HX MAC Pool Prefix
    mac_pool_prefix = "00:25:B5:CC"

    # HXDP Software Version
    hxdp_version = "4.5(1a)"

    # HX Nodes Firmware Version
    server_firmware_version = "4.1(1h)"

    # HX Installation flags
    disk_partition_cleanup = "true"
    vdi_optimization       = "false"
    laz_auto_config        = "false"
    jumbo_frames_enable    = "true"

    # HX Autosupport
    auto_support_enabled = "true"
    auto_support_email   = "email@domain.com"

    # vCenter settings
    vcenter_data_center  = "ROBO1"
    vcenter_hostname     = "hx-robo-vcenter.domain.local"
    vcenter_username     = "administrator@vsphere.local"
    vcenter_password     = "mypassword"

    # ESXi Node settings
    hypervisor_admin_user  = "root"
    hypervisor_default_pwd = "true"
    hypervisor_admin_pwd   = "mypassword"
    hxdp_root_pwd          = "mypassword"

    # Uplink speed
    uplink_speed = "10G"

    # VLANs
    vlan_id_mgmt      = 2100
    vlan_id_data      = 2200
    vlan_id_vmotion   = 2300
    vlan_id_vmnetwork = 2400

    # CIMC IP Range for Nodes
    ip_range_kvm = {
        "start_addr" : "10.21.0.31"
        "end_addr"   : "10.21.0.34"
        "netmask"    : "255.255.255.0"
        "gateway"    : "10.21.0.1"
    }

    # ESXi Hypervisor Mgmt IP Range for Nodes
    ip_range_mgmt = {
        "start_addr" : "10.21.0.61"
        "end_addr"   : "10.21.0.64"
        "netmask"    : "255.255.255.0"
        "gateway"    : "10.21.0.1"
    }

    # HXDP Mgmt IP Range for Nodes
    ip_range_hxdp = {
        "start_addr" : "10.21.0.91"
        "end_addr"   : "10.21.0.94"
        "netmask"    : "255.255.255.0"
        "gateway"    : "10.21.0.1"
    }

    # HXDP Data IP Range for Nodes
    ip_range_data = {
        "start_addr" : "10.22.0.91"
        "end_addr"   : "10.22.0.94"
        "netmask"    : "255.255.255.0"
        "gateway"    : "10.22.0.1"
    }


    hx_node_profiles = {
        # define here all your HX Nodes
        # Note: key name will be used as a suffix in the nodes hostname
        "-esx-1" = {
            "node_serial_number"   : "NODE1_SERIAL"
            "hxdp_data_ip"         : "10.22.0.91"
            "hxdp_mgmt_ip"         : "10.21.0.91"
            "hypervisor_data_ip"   : "10.22.0.61"
            "hypervisor_mgmt_ip"   : "10.21.0.61"
        }
        "-esx-2" = {
            "node_serial_number"   : "NODE2_SERIAL"
            "hxdp_data_ip"         : "10.22.0.92"
            "hxdp_mgmt_ip"         : "10.21.0.92"
            "hypervisor_data_ip"   : "10.22.0.62"
            "hypervisor_mgmt_ip"   : "10.21.0.62"
        }
        "-esx-3" = {
            "node_serial_number"   : "NODE3_SERIAL"
            "hxdp_data_ip"         : "10.22.0.93"
            "hxdp_mgmt_ip"         : "10.21.0.93"
            "hypervisor_data_ip"   : "10.22.0.63"
            "hypervisor_mgmt_ip"   : "10.21.0.63"
        }
        "-esx-4" = {
            "node_serial_number"   : "NODE4_SERIAL"
            "hxdp_data_ip"         : "10.22.0.94"
            "hxdp_mgmt_ip"         : "10.21.0.94"
            "hypervisor_data_ip"   : "10.22.0.64"
            "hypervisor_mgmt_ip"   : "10.21.0.64"
        }
    }
}
