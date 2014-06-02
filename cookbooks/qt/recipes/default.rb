package "wget" do
  action :install
end

execute "download-installers" do
  user "vagrant"
  cwd "/home/vagrant/Desktop"
  command "wget -r -np -nd -Arun #{node[:qt][:online_installers_url]}"
end
