# Virtualbox vboxvideo kernel module requires DRM

execute "install-linux-image-extra" do
  user "root"
  command "apt-get -y install linux-image-extra-$(uname -r)"
end

execute "virtualbox-guest-x11 restart" do
  user "root"
  command "/etc/init.d/virtualbox-guest-x11 restart"
  notifies :restart, "service[lightdm]", :delayed
end
