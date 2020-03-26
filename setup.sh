#/bin/bash
#ORI_DIR=$(dirname $0)
ORI_DIR=$PWD
BASE_DIR=""

command_exists() {
        command -v "$@" >/dev/null 2>&1
}

error() {
        echo ${RED}"Error: $@"${RESET} >&2
}

setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		BOLD=$(printf '\033[1m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		BOLD=""
		RESET=""
	fi
}

function red {
    #echo -e "\033[0;31m$1\033[0m"
    printf "  \033[0;31m$1\033[0m\n"
}

function  green {
    printf "  \033[0;32m$1\033[0m\n"
}

realpath() {
    [[ $1 = /* ]] && BASE_DIR=$(dirname $1) || BASE_DIR=$(dirname "$PWD/${1#./}")
    cd $BASE_DIR
    BASE_DIR=`pwd`
    #echo $(dirname "$PWD/${1#./}")
    #cd $(dirname "$PWD/${1#./}")
}

function success {
    green "$*"
}

function fail {
    red $*
}

link_file() {
    source_file=$1
    link=$2
    #TODO check for existance of non symbolic dir and filename. be cursously

    if [ -f $link ]; then 
        if [ -L $link ]; then
            echo "  $link symbolic link dir exiests. unlinking ..."
            unlink $link
        else 
            echo "  dir $link exists"
            echo "  do rm -rf of $link ?"
        fi
    fi
    echo "  linking from $source_file to $link"
    ln -s $source_file $link
    if [ 0 -eq $? ]; then
        green "linking $link successed"
    else 
        red "linking $link failed"
    fi
}

link_dir() {
    source_dir=$1
    link=$2
    #TODO check for existance of non symbolic dir and filename. be cursously

    if [ -d $link ]; then 
        if [ -L $link ]; then
            echo "  $(basename $link) symbolic link dir exiests. unlinking ..."
            unlink $link
        else 
            echo "  dir $link exists"
            echo "  do rm -rf of $link ?"
        fi
    fi
    echo "  linking from $source_dir to $link"
    ln -s $source_dir $link
    if [ 0 -eq $? ]; then
        green "linking $(basename $link) successed"
    else 
        red "linking $(basename $link) failed"
    fi
}

append_source(){
    if [ $# -ne 1 ]; then 
        error "no appending name"
        exit 1
    fi 
    echo "  ${BLUE}append_source with arg $1 ${RESET}"
    if [ -f $HOME'/.bashrc' ]; then
        xx=`grep "\[ -f ~/\$1 \] && . ~/$1" $HOME/.bashrc | wc -l`
        if [ $xx == 0 ]; then
            echo " appending $1 PATH to .bashrc"
            echo "[ -f ~/$1] && . ~/$1" >> $HOME'/.bashrc'
        #else
            #red "grep res is $xx"
        #    red "aliases already sourceed"
        fi
    else
        error "~/.bashrc not exit"
        exit 1
    fi
    if [ 0 -eq $? ]; then
        green 'appending source $1 to .bashrc successed'
    else
        red 'appending source $1 to .bashrc failed'
    fi
}
setup_vim() {
    echo "===step $1: setup vim"
    link_dir $BASE_DIR"/vim" $HOME"/.vim"
    link_file $BASE_DIR"/vim/vimrc" $HOME"/.vimrc"
    [ -d $BASE_DIR"/vim/bundle/Vundle.vim" ] || (mkdir -p $BASE_DIR"/vim/bundle"; echo "not has vim package manager; installing bundle"; cd $BASE_DIR"/vim/bundle"; git clone https://github.com/VundleVim/Vundle.vim.git)
}

setup_git(){
    step=$1
    link=$3
    shift 1
    echo "====step $step: setup up git config linking $link"
    link_file $@
}

setup_aliases(){
    echo "===step $1: config aliases"
    link_file $BASE_DIR"/configs/aliases" $HOME"/.aliases"
    append_source ".aliases"
    return
}

setup_functions(){
    echo "===step $1: config functions"
    link_file $BASE_DIR"/configs/functions" $HOME"/.functions"
    append_source ".functions"
}



setup_scripts(){
    echo "===step $1: config scipts"
    DDIR=$BASE_DIR
    link_dir $BASE_DIR"/scripts" $HOME"/.scripts"
}

setup_tmux(){
    echo "===step $1: config tmux"

    link_dir $BASE_DIR"/tmux" $HOME"/.tmux"
    link_file $BASE_DIR"/tmux/tmux.conf" $HOME"/.tmux.conf"
    TMUX_DIR=$BASE_DIR"/tmux"
    [ -d $TMUX_DIR"/plugins/tpm" ] || (mkdir -p $TMUX_DIR"/plugins"; echo "not has tpm"; cd $TMUX_DIR"/plugins"; git clone https://github.com/tmux-plugins/tpm)
}

setup_todo(){
    echo "===step $1: config todo"

    link_dir $BASE_DIR"/todo" $HOME'/.todo'
    link_file $BASE_DIR'/todo/todo.txt' $HOME"/.todo.txt"
}

setup_dotfiles_dir() {
    echo "===step $1: config dotfiles dir"
    shift 1
    link_dir $*
}

setup_oh_my_zsh() {
    echo "===step $1: config oh my zsh"
    curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    mkdir -p $BASE_DIR/zsh
    export ZSH=${BASE_DIR}"/zsh/oh-my-zsh"
    sh install.sh
    unset ZSH
}

main() {
    setup_color

    USERNAME=$(whoami)
    echo "${YELLOW} hello $USERNAME${RESET}"

    command_exists git || {
        error "git is not installed"
        exit 1
    }

    echo "original dir $ORI_DIR"
    realpath "$0"
    echo "base dir is $BASE_DIR"


    setup_vim "1"

    setup_git "2" $BASE_DIR"/configs/gitconfig" $HOME"/.gitconfig"

    setup_aliases "4"

    setup_functions "5"

    setup_scripts "6"

    setup_todo "7"

    setup_dotfiles_dir "8" $BASE_DIR $HOME"/.dotfiles"

    setup_tmux "9"

    git ls-files | grep -v "setup.sh" | xargs  sed -i -e "s/YOURNAME/${USERNAME}/"

    setup_oh_my_zsh "10"
    return

}
main "$@"

