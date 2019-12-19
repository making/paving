# Paving

This repository contains Terraform templates for paving the necessary
infrastructure to deploy the Pivotal Platform to a single foundation.
The templates support AWS, vSphere, Azure, and GCP.

### Notes

- These templates support deploying Pivotal Application Service (PAS)
and Pivotal Container Service (PKS) to the same foundation.

- The templates **do not** create an Ops Manager VM but **do**
create the necessary infrastructure for the VM (security groups, keys, etc).

- These templates demonstrate a modest production deployment in two AZs on
each IaaS.

- These templates contain extremely minimal interdependence or cleverness,
to facilitate incorporating these templates into your own automation easily.

## Requirements

- [Terraform v0.12+](https://www.terraform.io/downloads.html)

## Usage

### configuration

In each IaaS directory, there is a `terraform.tfvars.example` you can copy
and modify with your configuration choices and credentials.

### plan

```
terraform plan -var-file terraform.tfvars
```

### apply

```
terraform apply -var-file terraform.tfvars
```

### outputs

```
terraform output stable_config
```

### destroy

```
terraform destroy -var-file terraform.tfvars
```



## Versioning

The semantics of the versioning of paving's releases are based on the contents
of `terraform output stable_config`. `stable_config` should always represent
the minimum necessary to install Pivotal Platform. Any other output may be
added or removed without a change in version. However, MAJOR.MINOR.PATCH should
change according to the following:
- If an output is removed, the MAJOR version should be incremented
- If an output is added, the MINOR version should be incremented
- Otherwise, the patch version should be incremented

## Customization

### Jumpbox

We demonstrate using the Ops Manager VM as the jumpbox, and therefore deploy it
in the public subnet with a ALLOWED_IPS varible to restrict it by IP. If you want to use a
jumpbox instead, you may deploy ops manager in the management subnet.

### Isolation Segments
