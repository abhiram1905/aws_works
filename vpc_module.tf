module "VPC-DEVOPS" {
  source = "./VPC/VPC-DEVOPS/"
  Cidr   = var.VPC-DEVOPS

}


module "VPC-DEVOPS-Subnet-1b" {
  source = "./VPC/subnet/VPC-DEVOPS-SUBNET-A/"
  vpc_id = module.VPC-DEVOPS.vpc_id
  for_each = var.subnet
  subnet_az_1a = each.value.subnet_cidr
  subnet-azs = each.value.subnet_availabilty_zone


}

 module "Amex-devops-ec2" {
  source    = "./Amex-work/fraud/ec2/"
   //subnet_id = module.VPC-DEVOPS-Subnet.subnet_id

  subnet_id = module.VPC-DEVOPS-Subnet-1b["subnet-az-1c"].subnet_id

  depends_on = [
    module.VPC-DEVOPS
 ]
 }

module "Application_load_balance" {

source = "./VPC/LOAD-BALANCER/ALB"
ALB_SG = [module.ALB_Security_Group.ALB_Security_Group_id]
subnet_id = [module.VPC-DEVOPS-Subnet-1b["subnet-az-1c"].subnet_id,module.VPC-DEVOPS-Subnet-1b["subnet-az-1b"].subnet_id]

ALB-Name = var.ALB-Name
Inernal_facing = "false"
tags = var.Tags
vpc_id = module.VPC-DEVOPS.vpc_id

//target_id = module.Amex-devops-ec2.VPC-DEVOPS-id
target_id = var.target_id 
//VPC-DEVOPS-id

}

# VPC-DEVOPS-amex-ec2

module "ALB_Security_Group" {
  source = "./VPC/Security_group"
  vpc_id = module.VPC-DEVOPS.vpc_id
  
}

# module "ALB_Security_Group" {
# source = "./VPC/Security_group"
# vpc_id = module.VPC-DEVOPS.vpc_id


# }

#  module "VPC-DEVOPS-Subnet-1a" {
#  source = "./VPC/subnet/VPC-DEVOPS-SUBNET-A/"
#   vpc_id = module.VPC-DEVOPS.vpc_id
#   subnet_az_1a = var.subnet-test ["subnet-az-1a"]
#    subnet-azs = var.vpc_availability_zones ["availability_zones-1a"]


#  }


  
// vpc_id = module.VPC-DEVOPS.vpc_id
 
























