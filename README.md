# Terraform project for Confluent Operator on GKE
This project using terraform supported by different providers (google cloud platform, helm, kubernetes) to leverage Confluent Operator on Kubernetes environment, specifically on Google Kubernetes Engine.

## Getting Started

### Prerequisites
* Prepare a GCP project, enable GKE API
* Provsion appropriate service account credential, download and name it as **credential.json** under *credentials* folder 
* Install client tools in your cloud shell 
    * kubectl (v1.13.11)
    * helm (v2.9.0)
    * terraform (v0.12.9)
    * terragrunt (v0.21.1) [optional]
* Prepare a DNS from your dns registry, create a managed zone in cloud DNS of your GCP project, and add google dns nameservers into your dns registry


### Installing 
All the following steps will be executed via cloud shell, since this project includes several different modules, you can execute them one by one in correct order using terraform or execute them all together using terragrunt.

#### Checkout the project using HTTPS 
`git clone git@github.com:CharlieFng/GCP_Terraform.git`

### Installing as individual terraform project

#### Step1: Provision a GKE cluster and enable authentication by updating kube config in cloudshell 
* CD into subfolder **confluent/gke** [If you already have a gke cluster, you can skip this step]
* Update variables in **variables.tf** with your environment values
* `terraform init && terraform plan && terraform apply`

#### Step2: Provsion K8s objects (service account for tiller, namespace for operator)
* CD into subfolder **confluent/kubernetes** 
* Update variables in **variables.tf** with your environment values
* `terraform init && terraform plan && terraform apply`

#### Step3: Install Confluent Stack via helm and tiller
* CD into subfolder **confluent/helm** 
* Update variables in **variables.tf** with your environment values
* `terraform init && terraform plan && terraform apply`
* Check [Deploying Confluent Operator and Confluent Platform](https://docs.confluent.io/current/installation/operator/co-deployment.html) as manual steps for reference

#### Step4: Create A records for subdomain mapping in Cloud DNS 
* CD into subfolder **confluent/dns** 
* Update variables in **variables.tf** with your environment values
* `terraform init && terraform plan && terraform apply`
* If you want use IP address only, you can skip this step


### Installing all together as terragrunt project
* Update variables in **variables.tf** with your environment values in each subfolder 
* CD into subfolder **confluent** 
* `terragrunt apply-all`


