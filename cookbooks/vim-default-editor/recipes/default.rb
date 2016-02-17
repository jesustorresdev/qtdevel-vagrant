include_recipe "vim"

execute "set-vim-editor" do
  user "root" 
  command "/usr/bin/update-alternatives --set editor /usr/bin/vim.basic"
end
