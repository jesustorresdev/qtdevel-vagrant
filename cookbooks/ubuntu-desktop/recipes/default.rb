service "lightdm" do
  action :nothing
end

package "ubuntu-desktop" do
  options "--no-install-recommends"
  action :install
end

package "gnome-session-flashback" do
  options "--no-install-recommends"
  action :install
end

package "gnome-terminal" do
  action :install
end

# Fix letters overlapping in the terminal

package "ttf-ubuntu-font-family" do
  action :install
end

# Install software translations

execute "install-language" do
  user "root"
  command "apt-get -y install $(check-language-support -l #{node[:desktop][:language]})"
end

# Set default desktop session and enable autologin

template "/etc/lightdm/lightdm.conf" do
  source "lightdm.conf.erb"
  mode 0644
  owner "root"
  group "root"
  variables ({
    :autologin_user => :vagrant,
    :user_session => node[:desktop][:session]
  })
end

# Update XDG directory configuration of user 'vagrant'

execute "xdg-user-dirs-update" do
  user "vagrant"
  group "vagrant"
  environment ({
    'HOME' => '/home/vagrant',
    'USER' => 'vagrant',
    'LANG' => node[:locale][:default],
    'LC_ALL' => node[:locale][:default]
  })
  notifies :restart, "service[lightdm]", :delayed
end
