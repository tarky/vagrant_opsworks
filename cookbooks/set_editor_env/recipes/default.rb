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
