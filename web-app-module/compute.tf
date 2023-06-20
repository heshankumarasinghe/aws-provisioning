resource "aws_launch_template" "node_web_server_launch_template" {
  name        = "NodeWebServerLaunchTemplate"
  image_id    = "ami-057752b3f1d6c4d6c"
  instance_type = "t2.micro"
  
  security_group_names = [aws_security_group.web_app_sg.name]

  placement {
    availability_zone = "ap-south-1a"
  }
  
  user_data = base64encode("#cloud-config\n\nruncmd:\n  - sudo yum update -y\n  - sudo yum install -y nodejs nginx\n  - sudo npm i -g pm2\n  - sudo systemctl start nginx\n  - sudo systemctl enable nginx\n  - sudo dnf install -y dotnet-sdk-6.0\n")
}

resource "aws_key_pair" "node_web_server_key_pair" {
  key_name   = "node-web-server-key-pair"
  public_key = var.public_key
}

resource "aws_instance" "web_server_instance" {
  instance_type = aws_launch_template.node_web_server_launch_template.instance_type

  vpc_security_group_ids = [aws_security_group.web_app_sg.id]

  key_name = aws_key_pair.node_web_server_key_pair.key_name

  launch_template {
    id      = aws_launch_template.node_web_server_launch_template.id
    version = aws_launch_template.node_web_server_launch_template.latest_version
  }
}
