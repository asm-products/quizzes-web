# For a complete reference, please see the online documentation at
# vagrantup.com

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box_url = 'https://quizzes-web.s3.amazonaws.com/vagrant/quizzes.box'

  config.vm.provision :shell, path: 'config/vagrant.sh'
  config.vm.network :private_network, ip: "192.168.50.4"
  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.synced_folder(".", "/vagrant", nfs: true)

end
