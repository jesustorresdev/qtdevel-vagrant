temporal_directory = "#{Chef::Config[:file_cache_path]}/qt"
online_installer = node[:qt][:online_installer]

remote_file temporal_directory do
  source "#{node[:qt][:online_installers_url]}/md5sums.txt"
  only_if { online_installer.empty? }
end

ruby_block "get-installer-source" do
  block do
    case `uname -m`.strip
    when "x86_64"
        architecture = :x64
    when "i686"
        architecture = :x86
    else
        next
    end
    pattern = "\w+\b+sqt-opensource-linux-#{architecture}-.*-online.run$"
    lines_found = open(temporal_directory << "/md5sums.txt") do |file|
        file.each_line.detect{ |line| /#{pattern}/.match(line) }
    end
    if lines_found.nil?
        Chef::Application.fatal!("Couldn't find any Qt installer.")
    end
    installer = line_found.split(' ')[1]
    online_installer = "#{node[:qt][:online_installers_url]}/#{installer}"
  end
  only_if { online_installer.empty? }
end

remote_file "/home/vagrant/Desktop" do
  source lazy { online_installer }
end
