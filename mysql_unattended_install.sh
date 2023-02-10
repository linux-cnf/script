#!/bin/bash
#name: bablish jaiswal
#purpose: how to install mysql in ubuntu without interaction
#contact: linux.cnf@gmail.com
# Update the package index
sudo apt-get update

# Install the MySQL server package
sudo apt-get install -y mysql-server

# Automatically set up the MySQL database
sudo mysql_secure_installation <<EOF

y
password
password
y
y
y
y
EOF

# Start the MySQL service
sudo systemctl start mysql

# Enable the MySQL service to start automatically on boot
sudo systemctl enable mysql

# Check the status of the MySQL service
sudo systemctl status mysql

