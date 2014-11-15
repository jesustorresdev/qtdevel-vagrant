gem_package "install-apt-repair-sources" do
  package_name "apt-repair-sources"
  action :upgrade
end

execute "apt-repair-sources -f" do
  user "root"
end
