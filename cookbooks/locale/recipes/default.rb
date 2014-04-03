template node[:locale][:locale_gen_file] do
  source "locales.gen.erb"
end

execute "locale-gen" do
  user "root" 
  command "locale-gen #{node[:locale][:default]}"
end

execute "update-locale" do
  user "root" 
  command "update-locale --reset LANG=#{node[:locale][:default]}"
end
