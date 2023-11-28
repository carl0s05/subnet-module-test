locals {
  # Se determina el tipo de subnet para el nombrado del recurso
  type = var.subnet_type == "public" ? "pub" : "priv"
}

# Recupera la información de la VPC existente a partir del identificador especificado en 'var.vpc_id'.
data "aws_vpc" "module_vpc" {
  id = var.vpc_id
}

# Crea una subnet en AWS dentro de la VPC especificada en 'data.aws_vpc.module_vpc.id' con el bloque CIDR especificado en 
# 'var.subnet_cidr_block' y en la zona de disponibilidad especificada en 'var.subnet_cidr_block'.
resource "aws_subnet" "module_subnet" {
  vpc_id            = data.aws_vpc.module_vpc.id
  availability_zone = var.subnet_availability_zone
  cidr_block        = var.subnet_cidr_block

  # Define las etiquetas para la subnet, incluyendo las etiquetas 'Name' y 'Service Name'
  tags = merge(var.tags, {
    "Name"         = "subnet-${var.environment}-${local.type}-${var.partial_name}"
    "Service Name" = "snet",
  })

  # Ignora los cambias en la etiqueta 'Date/Time', dado que esta solo se considera al momento de la creación de los recursos
  lifecycle {
    ignore_changes = [tags["Date/Time"]]
  }
}