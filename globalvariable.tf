variable "VPC-DEVOPS" {
  description = "CIDR"
  type        = string
  default     = "10.0.0.0/16"
}



//locals {
//vpc-devops-cidr1  = "10.0.0.0/16"
//vpc-devops-cidr2  = "10.0.0.0/24"

//}

variable "subnet" {
  description = "CIDR"
  type        = map
  //default     = "10.0.0.0/24"
}

# variable "vpc_availability_zones" {
#   description = "VPC Availability Zones"
#   type = map
#   //default = "us-east-1b"
# }

variable "ALB-Name" {
   description = "ALB_Name"
   type        =  string 
   default = "Amexalb"
}


variable "Tags" {
   description = "ALB_Tags"
   type        = map
   default = {
      Name = "ALB-Internet_facing"

   }
  
}

variable "target_id" {
   description = "ALB_Tags"
   type        = string
   default = "10.0.3.251"
      

   
  

}



