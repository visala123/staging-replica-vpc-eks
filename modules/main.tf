module "vpc" {
  source = "./vpc"
  vpc_cidr = var.vpc_cidr
  #subnet_cidr = var.subnet_cidr
}

module "sg" {
    source = "./sg"
    vpc_id = module.vpc.vpc_id
}
###calling eks 

module "eks" {
  source                  = "/eks"
  subnet_ids              = module.vpc.subnet_ids
  vpc_id                  = module.vpc.vpc_id
  cluster_name            = "staging-eks-cluster" #"module-eks-${random_string.suffix.result}"
  endpoint_public_access  = false
  endpoint_private_access = true
  public_access_cidrs     = ["0.0.0.0/0"]
  node_group_name         = "staging-eks-worker-node-group"
  scaling_desired_size    = 1
  scaling_max_size        = 4
  scaling_min_size        = 1
  instance_types          = ["t2.large"]
  key_pair                = "keypair"
}