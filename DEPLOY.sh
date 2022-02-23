#!/bin/bash


# error precaution.
set -e

WORK_DIR="userbot"
mkdir -p $WORK_DIR

disp () {
    echo "-----> $*"
}

indent () {
    sed -u 's/^/       /'
}

_done () {
    echo -e "Done\n" | indent
}

_displaylogo () {
    echo '
===========================================
   Starting...
===========================================
|            VERSION  v0.1.0                 |
|    By: @diemmmmmmmmmm and Ilham Mansiez   |
|           (C) 2021 - Userbot     |
===========================================
'
}

get_branch () {
    local branch
    if [[ $PREF_BRANCH ]]
    then
        branch=$(echo $PREF_BRANCH | xargs)
    else
        branch=petercord
    fi
    echo "/archive/refs/heads/$branch.zip"
}

get_ziplink () {
    local regex
    regex='(https?)://github.com/.+/.+'
    if [[ $UPSTREAM_REPO =~ $regex ]]
    then 
        echo "${UPSTREAM_REPO}$(get_branch)"
    else
        echo "$(echo "aHR0cHM6Ly9naXRodWIuY29tL0lsaGFtTWFuc2llei9QZXRlcmNvcmQ" | base64 -d)$(get_branch)"
    fi
}

_setup_repo () {
    local zippath
    zippath="$WORK_DIR/temp.zip"
    disp "Fetching Update from Upstream Repo"
    wget -qq $(get_ziplink) -O "$zippath"
    _done
    disp "Unpacking Data"
    unzip -qq "$zippath" -d "$WORK_DIR"
    _done
    disp "Cleaning"
    rm -rf "$zippath"
    _done
}

_startbot () {
    local bot_dir
    bot_dir=$(cd $WORK_DIR && ls) && mv "$WORK_DIR/$bot_dir" "Petercord"
    rm -rf $WORK_DIR
    cd "Petercord"
    git init > /dev/null 2>&1
    echo -e ">><< --- >><<  Starting [X]  >><< --- >><<\n" | indent
    bash run
}

begin_x () {
    _displaylogo
    sleep 5
    _setup_repo
    _startbot
}

begin_x
