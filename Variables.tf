variable "aws_region" {
  type = string
  default = "us-east-1"
  description = "Define a região padrão da AWS onde os recursos serão provisionados."
}

variable "project_name" {
  type = string
  default = "MechTechApi"
  description = "Especifica o nome do projeto"
}

variable "accountIdVoclabs" {
  type = string
  description = "Representa o ID da conta da AWS para o laboratório vocacional. Esta variável é obrigatória."
}

variable "accessConfig" {
  type = string
  default = "API_AND_CONFIG_MAP"
  description = "Especifica a configuração de acesso desejada, incluindo tanto a API quanto um mapa de configuração."
}
