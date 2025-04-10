resource "aws_eks_cluster" "staging-eks-cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.staging-eks-cluster-role.arn

  vpc_config {
    subnet_ids              = var.subnet_ids
    endpoint_public_access  = var.endpoint_public_access
    endpoint_private_access = var.endpoint_private_access
    public_access_cidrs     = var.public_access_cidrs
    security_group_ids      = [aws_security_group.node_group_one.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.stage-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.stage-AmazonRDSFullAccess,
  ]
}

resource "aws_eks_node_group" "staging-eks-worker-node-group" {
  cluster_name    = aws_eks_cluster.staging-eks-cluster.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.staging-eks-node-group-role.arn
  subnet_ids      = var.subnet_ids
  instance_types  = var.instance_types

  remote_access {
    source_security_group_ids = [aws_security_group.node_group_one.id]
    ec2_ssh_key               = var.key_pair
  }

  scaling_config {
    desired_size = var.scaling_desired_size
    max_size     = var.scaling_max_size
    min_size     = var.scaling_min_size
  }

  depends_on = [
    aws_iam_role_policy_attachment.stage-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.stage-AmazonEC2FullAccess,
    aws_iam_role_policy_attachment.stage-AmazonEC2ContainerRegistryReadOnly,
  ]
}

resource "aws_security_group" "node_group_one" {
  name_prefix = "node_group_one"
  vpc_id      = var.vpc_id

  ingress =[
    {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    cidr_blocks      = ["0.0.0.0/0"]
  },
  {
    description      = null
    from_port        = 1433
    to_port          = 1433
    protocol         = "tcp"
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    cidr_blocks      = ["0.0.0.0/0"]
  },
   {
    description      = null
    from_port        = 27017
    to_port          = 27017
    protocol         = "tcp"
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    cidr_blocks      = ["0.0.0.0/0"]
  },
  {
    description      = null
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    cidr_blocks      = ["0.0.0.0/0"]
  },
  
  {
    description      = null
    from_port        = 5432
    to_port          = 5432
    protocol         = "tcp"
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    cidr_blocks      = ["0.0.0.0/0"]
  },
  /*{
            cidr_blocks      = []
            description      = null
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = [
                "sg-00705e871370b4022",
                "sg-0431a090c699bb4e9",
                "sg-0ab8a2d4e9fbb6fa5",
            ]
            self             = true
            to_port          = 0
        },
        {
            cidr_blocks      = []
            description      = "Rule for staging JumpHost to access staging eks cluster "
            from_port        = 443
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "sg-04152e77ec206e4e2",
            ]
            self             = false
            to_port          = 443
        },*/
  ]

  egress = [
    {
    description      = null
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false

    cidr_blocks      = ["0.0.0.0/0"]
  },
  {
    description      = null
    from_port        = 27017
    to_port          = 27017
    protocol         = "tcp"
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  ]
}