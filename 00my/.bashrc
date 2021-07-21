#set -x
uname_str=`uname`
if [ 'MINGW64_NT' != "${uname_str:0:10}" ] ; then

[ -f ~/.bashrc_local ] && source ~/.bashrc_local
# i not need ~/dotfiles/.bashrc #if just a jumper
source ~/dotfiles/.bash_profile
source ~/dotfiles/00my/bash_lib
source ~/dotfiles/00my/bash_lib_utils
source ~/dotfiles/00my/bash_cmdlet
source ~/dotfiles/00my/bash_complete
source ~/dotfiles/00my/.bash_inc

fi


