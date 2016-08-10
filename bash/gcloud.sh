# Setup gcloud utils if it's installed
if [[ -e ${HOME}/.gcloud ]]; then
  export PATH=${HOME}/.gcloud/google-cloud-sdk/bin:$PATH

  # The next line enables shell command completion for gcloud.
  source ${HOME}/.gcloud/google-cloud-sdk/completion.bash.inc
fi
