#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")" 
cd ~
pwd
set -x
set -e

#CONFIG="install.conf.yaml"
#DOTBOT_DIR="dotbot"

#DOTBOT_BIN="bin/dotbot"
#BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#cd "${BASEDIR}"
#git -C "${DOTBOT_DIR}" submodule sync --quiet --recursive
#git submodule update --init --recursive "${DOTBOT_DIR}"

#"${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" "${@}"

create_symlink () {
    cd ~
    rm -f $1
    ln -s $2 $1
}



cd ~
create_symlink .vim dotfiles/.vim
create_symlink .bash_prompt dotfiles/.bash_prompt
create_symlink .curlrc dotfiles/.curlrc
create_symlink .editorconfig dotfiles/.editorconfig
create_symlink .exports dotfiles/.exports
create_symlink .functions dotfiles/.functions
create_symlink .gdbinit dotfiles/.gdbinit
create_symlink .hgignore dotfiles/.hgignore
create_symlink .hushlogin dotfiles/.hushlogin
create_symlink .inputrc dotfiles/.inputrc



create_symlink .npmrc dotfiles/00my/.npmrc
create_symlink .pythonrc dotfiles/00my/.pythonrc
create_symlink .lldbinit dotfiles/00my/.lldbinit
create_symlink .bashrc dotfiles/00my/.bashrc
create_symlink .bash_profile dotfiles/00my/.bash_profile
create_symlink .gitconfig dotfiles/00my/.gitconfig
create_symlink .gitignore dotfiles/00my/.gitignore
create_symlink .gitattributes dotfiles/00my/.gitattributes
create_symlink .vimrc dotfiles/00my/.vimrc
create_symlink .gvimrc dotfiles/00my/.gvimrc


create_symlink .ssh ~/my_notes/00mycfg/.ssh
#https://medium.com/@tahteche/how-git-treats-changes-in-file-permissions-f71874ca239d
# file permission user+group+other, because git not record group+other permission, need chmod 600 .ssh/config
chmod 600 ~/.ssh/*


