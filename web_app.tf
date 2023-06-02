resource "null_resource" "configuration_resource" {

connection {
    type = "ssh"
    user = "ec2-user"
    port = 22
    password = "WebApp.pem"
    private_key = file("/root/terraform_webapp/WebApp.pem")
    host = aws_instance.Terraform_WebApp.public_ip
}

provisioner "remote-exec" {

inline  = [
      "sudo yum install httpd -y",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      "sudo systemctl status httpd",
      "sudo mkfs.ext4 /dev/sdh",
      "sudo mount /dev/sdh /var/www/html",
      "sudo rm -rf /var/www/html/*",
      "sudo yum install git -y",
      "sudo git clone https://github.com/BhaskarRao-D/Terraform_WebApp-HTML.git  /var/www/html"
]
}
}

*********************Can execute through script.


resource "null_resource" "configuration_resource" {

  connection {
    type        = "ssh"
    user        = "ec2-user"
    port        = 22
    password    = "WebApp.pem"
    private_key = file("/root/terraform_webapp/WebApp.pem")
    host        = aws_instance.Terraform_WebApp.public_ip
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/script.sh",
      "sudo /tmp/./script.sh",
    ]
  }
}







