#!/bin/bash

# Update system
sudo apt update -y
sudo apt install -y nginx git

# Remove default HTML
sudo rm -rf /var/www/html/*

# Clone your static website
sudo git clone https://github.com/IamAkshayjagtap/static-website-project.git /var/www/html

# Set permissions
sudo chmod -R 755 /var/www/html
sudo chown -R www-data:www-data /var/www/html

# Restart nginx
sudo systemctl restart nginx
