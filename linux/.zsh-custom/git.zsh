function gclone() {
    local repo=$1

    pushd ~/projects
    git clone $repo
    ret=$? && [ $ret -ne 0 ] && return

    project=$(echo "$repo" | cut -d "/" -f 2 | cut -d "." -f 1)
    echo $project
    pushd $project
    
    git remote rename origin upstream
    fork=$(echo "$repo" | sed 's#github\.com:.*/#github\.com:jsturtevant/#g')
    git remote add origin $fork

    git remote -v 
    echo "cd $(pwd)"

    popd > /dev/null 2>&1
    popd > /dev/null 2>&1
}

function gupdate() {
    local repo=$1

    branch=$(git symbolic-ref --short HEAD)
    echo -n "Will rebase branch: '$branch' Proceed? [y/n]: "
    read ans

    if [[ $ans != "y" ]]; then
        return
    fi

    echo "fetch upstream"
    git fetch upstream
    echo "rebase upstream master to '$branch'"
    git rebase upstream/master
    git status
}
