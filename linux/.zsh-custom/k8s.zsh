alias kns="kubie ns"
alias kap="kubectl get pods -A"
alias kgp="kubectl get pods"
alias kdp="kubectl describe pod"
alias krmp="kubectl delete pod"
alias kd="kubectl describe"
alias kg="kubectl get"

funciton wssh() {
    local publicip=${1}
    local windowsip=${2}
    local keyfile=${3:-"~/.ssh/id_rsa"}
    local sshuser=${4:-"azureuser"}

    set -x
    ssh -t -i "$keyfile" -o "ProxyCommand ssh -i $keyfile -W %h:%p $sshuser@$publicip" "$sshuser@$windowsip" "powershell.exe"
}

funciton wscpup() {
    local publicip=${1}
    local windowsip=${2}
    local file=${3}
    local location=${4:-"c:/"}
    local keyfile=${5:-"~/.ssh/id_rsa"}
    local sshuser=${6:-"azureuser"}

    set -x
    scp -i "$keyfile" -o "ProxyCommand ssh -i $keyfile -W %h:%p $sshuser@$publicip" $file "$sshuser@$windowsip:$location"
}

funciton wscpdown() {
    local publicip=${1}
    local windowsip=${2}
    local file=${3}
    local location=${4:-"./"}
    local keyfile=${5:-"~/.ssh/id_rsa"}
    local sshuser=${6:-"azureuser"}

    set -x
    scp -i "$keyfile" -o "ProxyCommand ssh -i $keyfile -W %h:%p $sshuser@$publicip" "$sshuser@$windowsip:$file" $location
}