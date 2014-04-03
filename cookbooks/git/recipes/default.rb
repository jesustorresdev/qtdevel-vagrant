## Setup sources.list

apt_repository "lastest-git-packages" do
  uri "http://ppa.launchpad.net/git-core/ppa/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "hkp://keyserver.ubuntu.com:80"
  key "E1DF1F24"
end

## Install the lastest version

package "git" do
  action :upgrade
end
