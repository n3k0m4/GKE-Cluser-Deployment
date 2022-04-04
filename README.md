# Terraform GKE deployment

This repository is a simple deployment of a cluster in GKE with bastion in the following architecture:

<p align="center">
    <img src="docs/img/architecture.jpeg"/>
</p>

# Deployment:
To deploy the architecture:
- Create a ServiceAccount with the following permissions: `container.clusters.create`, `iam.serviceAccounts.create` and `compute.networks.create`.
- Create a json key for the ServiceAccount, save it in `secrets/secret.json`
- Modify `terraform.tfvars.example` with information of your service account, and save it as `terraform.tfvars`
- Run `chmod +x ./install.sh && ./install.sh`


<p align=center>
-
<font size="+5">DO NOT USE IN PRODUCTION</font>
-
</p>