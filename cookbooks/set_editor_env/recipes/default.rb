package "software-properties-common"
execute "apt-add-repository ppa:mizuno-as/silversearcher-ag"
execute "apt-get update"

%w{ exuberant-ctags tmux silversearcher-ag}.each do |p|
  package p do
    action :install
  end
end

git "/root/dotfiles" do
  repository "https://github.com/tarky/dotfiles.git"
  enable_submodules true
end
execute "sh /root/dotfiles/dotfilesLink.sh"

#go and hub
directory "/root/gocode"
cookbook_file "/etc/profile.d/for_hub.sh"
remote_file "/tmp/go.tar.gz" do
  source "https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz"
end
execute "tar -C /usr/local -xzf /tmp/go.tar.gz"
execute "go get github.com/github/hub" do
  environment(
    "GOPATH" => "/root/gocode",
    "PATH" => "/usr/local/go/bin:#{ENV["PATH"]}"
  )
end
