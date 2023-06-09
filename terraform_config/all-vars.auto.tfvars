vpc_cidr        = "10.0.0.0/24"
tenancy_type    = "default"
vpc_name-tag1   = "k8s-exam-VPC"
igw_name-tag1   = "k8s-IGW"
local-file_path = "../ansible_config/host-inventory"
ansibleVar-file_path = "../ansible_config/vars/vars1.yaml"
subnet_values = {
  "subnet-A" = {
    av_zone       = "us-east-1a"
    subnet_cidr   = "10.0.0.0/26"
    add_public-ip = true
    tags = {
      "name" = "k8s-subnet"
    }
  }
}

pub-route_values = {
  "rule-1" = {
    public-route_cidr = "0.0.0.0/0"
    tags = {
      "name" = "Public_route-table"
    }
  }
}

pubSG_name    = "pubSG_allow_rules"
cidr_anywhere = "0.0.0.0/0"
pubSG-tags = {
  "Name" = "Public Server-SG"
}

inst-sg_ingress_rules = {
  "ingrs_rule1" = {
    description = "Allow HTTPs from Anywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  "ingrs_rule2" = {
    description = "Allow HTTP from Anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  "ingrs_rule3" = {
    description = "Allow SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  "ingrs_rule4" = {
    description = "Allow ICMP from anywhere"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  "ingrs_rule5" = {
    description = "Open K8s node ports ranges"
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

inst-sg_egress_rules = {
  "egrs_rule1" = {
    description = "Allow all outgoing traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

nacl1_ingress_rules = {
  "ingrs_rule1" = {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}

nacl1_egress_rules = {
  "egrs_rule1" = {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}

nacl1-tags = {
  "Name" = "nacl1_rules"
}

web_servers_values = {
  "instance1_values" = {
    ami        = "ami-09cd747c78a9add63"
    inst_type  = "t2.medium"
    av_zone    = ""
    key_name   = "exm_connect"
    sec_groups = []
    subnet_id  = ""

    tags = {
      Name         = ""
      Launched-via = "Terraform"
    }
  }
}

