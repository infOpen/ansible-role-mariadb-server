# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

VMS = {
  :trusty55 => {
    :box => "ubuntu/trusty64",
    :mariadb_version => "5.5"
  },
  :trusty100 => {
    :box => "ubuntu/trusty64",
    :mariadb_version => "10.0"
  }
}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|


  VMS.each_pair do |name, options|

    config.vm.define name do |vm_config|

      # Set proper box
      vm_config.vm.box = options[:box]

      # Use trigger plugin to set environment variable used by serverspec
      vm_config.vm.provision "trigger" do |trigger|
        trigger.fire do
          ENV['MARIADB_VERSION'] = options[:mariadb_version]
        end
      end

      # Run Ansible provisioning
      vm_config.vm.provision "ansible" do |ansible|
        ansible.playbook  = "tests/test_vagrant.yml"
        ansible.extra_vars = {
          mariadbserver_version: options[:mariadb_version]
        }
      end

      # Run Serverspec tests
      vm_config.vm.provision "serverspec" do |serverspec|
        serverspec.pattern = "spec/*_spec.rb"
      end

    end
  end
end

