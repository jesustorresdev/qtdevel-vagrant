include_recipe "vim"

execute "set-vim-editor" do
  user "root" 
  command "/usr/sbin/update-alternatives --set editor /usr/bin/vim.basic"
end
