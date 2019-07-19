

~/dotfiles/install.sh
~/dotfiles/00my/install.sh
~/dotfiles/00my/git-sync-deps
(cd ~/dotfiles/.vim/pack/myqpack/start/YouCompleteMe/ && {
   git submodule update --init --recursive
   ./install.py
})





#this is a fork from https://github.com/mathiasbynens/dotfiles
#git subtree add --prefix dotbot https://github.com/anishathalye/dotbot.git  master --squash
#cp dotbot/tools/git-submodule/install .

#cd ~/dotfiles/ && ./install
#./shell/setup.sh

#test autobackup
#launchctl load ~/Library/LaunchAgents/com.lrobot.gitbackup.plist

