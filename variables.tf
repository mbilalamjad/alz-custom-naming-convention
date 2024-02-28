# Step 1. update version of module in main.tf file and version of provider in terraform.tf to latest

# Step 2. Update the following variables after which run the following commands
# az login
# terraform init
# terraform plan
# terraform apply

variable "root_id" {
  type    = string
  default = "contoso"
}

variable "root_name" {
  type    = string
  default = "Contoso"
}

variable "default_location" {
  type    = string
  default = "westus2"
}

variable "connectivity_resources_location" {
  type    = string
  default = "westus2"
}

variable "management_resources_location" {
  type    = string
  default = "westus2"
}

variable "tenant_id" {
  type    = string
  default = "11111111-1111-1111-1111-111111111111"
}

variable "subscription_id_connectivity" {
  type    = string
  default = "11111111-1111-1111-1111-111111111111"
}

variable "subscription_id_identity" {
  type    = string
  default = "11111111-1111-1111-1111-111111111111"
}

variable "subscription_id_management" {
  type    = string
  default = "11111111-1111-1111-1111-111111111111"
}

variable "deploy_core_landing_zones" {
  type    = bool
  default = false
}

variable "deploy_corp_landing_zones" {
  type    = bool
  default = false
}

variable "deploy_online_landing_zones" {
  type    = bool
  default = false
}

# Step 3. Update the following variable to true and udpdate settings.management.tf after which run the following commands
# terraform plan
# terraform apply
variable "deploy_management_resources" {
  type    = bool
  default = true
}

# Step 4. Update the following variable to true and udpdate settings.connectivity.tf after which run the following commands
# terraform plan
# terraform apply
variable "deploy_connectivity_resources" {
  type    = bool
  default = true
}

# Step 5. Update the following variable to true and udpdate settings.identity.tf after which run the following commands
# terraform plan
# terraform apply
variable "deploy_identity_resources" {
  type    = bool
  default = true
}