include_recipe "ubuntu-desktop"

package "wget" do
  action :install
end

bash "download-installers" do
  user "vagrant"
  group "vagrant"
  environment ({'HOME' => '/home/vagrant', 'USER' => 'vagrant'})
  code <<-EOF
    set -e
    cd "$(xdg-user-dir DESKTOP)"
    wget --recursive --no-parent --no-directories \
         --accept 'qt-opensource-linux-*-online.run' \
           '#{node[:qt][:online_installers_url]}/'
    chmod 0755 qt-opensource-linux-*-online.run
  EOF
end
