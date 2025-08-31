resource "aws_instance" "server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "terraform-key"   # existing AWS key
  vpc_security_group_ids = [aws_security_group.webSg.id]
  subnet_id              = aws_subnet.sub1.id

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("C:/Users/Admin/Desktop/terraform-key.pem")
    host        = self.public_ip
  }

  # Copy app.py
  provisioner "file" {
    source      = "../Flask Application/app.py"
    destination = "/home/ubuntu/app.py"
  }

  # Copy templates folder
  provisioner "file" {
    source      = "../Flask Application/templates"
    destination = "/home/ubuntu/templates"
  }

  # Install dependencies and run Flask app
provisioner "remote-exec" {
  inline = [
    # Update and install python3-venv and pip
    "sudo apt update -y",
    "sudo apt install -y python3-venv python3-pip",

    # Go to ubuntu home directory
    "cd /home/ubuntu",

    # Create virtual environment
    "python3 -m venv venv",

    # Activate venv and install Flask
    "source venv/bin/activate && pip install flask",

    # Run Flask app inside virtual environment on port 5000 in background
    "source venv/bin/activate && nohup python3 app.py > app.log 2>&1 &"
  ]
}
  tags = {
    Name = "FlaskApp-EC2"
  }
}
