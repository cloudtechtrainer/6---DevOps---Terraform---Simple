# main.tf

variable "ami" {
  description = "AMI details"
  type        = string
}

variable "key" {
  description = "The name of the EC2 key pair to associate with the instances."
  type        = string
}

# Create a new security group that allows incoming SSH traffic
resource "aws_security_group" "ssh" {
  name_prefix = "allow-ssh-and-http"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
