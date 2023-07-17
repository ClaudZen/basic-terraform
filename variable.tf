variable "environment" {
  description = "Tag que que define el ambiente"
  type = string
  default = "Develop"
}

variable "rg_name_cluster" {
  description = "Nombre del resource group donde se creara el cluster, debe estar creado previamente"
  type = string
  default = "cluster-dev"	
}

variable "cluster_name" {
  description = "Nombre del cluster"
  type = string
  default = "aks"	
}

variable "vm_replicas" {
  description = "Cantidad de nodos del cluster"
  type = number
  default = 1
}

variable "vm_size" {
  description = "Tamaño de la VM"
  type = string
  default = "Standard_B2s"	
}

variable "private_cluster" {
  description = "Define si el cluster es privado o no"
  type = bool
  default = false
}