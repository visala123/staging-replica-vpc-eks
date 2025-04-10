variable "vpc_cidr" {
  description = "VPC CIDR Range"
  type = string
}
## Web Tier CIDR Block 1##
variable "public-webtier-subnet-1-cidr" {
  default     = "10.40.0.0/22"
  description = "public_web_subnet1"
  type        = string
}

## Web Tier CIDR Block 2##

variable "public-webtier-subnet-2-cidr" {
  default     = "10.40.4.0/22"
  description = "public_web_subnet2"
  type        = string
}

## App tier CIDR Block 1##

variable "private-apptier-subnet-1-cidr" {
  default     = "10.40.32.0/22"
  description = "private_app_subnet1"
  type        = string
}

## App tier CIDR Block 2 ##

variable "private-apptier-subnet-2-cidr" {
  default     = "10.40.36.0/22"
  description = "private_app_subnet2"
  type        = string
}

## DB CIDR Block 1 ##

variable "private-database-subnet-1-cidr" {
  default     = "10.40.40.0/22"
  description = "private_db_subnet1"
  type        = string
}

## DB CIDR Block 2 ##

variable "private-database-subnet-2-cidr" {
  default     = "10.40.44.0/22"
  description = "private_db_subnet2"
  type        = string
}