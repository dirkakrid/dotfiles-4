function shareshell() {
  tmux -S /tmp/${USER}_session new
  chmod 0777 /tmp/${USER}_session
}

function attach() {
  tmux -S /tmp/${USER}_session attach
}
