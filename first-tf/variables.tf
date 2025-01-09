variable "tenant_id" {
  type    = string
  default = "23f8cd51-9a3f-4441-a772-73d6eaf31061"
}

variable "sub_id" {
  type    = string
  default = "373d0e1e-4813-4ec5-800b-b2957b445d58"
}

variable "resourcegroup" {
  type    = string
  default = "rg-adl-osr-first"
}

variable "location" {
  default = "japaneast"
}

variable "vnet" {
  type    = string
  default = "vnet-adl-osr-first"
}

variable "aks_cluster_names" {
  type    = string
  default = "aks-test-by-first"
}

variable "kubernetes_versions" {
  type        = string
  description = "The version of K8S to provision"
  default     = "1.30.5"
}

variable "dns_prefixs" {
  type        = string
  description = "The DNS prefix"
  default     = "private-aks-test-by-first"
}

# variable "agent_pool_name" {
#   type        = string
#   description = "Name of K8S nodes to provision"
#   default     = "default"
# }
variable "agent_pool_name1" {
  type        = string
  description = "Name of K8S nodes to provision"
  default     = "user"
}

# variable "agent_count" {
#   type        = string
#   description = "The number of K8S nodes to provision"
#   default     = 1
# }
# variable "agent_count1" {
#   type        = string
#   description = "The number of K8S nodes to provision"
#   default     = 1
# }

# variable "agent_size" {
#   type        = string
#   description = "The size of K8S nodes to provision"
#   default     = "Standard_D2s_v4"
# }

variable "tags_Sitthipon" {
  default = {
    "UserName"    = "Sitthipon Tangsakunsoemsuk",
    "CreaterName" = "Sitthipon Tangsakunsoemsuk",
    "UserEmail"   = "sittipon@wintel.co.th"
  }
}