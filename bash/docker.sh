# Start the docker machine instance
function ds() {
  IS_RUNNING=$((docker-machine ls | grep default | grep Running > /dev/null && echo $?) || echo 1)
  if [[ $IS_RUNNING -eq 1 ]]; then
    echo "Starting Docker Machine..."
    docker-machine start default
  fi
  echo "Setting Docker Machine environment..."
  eval $(docker-machine env default)
  export DOCKER_IP=$(docker-machine ip default)
  echo -n "Docker can be reached at: $DOCKER_IP"
}
