
#Create policy
resource "aws_iam_policy" "k8s_kops_policy" {
  name        = "${var.policy_name}"
  path        = "/"
  description = "${var.policy_description}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

#IAM Role
resource "aws_iam_role" "k8s_kops_role" {
  name = "${var.role_name}"
  path = "/"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

## Profile
resource "aws_iam_instance_profile" "k8s_kops_profile" {
  name = "${var.profile_name}"
  role = "${aws_iam_role.k8s_kops_role.name}"
}

## Attachment
resource "aws_iam_policy_attachment" "k8s_kops_attach" {
  name       = "${var.attach_name}"
  roles      = ["${aws_iam_role.k8s_kops_role.name}"]
  policy_arn = "${aws_iam_policy.k8s_kops_policy.id}"
}

###Create security group for EC2
resource "aws_security_group" "k8s_kops_sg" {
  name        = "${var.sg_ec2_name}"
  description = "${var.sg_ec2_description}"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "${var.sg_ec2_name}"
    Environment = "${var.tag_env}"
    Service     = "${var.tag_service}"
    Component   = "${var.tag_component}"
  }
}

### Create the EC2(s) Zone A
resource "aws_instance" "k8s_kops" {
  count             = "${var.instances}"
  ami               = "${var.app_ami}"
  instance_type     = "${var.instance_type}"
  availability_zone = "${var.availability_zone_a}"
  key_name          = "${var.key_pair_name}"
  subnet_id         = "${aws_subnet.subnet_dz_1a.id}"
  security_groups   = ["${aws_security_group.k8s_kops_sg.id}"]

  user_data            = "${file("./user_data/k8s-kops.sh")}"
  iam_instance_profile = "${aws_iam_instance_profile.k8s_kops_profile.id}"

  root_block_device {
    volume_type           = "${var.volume_type}"
    volume_size           = "${var.volume_size}"
    delete_on_termination = "${var.delete_on_termination}"
  }

  tags {
    Name        = "${var.server_name}"
    Environment = "${var.tag_env}"
    Service     = "${var.tag_service}"
    Component   = "${var.tag_component}"
  }
}

## Mapping internal ec2 to Route53
resource "aws_route53_record" "r53-private" {
  zone_id = "${var.route53_private_id}"
  name    = "${var.r53_pv_name}.${var.r53_domain_name}"
  type    = "${var.r53_type_a}"
  ttl     = "${var.r53_ttl}"
  records = ["${aws_instance.k8s_kops.private_ip}"]
}

output "k8s_kops_ip" {
  value = "${aws_instance.k8s_kops.*.private_ip}"
}
