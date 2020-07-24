prefixesToDelete=("test" "kubetest")

function rgclean() {
    groupsToDelete=()
    for prefix in ${prefixesToDelete[@]}; do  
        groupsToDelete+=($(az group list -o json --query "[?starts_with(name, '$prefix') && tags.keep!='true'].name" -o tsv))
    done

    echo $groupsToDelete
    echo -n "Delete the previous resource groups [y/n]:"
    read ans
    if [[ $ans != "y" ]]; then
        return
    fi

    for group in ${groupsToDelete[@]}; do  
        echo "Deleting $group"
        az group delete --name $group --yes --no-wait
    done 
}

function rglist(){
    groupsEligibleForDeletion=()
    for prefix in ${prefixesToDelete[@]}; do  
        groupsEligibleForDeletion+=($(az group list -o json --query "[?starts_with(name, '$prefix')].name" -o tsv))
    done

    echo $groupsEligibleForDeletion
}

function rgkeep() {
    local rgname=$1
    az group update --name $rgname --tags keep=true
}

function rgrm() {
    local rgname=$1
    az group update --name $rgname --remove tags.keep
}

funciton wssh() {
    local publicip=${1}
    local windowsip=${2}
    local keyfile=${3:-"~/.ssh/id_rsa"}
    local sshuser=${4:-"azureuser"}

    ssh -t -i "$keyfile" -o "ProxyCommand ssh -i $keyfile -W %h:%p $sshuser@$publicip" "$sshuser@$windowsip" 
}