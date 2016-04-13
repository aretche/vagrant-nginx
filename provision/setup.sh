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
