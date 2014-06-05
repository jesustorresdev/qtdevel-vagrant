package "ubuntu-desktop" do
  options "--no-install-recommends"
  action :install
end

service "lightdm" do
  action :nothing
end

# Install software translations

execute "install-language" do
  user "root"
  command "apt-get -y install $(check-language-support -l #{node[:desktop][:language]})"
end

# Fix letters overlapping in the terminal

package "ttf-ubuntu-font-family" do
  action :install
end

# Use Ubuntu Classic without effects

package "gnome-session-fallback" do
  action :install
end

execute "set-session" do
  user "root"
  command "/usr/lib/lightdm/lightdm-set-defaults -s gnome-fallback"
  notifies :restart, "service[lightdm]", :delayed
end

# Update XDG directory configuration of user 'vagrant'

execute "xdg-user-dirs-update" do
  user "vagrant"
  group "vagrant"
  environment ({'HOME' => '/home/vagrant',
                'USER' => 'vagrant',
                'LANG' => node[:locale][:default],
                'LC_ALL' => node[:locale][:default]})
end
