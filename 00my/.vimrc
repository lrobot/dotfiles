source ~/dotfiles/.vimrc
" Use the Soarized Dark theme
set background=dark
colorscheme solarized

"let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
set hidden
" set binary for windows will cause load crlf file have ^M suffix in every text line
set nobinary
set noignorecase


if has("gui_macvim")
  " set macvim specific stuff
  set gfn=Consolas:h14
  "colorscheme torte
  colorscheme morning
  cd /Volumes/MacintoshHD/my/msvn
endif
set nofoldenable
"let g:airline#extensions#tabline#enabled = 1
let g:ackpreview = 1
set history=1000
set expandtab
set shiftwidth=4
set tabstop=4
set wildmenu
set wildmode=longest,list,full
"helptags ALL  "genereate help tags for all runtimepath plugin
let mapleader = "\<Space>"
let mapleader = ","
"echo mapleader
nmap <Leader>t :TagbarToggle<CR>
nmap <Leader>e :NERDTreeToggle<CR>
let g:ctrlp_use_caching = 0
let g:ctrlp_extensions = ['tag', 'buffertag']
"let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript', 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
if executable('ag')
" Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ackprg = 'ag --vimgrep'
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag -l --nocolor -g "" . im/ %s'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif
map <C-k> :cprevious<CR>
map <C-j> :cnext<CR>
map <C-h> :lprevious<CR>
map <C-l> :lnext<CR>
map <C-s> :w!<CR>

" Automatic commands
if has("autocmd")
  autocmd VimEnter * if exists(":NERDTree") | exe "map <F4> ;NERDTreeToggle\<CR>" | endif
endif
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"