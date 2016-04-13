#!/bin/bash

echo "Provisioning virtual machine..."

echo "Actualizando lista de paquetes"
apt-get update

echo "Instalando Git"
apt-get install git -y 
    
echo "Instalando Nginx"
apt-get install nginx -y 
