## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.80.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.17.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.35.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.80.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | ../modules/alb | n/a |
| <a name="module_eks_cluster"></a> [eks\_cluster](#module\_eks\_cluster) | ../modules/cluster | n/a |
| <a name="module_load_balancer_controller"></a> [load\_balancer\_controller](#module\_load\_balancer\_controller) | ../modules/load-balancer-controller | n/a |
| <a name="module_managed_node_group"></a> [managed\_node\_group](#module\_managed\_node\_group) | ../modules/managed-node-group | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.sg](https://registry.terraform.io/providers/hashicorp/aws/5.80.0/docs/resources/security_group) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/5.80.0/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb"></a> [alb](#input\_alb) | values for the alb | `map` | <pre>{<br>  "HML": {},<br>  "PRD": {<br>    "healthy_threshold": 3,<br>    "interval": 30,<br>    "listener_action_type": "forward",<br>    "listener_port": "80",<br>    "listener_protocol": "HTTP",<br>    "matcher": "200",<br>    "name": "alb-eks-infra",<br>    "path": "/",<br>    "port": "traffic-port",<br>    "protocol": "HTTP",<br>    "target_name": "test",<br>    "target_port": 80,<br>    "target_protocol": "HTTP",<br>    "target_type": "ip",<br>    "timeout": 10,<br>    "unhealthy_threshold": 2<br>  }<br>}</pre> | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name | `string` | `"eks-infra"` | no |
| <a name="input_sg"></a> [sg](#input\_sg) | values for the security group | `map` | <pre>{<br>  "HML": {},<br>  "PRD": {<br>    "alb": {<br>      "description": "Security group for alb app",<br>      "egress": "../rules/alb_egress_rules.csv",<br>      "ingress": "../rules/alb_ingress_rules.csv",<br>      "name": "demo-sg-alb",<br>      "revoke_rules_on_delete": true<br>    },<br>    "eks": {<br>      "description": "Security group for eks cluster",<br>      "egress": "../rules/eks_egress_rules.csv",<br>      "ingress": "../rules/eks_ingress_rules.csv",<br>      "name": "demo-sg-eks",<br>      "revoke_rules_on_delete": true<br>    }<br>  }<br>}</pre> | no |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | values for the subnets | `map` | <pre>{<br>  "HML": {},<br>  "PRD": {<br>    "multi_az": [<br>      "use1-az1",<br>      "use1-az2",<br>      "use1-az3"<br>    ],<br>    "private": {<br>      "cidr_block": [<br>        "10.0.1.0/24",<br>        "10.0.2.0/24"<br>      ],<br>      "internal_elb": 1,<br>      "pip_on_launch": false,<br>      "route_table_name": "private-rt"<br>    },<br>    "public": {<br>      "cidr_block": [<br>        "10.0.101.0/24",<br>        "10.0.102.0/24"<br>      ],<br>      "pip_on_launch": true,<br>      "public_elb": 1,<br>      "route_table_name": "public-rt"<br>    }<br>  }<br>}</pre> | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | values for the vpc | `map` | <pre>{<br>  "HML": {},<br>  "PRD": {<br>    "cidr_block": "10.0.0.0/16",<br>    "enable_dns": true,<br>    "name": "vpc-network",<br>    "nat": true,<br>    "region": "us-east-1",<br>    "vpn": false<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_arn"></a> [alb\_arn](#output\_alb\_arn) | value of the alb arn |
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | value of the alb dns name |
| <a name="output_alb_name"></a> [alb\_name](#output\_alb\_name) | value of the alb name |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | n/a |
| <a name="output_eks_name"></a> [eks\_name](#output\_eks\_name) | value of the eks name |
| <a name="output_node_group_name"></a> [node\_group\_name](#output\_node\_group\_name) | value of the node group name |
| <a name="output_oidc"></a> [oidc](#output\_oidc) | n/a |
| <a name="output_security_group_ids"></a> [security\_group\_ids](#output\_security\_group\_ids) | value of the security group ids |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | value of the subnet ids |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | value of the vpc id |
