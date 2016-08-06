# Always start ssh agent
function ssa() {
  eval $(ssh-agent -s)
}
