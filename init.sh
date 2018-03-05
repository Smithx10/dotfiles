#!/usr/bin/env bash
OS=$(uname)
APPS=(
    'curl'
    'git' 
    'tmux'
    'vim' 
    )
REPOS=(
    'https://github.com/Valloric/YouCompleteMe'
    'https://github.com/jiangmiao/auto-pairs'
    'https://github.com/kien/ctrlp.vim' 
    'https://github.com/Yggdroot/indentLine'
    'https://github.com/scrooloose/nerdcommenter'
    'https://github.com/ervandew/supertab'
    'https://github.com/ternjs/tern_for_vim'
    'https://github.com/tomtom/tlib_vim'
    'https://github.com/SirVer/ultisnips'
    'https://github.com/vim-airline/vim-airline'
    'https://github.com/honza/vim-snippets'
    )
DIRS=(
    '/.vim'
    '/.vim/bundle'
    '/.vim/autoload'
    '/.vim/colors'
    )

install_vimrc() {
    echo "cloning Smithx10/dotfiles"
    git clone https://github.com/Smithx10/dotfiles
    echo "copying vimrc"
    cp ./dotfiles/.vimrc ${HOME}/.vimrc
}

install_app() {
		# This could def use community support
		if [ -x "$(command -v apt-get)" ]; then
			sudo apt-get update && sudo apt-get install $1 -y

		elif [ -x "$(command -v brew)" ]; then
			brew install $1

		elif [ -x "$(command -v pkg)" ]; then
			sudo pkg install $1

		elif [ -x "$(command -v pacman)" ]; then
			sudo pacman -S $1
		else
                    echo "I'm not sure what your package manager is! Please install $1 on your own and run this deploy script again. Tests for package managers are in the deploy script you just ran starting at line 13. Feel free to make a pull request at https://github.com/parth/dotfiles :)" 
		fi 
}

install_pathogen() {
    if [[ -e ${HOME}/.vim/autoload/pathogen.vim ]]; then
        echo "pathogen.vim already exists"
    else
        echo "Creating ${HOME}/.vim/autoload and curling pathogen.vim there"
        mkdir -p ~/.vim/autoload \
        && curl -LSso ${HOME}/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    fi
}

check_for_apps() {
    for APP in "${APPS[@]}"; do
        echo "Checking to see if $APP is installed"
        if ! [ -x "$(command -v $APP)" ]; then
            install_app $APP
        else
            echo "$APP is installed."
        fi
    done
}

check_for_repos() {
    for REPO in "${REPOS[@]}"; do
        REPODIR=$(echo $REPO | rev | cut -d\/ -f1 | rev)
        if [[ ! -d ${HOME}/.vim/bundle/${REPODIR} ]]; then
            echo "git cloning the repos into bundle"
            git clone $REPO ${HOME}/.vim/bundle/${REPODIR}
        else 
            echo "${HOME}/.vim/bundle/${REPODIR} already exists"
        fi
    done
}

check_for_dirs() {
    for DIR in  "${DIRS[@]}"; do
        if [[ ! -d ${HOME}${DIR} ]]; then
            echo "Creating the Directory ${HOME}${DIR}"
            mkdir -p ${HOME}${DIR}
        else
            echo "${HOME}${DIR} already exists"
        fi
    done
}

main() {
    check_for_apps \
    && install_pathogen \
    && check_for_dirs \
    && check_for_repos \
    && install_vimrc
}

main

