#/bin/bash
#ORI_DIR=$(dirname $0)
ORI_DIR=$PWD
BASE_DIR=""


function red {
    #echo -e "\033[0;31m$1\033[0m"
    printf "  \033[0;31m$1\033[0m\n"
}

function  green {
    printf "  \033[0;32m$1\033[0m\n"
}

function success {
    green "$*"
}

function fail {
    red $*
}

realpath() {
    [[ $1 = /* ]] && BASE_DIR=$(dirname $1) || BASE_DIR=$(dirname "$PWD/${1#./}")
    cd $BASE_DIR
    BASE_DIR=`pwd`
    #echo $(dirname "$PWD/${1#./}")
    #cd $(dirname "$PWD/${1#./}")
}

config_vim() {
    echo "===step $1: config vim"
    link_dir $BASE_DIR"/vim" $HOME"/.vim"
    link_file $BASE_DIR"/vim/vimrc" $HOME"/.vimrc"
    [ -d $BASE_DIR"/vim/bundle/Vundle.vim" ] || (mkdir -p $BASE_DIR"/vim/bundle"; echo "not has"; cd $BASE_DIR"/vim/bundle"; git clone https://github.com/VundleVim/Vundle.vim.git)
}

config_git(){
    step=$1
    link=$3
    shift 1
    echo "====step $step: config file $link"
    link_file $@
}


config_aliases(){
    echo "===step $1: config aliases"
    link_file $BASE_DIR"/configs/aliases" $HOME"/.aliases"

    if [ -f $HOME'/.bashrc' ]; then
        xx=`grep '\[ -f ~/\.aliases \] && . ~/.aliases' $HOME'/.bashrc' | wc -l`
        if [ $xx == 0 ]; then
            echo " appending aliases PATH to .bashrc"
            echo '[ -f ~/.aliases ] && . ~/.aliases' >> $HOME'/.bashrc'
        #else
            #red "grep res is $xx"
        #    red "aliases already sourceed"
        fi
    fi
}

config_functions(){
    echo "===step $1: config functions"
    link_file $BASE_DIR"/configs/functions" $HOME"/.functions"

    if [ -f $HOME'/.bashrc' ]; then
        xx=`grep '\[ -f ~/\.functions \] && . ~/.functions' $HOME'/.bashrc' | wc -l`
        if [ $xx == 0 ]; then
            echo  "  appending functions PATH to .bashrc"
            echo '[ -f ~/.functions ] && . ~/.functions' >> $HOME'/.bashrc'
        #else
            #red "grep res is $xx"
        #    red "functions already sourceed"
        fi
    fi

    if [ 0 -eq $? ]; then
        green 'appending source .functions to .bashrc successed'
    else
        red 'appending source .functions to .bashrc failed'
    fi
    
}

config_scripts(){
    echo "===step $1: config scipts"
    DDIR=$BASE_DIR
    link_dir $BASE_DIR"/scripts" $HOME"/.scripts"
}

config_tmux(){
    echo "===step $1: config tmux"

    link_dir $BASE_DIR"/tmux" $HOME"/.tmux"
    link_file $BASE_DIR"/tmux/tmux.conf" $HOME"/.tmux.conf"
    TMUX_DIR=$BASE_DIR"/tmux"
    [ -d $TMUX_DIR"/plugins/tpm" ] || (mkdir -p $TMUX_DIR"/plugins"; echo "not has tpm"; cd $TMUX_DIR"/plugins"; git clone https://github.com/tmux-plugins/tpm)
}

config_todo(){
    echo "===step $1: config todo"

    link_dir $BASE_DIR"/todo" $HOME'/.todo'
    link_file $BASE_DIR'/todo/todo.txt' $HOME"/.todo.txt"
}

config_dotfiles_dir() {
    echo "===step $1: config dotfiles dir"
    shift 1
    link_dir $*
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

main() {

    echo "original dir $ORI_DIR"
    realpath "$0"
    echo "base dir is $BASE_DIR"

    config_vim "1"

    config_git "2" $BASE_DIR"/configs/gitconfig" $HOME"/.gitconfig"

    config_aliases "4"

    config_functions "5"

    config_scripts "6"

    config_todo "7"

    config_dotfiles_dir "8" $BASE_DIR $HOME"/.dotfiles"

    config_tmux "9"

}
main 

