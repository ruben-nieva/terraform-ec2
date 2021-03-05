terraform {
  backend "s3" {}
}

provider "aws" {
  version = "~> 2.7"
  region  = "us-east-1"
  profile = "terraform"
}

resource "aws_instance" "web" {
  count = 1
  // Ubuntu 18.04
  ami = "ami-02fe94dee086c0c37"
  instance_type = "t2.micro"
  
  // tags = {
  //   Name = "devops-${count.index}"
  // }
}

#
# Outputs
#
output "public_ip" {
  value = aws_instance.web.*.public_ip
}

output "private_ip" {
  value = aws_instance.web.*.private_ip
}
