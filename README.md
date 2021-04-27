# Deploy HyperFlex Clusters

_Deploy your HyperFlex Clusters using this terraform module and Intersight_

---

> We provide this terraform module as sample code to assist you with the installation of your new HyperFlex systems. Claim your new devices into your Intersight account, define configurations for your clusters using this repository and then deploy them. It is ideal for environments where you have multiple HyperFlex clusters and you are looking for a declarative approach of defining your infrasctructure.

## Requirements
---

* `Terraform 0.13+`
* Provider: `intersight >= 1.0.6` (provider fetched automatically on terraform init)

## Features
---

* Create HyperFlex Cluster Profiles and Policies in Intersight
* Link policies to claimed hardware nodes
* Use Intersight organizations to group your policies
* Trigger actions: No-op / Validate / Install for your Cluster Profiles
* Standard (FI) and Edge Clusters are supported (check included examples)


## Solution Components - Cisco Products / Licenses

This module can be used with any Cisco HyperFlex hardware model and any licensing tier for HXDP or Intersight.

## Usage & Installation

Clone this repository to a machine that is able to connect to your intersight instance url:

    git clone https://github.com/vungurea/hyperflex-deploy

Create your cluster configuration by copying one of the included examples. Depending on your desired cluster type, take the fi or edge example:

    cp -r infra/example-hxcluster1-fi infra/my_new_hxcluster
    cd infra/my_new_hxcluster

Edit `main.tf` file from `infra/my_new_hxcluster`. This should be the only file in which you describe the parameters for your cluster. Go through all the values carefully and make sure you get all parameters right before triggering a deployment. Some values cannot be changed after a cluster is deployed and will require a complete cluster reinstallation.

Create an apikey in your Intersight account. Save the generated apikey string and private key to a local file. Then set the following environment variables with their corresponding values:

Windows:

    set TF_VAR_apikey=<your_api_key>
    set TF_VAR_secretkeyfile=<path_to_your_secretkeyfile>

Linux/MacOS:

    export TF_VAR_apikey=<your_api_key>
    export TF_VAR_secretkeyfile=<path_to_your_secretkeyfile>

Optional: Now would be the best time to define the configuration for a remote backend in case you would like to use one.

Start with the standard terraform flow by running terraform init, plan & apply.

## Issues/Comments

Please post any issues or comments directly on GitHub.
