# Aliases
alias ccat="pygmentize -g"
alias devbox-update="ansible-playbook ~/.devbox/linux/devenv-playbook.yml"
alias devbox-update-dev="sudo ansible-playbook -e devbox_dev=true ~/.devbox/linux/devenv-playbook.yml" 
alias edev="code ~/.devbox/"
alias k="kubectl"
alias etmux="vim ~/.tmux.conf"
alias evim="vim ~/.vimrc"
alias ezsh="vim ~/.zshrc"
alias econfig="code ~/azure"

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ff='find * -type f | fzf'

alias gitshit="git reset --soft HEAD~1"
alias tunzip="tar xf $1"
alias openfolder='gio open .'

# SSH agent with default key
function ssa() {
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/id_rsa
  ssh-add ~/.ssh/idgithub_rsa
}

alias ssh-pub="cat ~/.ssh/id_rsa.pub | xclip -sel clip -i"

# check given vs calculated
# example: checksum 69274fd3b9e65b39e33070376400b7e31664388cdee012591fabc849bee4258e kubernetes.tar.gz 
function checksum {
    local given=$1 
    local fileToCheck=$2
    echo "$given $fileToCheck" | sha256sum -c
}