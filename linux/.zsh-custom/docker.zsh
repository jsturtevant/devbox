alias drmi='docker images | grep $1 | awk '{print $3}' | xargs docker rmi'
alias d="docker"

# Remove all Docker containers
function dnuke() {
  if read -q '?Are you sure (y/N)?'; then
    echo # empty line
    docker rm --force $(docker ps -aq)
  fi
  echo # empty line
}
