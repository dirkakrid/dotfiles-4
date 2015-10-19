git_branch() {
  set -e
  git rev-parse --abbrev-ref HEAD
}
