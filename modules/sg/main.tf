resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow HTTP, SSH inbound traffic"
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

  tags = {
    Name = "eks-cluster-sg-staging-eks-cluster-349615576"
  }
} 
        
   