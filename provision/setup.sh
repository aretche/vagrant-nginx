#!/bin/bash

echo "Provisioning virtual machine..."

echo "Actualizando lista de paquetes.."
apt-get update

echo "Instalando Git.."
apt-get install git -y 
    
echo "Instalando Nginx.."
apt-get install nginx -y 

echo "Configurando Nginx.."
cp /var/www/provision/config/nginx_vhost /etc/nginx/sites-available/nginx_vhost > /dev/null
ln -s /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-available/default
service nginx restart

echo "Instalando PHP..."
apt-get install php5-common php5-cli php5-fpm -y
    
echo "Instalando extensiones PHP..."
apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql -y
service nginx restart

echo "Instalando MySQL..."
apt-get install debconf-utils -y 
debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
apt-get install mysql-server -y



