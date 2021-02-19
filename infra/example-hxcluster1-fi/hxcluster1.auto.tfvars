
# Note: Please make sure that all the below values are correct before you start to deploy your sytem.
# A cluster deployed with wrong values may fail installation. Wrong values cannot be changed after the 
# system will be deployed so please make the effort to get all of them right before deployment.


# Intersight moid for the organization where policies will be created
org_name = "my_organization"

# Action to take on the cluster profile object
cluster_profile_action = "No-op" 

# Hyperflex System Name
hx_system_name = "hx_cluster1-dc"

# Deployment type: FI or EDGE
hx_deployment_type = "FI"

# Replication factor
replication: 3

# HX Cluster Management IP
mgmt_ip_address = "10.11.0.10"

# HX Cluster Data IP
data_ip_address = "10.12.0.10"

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
hxdp_version = "4.0(2c)"

# HX Nodes Firmware Version
server_firmware_version = "4.0(4h)"

# HX Installation flags
disk_partition_cleanup = "true"
vdi_optimization       = "false"
laz_auto_config        = "false"
jumbo_frames_enable    = "true"

# HX Autosupport
auto_support_enabled = "true"
auto_support_email   = "email@domain.com"

# vCenter settings
vcenter_data_center  = "DC1"
vcenter_hostname     = "hx-dc-vcenter.domain.local"
vcenter_username     = "administrator@vsphere.local"
vcenter_password     = "mypassword"

# ESXi Node settings
hypervisor_admin_user  = "root"
hypervisor_default_pwd = "true"
hypervisor_admin_pwd   = "mypassword"
hxdp_root_pwd          = "mypassword"

# Uplink speed
uplink_speed = "default"

# VLANs
vlan_id_mgmt      = 1100
vlan_id_data      = 1200
vlan_id_vmotion   = 1300
vlan_id_vmnetwork = 1400

# CIMC IP Range for Nodes
ip_range_kvm = {
    "start_addr" : "10.11.0.31"
    "end_addr"   : "10.11.0.34"
    "netmask"    : "255.255.255.0"
    "gateway"    : "10.11.0.1"
}

# ESXi Hypervisor Mgmt IP Range for Nodes
ip_range_mgmt = {
    "start_addr" : "10.11.0.61"
    "end_addr"   : "10.11.0.64"
    "netmask"    : "255.255.255.0"
    "gateway"    : "10.11.0.1"
}

# HXDP Mgmt IP Range for Nodes
ip_range_hxdp = {
    "start_addr" : "10.11.0.91"
    "end_addr"   : "10.11.0.94"
    "netmask"    : "255.255.255.0"
    "gateway"    : "10.11.0.1"
}

# HXDP Data IP Range for Nodes
ip_range_data = {
    "start_addr" : "10.12.0.91"
    "end_addr"   : "10.12.0.94"
    "netmask"    : "255.255.255.0"
    "gateway"    : "10.12.0.1"
}


"hx_node_profiles" = {
    # define here all your HX Nodes
    # Note: key name will be used as a suffix in the nodes hostname
    "-esx-1" = {
        "node_cimc_ip_address" : "10.11.0.31"
        "hxdp_data_ip"         : "10.12.0.91"
        "hxdp_mgmt_ip"         : "10.11.0.91"
        "hypervisor_data_ip"   : "10.12.0.61"
        "hypervisor_mgmt_ip"   : "10.11.0.61"
    }
    "-esx-2" = {
        "node_cimc_ip_address" : "10.11.0.32"
        "hxdp_data_ip"         : "10.12.0.92"
        "hxdp_mgmt_ip"         : "10.11.0.92"
        "hypervisor_data_ip"   : "10.12.0.62"
        "hypervisor_mgmt_ip"   : "10.11.0.62"
    }
    "-esx-3" = {
        "node_cimc_ip_address" : "10.11.0.33"
        "hxdp_data_ip"         : "10.12.0.93"
        "hxdp_mgmt_ip"         : "10.11.0.93"
        "hypervisor_data_ip"   : "10.12.0.63"
        "hypervisor_mgmt_ip"   : "10.11.0.63"
    }
    "-esx-4" = {
        "node_cimc_ip_address" : "10.11.0.34"
        "hxdp_data_ip"         : "10.12.0.94"
        "hxdp_mgmt_ip"         : "10.11.0.94"
        "hypervisor_data_ip"   : "10.12.0.64"
        "hypervisor_mgmt_ip"   : "10.11.0.64"
    }
}