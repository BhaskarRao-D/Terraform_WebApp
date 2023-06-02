resource "aws_ebs_volume" "ebs_vol" {
  availability_zone = aws_instance.Terraform_WebApp.availability_zone
  size              = 10
  tags = {
    Name = "WebApp_Vol"
  }
}

resource "aws_volume_attachment" "ebs_vol_attch" {
  device_name = "/dev/sdh"
  instance_id = aws_instance.Terraform_WebApp.id
  volume_id   = aws_ebs_volume.ebs_vol.id
}
