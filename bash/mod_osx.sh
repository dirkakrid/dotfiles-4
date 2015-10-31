function install_osx() {

  sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport /usr/local/bin/airport

  # Hide OSX Prompts on login
  touch $HOME/.hushlogin

  # Install brew
  brew_install_or_upgrade brew-cask
  brew_install_or_upgrade go
  brew_install_or_upgrade openssl
  brew_install_or_upgrade curl --with-openssl
  brew_install_or_upgrade openssl
  brew unlink openssl && brew link openssl --force
  brew_install_or_upgrade sqlite
  brew_install_or_upgrade vim
  brew_install_or_upgrade libarchive
  brew_install_or_upgrade ssh-copy-id
  brew_install_or_upgrade boot2docker
  brew_install_or_upgrade awscli
  brew_install_or_upgrade jq
  brew_install_or_upgrade jp2a
  brew_install_or_upgrade the_silver_searcher
  brew_install_or_upgrade bash-completion
  brew_install_or_upgrade enchant
  brew_install_or_upgrade wget
  brew_install_or_upgrade figlet
  brew_install_or_upgrade coreutils
  brew_install_or_upgrade tmate
  brew_install_or_upgrade ant
  brew_install_or_upgrade reattach-to-user-namespace
  brew_install_or_upgrade scons
  brew_install_or_upgrade autoconf
  brew_install_or_upgrade socat
  brew_install_or_upgrade gnupg
  brew_install_or_upgrade nikto
  brew_install_or_upgrade sqlmap
  brew_install_or_upgrade nmap

  brew_tap nviennot/tmate
  brew_install_or_upgrade tmux

  brew_cask_install_or_upgrade chefdk
  brew_cask_install_or_upgrade dockertoolbox
  brew_cask_install_or_upgrade little-snitch
  brew_cask_install_or_upgrade qlcolorcode
  brew_cask_install_or_upgrade qlmarkdown
  brew_cask_install_or_upgrade quicklook-json
  brew_cask_install_or_upgrade vagrant
  brew_cask_install_or_upgrade virtualbox
}
