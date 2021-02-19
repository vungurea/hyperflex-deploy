# Deploy HyperFlex Clusters

_Deploy your HyperFlex Clusters using this terraform module and Intersight_

---

> We provide this terraform module as sample code to assist you with the installation of your new HyperFlex systems. Claim your new devices into your Intersight account, define configurations for your clusters using this repository and then deploy them. It is ideal for environment where you have multiple HyperFlex clusters and you are looking for a declarative approach that allows you to define your infrasctructure through code.

## Requirements
---

* Terraform 0.13+
* intersight >= 0.1.5 (provider fetched automatically on terraform init)

## Features
---

* Create HyperFlex Cluster Profiles and Policies in Intersight
* Link policies to claimed hardware nodes
* Use Intersight organizations to group your policies
* Trigger actions: No-op / Validate / Install for your Cluster Profiles
* Standard (FI) and Edge Clusters are supported (check included examples)


## Solution Components - Cisco Products / Licenses

This module can be used with any Cisco HyperFlex hardware model and any level of licensing for HXDP or Intersight.

## Usage & Installation

Clone this repository to a machine that is able to connect to intersight.com:

    git clone https://github.com/vungurea/hyperflex-deploy

Create your cluster configuration by copying one of the included examples. Depending on your desired cluster type, take the fi or edge directory:

    cp -r infra/example-hxcluster1-fi infra/my_new_hxcluster
    cd infra/my_new_hxcluster
    mv hxcluster1.auto.tfvars my_new_hxcluster.auto.tfvars

Edit the variables file `my_new_hxcluster.auto.tfvars`. This should be the only file in which you describe the parameters for your cluster. Go through all the values carefully and make sure you don't forget to change any of the parameters. Some values cannot be changed after a cluster is deployed and will require a complete cluster reinstallation.

Create an apikey in intersight. Save the private key to a local file and then set the apikey and the path to the private key to the following environment variables:

Windows:

    set TF_VAR_apikey=<your_api_key>
    set TF_VAR_secretkeyfile=<path_to_your_secretkeyfile>

Linux/MacOS:

    export TF_VAR_apikey=<your_api_key>
    export TF_VAR_secretkeyfile=<path_to_your_secretkeyfile>

Now would be the best time to define a remote backend in case you would like to use one.

Start to run terraform init, plan & apply as you normally would.

## Documentation

A Getting Started Guide will be also shared in near future. Please post any issues or comments directly on GitHub.
