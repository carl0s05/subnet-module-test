variable "vpc_id" {
  description = "Identificador de la VPC en la que se desplegará la subnet"
  type        = string
}
variable "subnet_cidr_block" {
  description = "Bloque CIDR que se definirá en la Subnet"
  type        = string
}

variable "subnet_availability_zone" {
  description = "Zona en la que se desplegará la Subnet"
  type        = string
}

variable "subnet_type" {
  description = "Variable utilizada para el nombrado estándar de los recursos"
  type        = string
}

variable "partial_name" {
  description = "Variable utilizada para el nombrado estándar de los recursos"
  type        = string
}

variable "environment" {
  description = "Variable utilizada para el nombrado estándar de los recursos"
  type        = string
}

variable "tags" {
  description = "Etiquetas base para el recurso"
  type        = map(string)

}