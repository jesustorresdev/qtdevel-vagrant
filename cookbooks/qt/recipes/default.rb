package "wget" do
  action :install
end

directory "/home/vagrant/Desktop" do
  owner "vagrant"
  group "vagrant"
  mode 00755
  action :create
end

execute "download-installers" do
  user "vagrant"
  cwd "/home/vagrant/Desktop"
  command "wget -r -np -nd -Arun #{node[:qt][:online_installers_url]}"
end
