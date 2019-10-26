uname_str=`uname`
if [ 'MINGW64_NT' != ${uname_str:0:10} ] ; then
[ -d /Volumes/MacintoshHD/homebrew/bin ] && export PATH=/Volumes/MacintoshHD/homebrew/bin:$PATH
[ -d /usr/local/Homebrew/bin ] && export PATH=/usr/local/Homebrew/bin:$PATH
[ -d /Users/huangle/tool/depot_tools ] && export PATH=/Users/huangle/tool/depot_tools:$PATH
[ -d /usr/local/bin ] && export PATH=/usr/local/bin:$PATH
[ -d /usr/local/bin ] && export PATH=/Users/hello/go/bin:$PATH


#source ~/dotfiles/.bash_profile
source ~/dotfiles/00my/bash_lib
source ~/dotfiles/00my/bash_lib_utils
source ~/dotfiles/00my/bash_cmdlet
#source ~/dotfiles/00my/bash_complete
source ~/dotfiles/00my/.bash_inc

fi




