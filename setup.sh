#!/bin/bash
sudo yum update -y
sudo yum install -y nginx amazon-cloudwatch-agent
sudo systemctl start nginx
sudo systemctl enable nginx

# Configuração do CloudWatch Logs
sudo mv /home/ec2-user/cicd/config.json /opt/aws/amazon-cloudwatch-agent/bin/config.json
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
    -a fetch-config \
    -m ec2 \
    -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json \
    -s
