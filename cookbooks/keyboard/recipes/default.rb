template node[:keyboard][:config_file] do
  source "keyboard.erb"
end

execute "setup-keyboard" do
  user "root" 
  command "dpkg-reconfigure -fnoninteractive keyboard-configuration"
end
