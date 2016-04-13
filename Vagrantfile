# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Base box de la que partimos
  config.vm.box = "ubuntu/trusty64"
  # Si la base box no existe en la computadora, descargarla de la siguiente URL:      
  config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"

  # Configuramos la redirección del puerto 80 de la máquina virtual al 8080 del host
  config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true

  # Configuramos que el subirectorio ./src en el host que esté mapeado al /var/www de la máquina virtual
  config.vm.synced_folder "./src", "/var/www", create: true, group: "www-data", owner: "www-data"

  # Configuración específica para el provider virtualbox
  config.vm.provider "virtualbox" do |v|
      v.name = "Vagrant con Nginx"
      v.customize ["modifyvm", :id, "--memory", "512"]
  end

end
