prefixesToDelete=("test" "kubetest" "capz-e2e")

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

