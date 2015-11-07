function sshconfig {
  atom ~/.ssh/config
}

function profile {
  atom ~/.bash_profile
}

function dotfiles {
  cd ~/.dotfiles
  atom .
}

function private {
  cd ~/.private
  atom .
}

function update-dotfiles {
  cd ~/.dotfiles && git stash && git pull && reload && cd -
}
