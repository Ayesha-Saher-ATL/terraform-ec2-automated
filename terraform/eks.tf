module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "weather-api-cluster"
  # Match the cluster version shown in your error
  cluster_version = "1.30" 

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    main = {
      # Aligning node version with cluster version
      version      = "1.30"
      min_size     = 1
      max_size     = 2
      desired_size = 1
      instance_types = ["t3.medium"]
      
      # AL2023 is the standard and most stable image for 1.30
      ami_type = "AL2023_x86_64_STANDARD"
    }
  }
}