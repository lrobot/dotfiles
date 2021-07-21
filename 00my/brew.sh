#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";
brew install caskroom/cask/brew-cask
brew install `cat brew.txt | grep -v '#'`

# qqbegin
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install python --with-berkeley-db4
brew install -v --fresh automake autoconf libtool wget
#brew install -v --HEAD --fresh --build-from-source libimobiledevice ideviceinstaller
brew install vim --override-system-vi --with-lua --with-tcl --with-luajit
brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
brew install peco
brew install mc
brew install llvm
brew install nvm
nvm install v14
nvm use v14



sudo xcode-select --install
sudo xcodebuild -license accept


which defaults
which spctl
which diskutil


curl -L https://www.npmjs.com/install.sh | sh
npm install -g react-native-cli
echo sudo spctl --master-disable
defaults write com.apple.dt.Xcode IDEIndexShowLog YES
#softwareupdate -l --all --force --reset-ignored
# qqend
