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


resource "intersight_hyperflex_local_credential_policy" "hx-local-credential-policy" {
  name        = "${var.hx_system_name}-local-credential-policy"
  description = "terraform - Hyperflex Local Credential Policy"

  hypervisor_admin            = var.hypervisor_admin_user
  factory_hypervisor_password = var.hypervisor_default_pwd
  hypervisor_admin_pwd        = var.hypervisor_admin_pwd
  hxdp_root_pwd               = var.hxdp_root_pwd

  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.intersight_organization.results[0].moid
  }

  lifecycle {
    ignore_changes = [tags, hypervisor_admin_pwd, hxdp_root_pwd]
  }
}
