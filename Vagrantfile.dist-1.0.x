# -*- mode: ruby -*-
# vi: set ft=ruby :
# sublime: x_syntax Packages/Ruby/Ruby.tmLanguage

Vagrant::Config.run do |config|
  config.vm.box = "debian64_puppet31"
  config.vm.box_url = "http://www.harrenmediatools.com/utils/debian64_puppet31.box"

  #internal network
  config.vm.network :hostonly, "192.168.33.20"
  config.vm.host_name = 'rpgit.dev'
  config.vm.share_folder "v-root", "/vagrant", ".", :nfs => true

  config.vm.provision :puppet do |puppet|
    puppet.facter = { 'fqdn' => config.vm.host_name }
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "default.pp"
    puppet.module_path = "puppet/modules"
  end

end

