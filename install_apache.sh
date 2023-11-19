#!/bin/bash
 yum update -y
 yum install -y httpd.x86_64
 systemctl start httpd.service
 systemctl enable httpd.service
 amazon-linux-extras install epel -y
 yum install stress -y
 echo "<html><body><h1>WE ARE LEVELING UP IN TERRAFORM!!</h1></body></html>" > /var/www/html/index.html
