setlocal
set SCRIPT_DIR="%~d0%~p0"
cd %SCRIPT_DIR%\..\..


rmdir  /q vimfiles
mklink /d vimfiles dotfiles\.vim
rmdir  /q .vim
mklink /d .vim dotfiles\.vim

del /q .bash_rc
mklink .bash_rc dotfiles\00my\.bash_rc
del /q .bash_profile
mklink .bash_profile dotfiles\.bash_profile

del /q .gitconfig
mklink .gitconfig dotfiles\00my\.gitconfig
del /q .gitignore
mklink .gitignore dotfiles\00my\.gitignore

del /q _vimrc
mklink _vimrc dotfiles\00my\.vimrc
del /q .vimrc
mklink .vimrc dotfiles\00my\.vimrc
del /q .gvimrc
mklink .gvimrc dotfiles\00my\.gvimrc


del /q %APPDATA%\Microsoft\Windows\SendTo\gvim.lnk
cscript dotfiles\00my\winmklink.js %APPDATA%\Microsoft\Windows\SendTo\gvim.lnk "C:\Program Files (x86)\vim\vim80\gvim.exe" --remote-tab-silent

rmdir /q .ssh
mklink /d .ssh d:\my_notes\00mycfg\.ssh

