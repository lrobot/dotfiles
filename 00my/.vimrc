"https://devhints.io/vimscript
"source ~/dotfiles/.vimrc
" Use the Soarized Dark theme
"set background=dark
"colorscheme default

" https://github.com/changemewtf/no_plugins/blob/master/no_plugins.vim
if executable('ctags')
  "echo "ctags"
endif

set nocompatible
" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
set wildmenu
"let g:netrw_banner=0        " disable annoying banner
let g:netrw_banner=1        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize = 25
"!ctags -R .
"g^]
set csprg=gtags-cscope
"cs add GTAGS
"
set hidden  "when has modified buffer, can hidden to open other new buffer
set nobinary " set binary for windows will cause load crlf file have ^M suffix in every text line
set noignorecase
set nofoldenable
set history=1000
set expandtab
set shiftwidth=2
set tabstop=2
set wildmode=longest,list,full

"https://stackoverflow.com/questions/676600/vim-search-and-replace-selected-text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
"map W :wa<CR>
map! <C-W> <Esc>:wa<CR>a
map <C-k> :cprevious<CR>
map <C-j> :cnext<CR>
map <C-h> :lprevious<CR>
map <C-l> :lnext<CR>
map <C-s> :w!<CR>
let mapleader = "\<Space>"
let mapleader = ","
"echo mapleader

function Bad_function_name()
 throw "Bad_function_name exits"
 set path?
endfunction
try
if exists('*Bad_function_name')
  call Bad_function_name()
else
endif
catch
endtry
if has("gui_running")
endif
if has("gui_macvim")
  "do set macvim specific stuff
  set guioptions+=T "enable Toolbar
  set guifont=Monaco:h14
  set gfn=Consolas:h14
  colorscheme torte
  colorscheme ron
endif

nmap <Leader>t :TagbarToggle<CR>
nmap <Leader>e :NERDTreeToggle<CR>
"let g:airline#extensions#tabline#enabled = 1
let g:ackpreview = 1
"helptags ALL  "genereate help tags for all runtimepath plugin
let g:ctrlp_use_caching = 0
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_match_window='max:25'
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
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" Automatic commands
if has("autocmd")
  autocmd VimEnter * if exists(":NERDTree") | exe "map <F4> ;NERDTreeToggle\<CR>" | endif
endif
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
set nomodeline

" -- .c .cpp .h file indent --
autocmd BufEnter *.[ch],*.cpp,*.cc,*.cxx exec ":call CFileIndent()"
func! CFileIndent()
        set cindent
        set tabstop=2
        set softtabstop=2
        set expandtab
        set shiftwidth=2
endfunc

func! EnableAutoFomatBuffer()
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType vue AutoFormatBuffer prettier
augroup END
endfunc
"autocmd VimEnter * if exists(":AutoFormatBuffer") | call EnableAutoFomatBuffer() | endif



let g:clang_compilation_database = './out'
let g:clang_check_syntax_auto = 1
let g:clang_format_style = 'Chromium'
let g:clang_format_exec = 'clang-format'
let g:clang_format_auto = 0
let g:go_version_warning = 0

if exists('*glaive#Install')
autocmd BufReadPost * call glaive#Install()
autocmd BufReadPost * Glaive codefmt clang_format_style='Mozilla'
autocmd BufReadPost * Glaive codefmt clang_format_style='Chromium'
else
endif



