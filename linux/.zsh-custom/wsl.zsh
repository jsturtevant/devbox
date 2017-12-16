# These customizations are only added when running under Windows Subsystem for Linux
# Under WSL, /proc/sys/kernel/osrelease looks something like: 4.4.0-43-Microsoft

if grep -q Microsoft /proc/sys/kernel/osrelease; then

  # Aliases
  alias e.="explorer.exe"
  alias projects='cd /mnt/c/projects/'
  alias blog='cd /mnt/c/projects/jsturtevant.github.io'
  
  # docker from wsl
  export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
  export PATH="$PATH:/mnt/c/Program\ Files/Docker/Docker/resources/bin"
  alias docker='docker.exe'
  alias docker-compose='docker-compose.exe'
  
  function code() {
    if type code > /dev/null; then 
      code . </dev/null &>/dev/null & disown
    fi
  } 
 
  # Don't 'nice' background jobs (https://github.com/Microsoft/BashOnWindows/issues/1838)
  unsetopt BG_NICE

  # Map folders on C: to my home folder
  ln -sfn /mnt/c/projects ~/projects
  ln -sfn /mnt/c/Users/jstur/go ~/go
fi
