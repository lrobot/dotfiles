set -x
[ -f ~/.bashrc_local ] && source ~/.bashrc_local
source ~/dotfiles/.bashrc
source ~/dotfiles/00my/bash_lib
source ~/dotfiles/00my/bash_lib_utils
source ~/dotfiles/00my/bash_cmdlet
source ~/dotfiles/00my/bash_complete
source ~/dotfiles/00my/.bash_inc


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
