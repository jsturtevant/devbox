# Aliases
alias ccat="pygmentize -g"
alias devbox-update="ansible-playbook ~/.devbox/linux/devenv-playbook.yml"
alias devbox-update-dev="sudo ansible-playbook -e devbox_dev=true ~/.devbox/linux/devenv-playbook.yml" 
alias edev="vi ~/.devbox/linux/devenv-playbook.yml"
alias k="kubectl"
alias etmux="vim ~/.tmux.conf"
alias evim="vim ~/.vimrc"
alias ezsh="vim ~/.zshrc"
alias gitshit="git reset --soft HEAD~1"

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ff='find * -type f | fzf'

# SSH agent with default key
function ssa() {
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/id_rsa
  ssh-add ~/.ssh/idgithub_rsa
}

# check given vs calculated
function checksum {
        echo "$1 $2" | sha256sum -c
}

# mimic armclient (https://github.com/projectkudu/ARMClient)
function armclient() {
  local METHOD=$1
  local URL=$2
  local ACCESS_TOKEN=`az account get-access-token --query accessToken -o tsv`

  curl -s -X $METHOD -H "Authorization: Bearer $ACCESS_TOKEN" "https://management.azure.com$URL" | jq
}
