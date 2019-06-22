source ~/dotfiles/.gvimrc
set guifont=Monaco:h14
set guifont=Consolas:h14
set gfn=Consolas:h14
colorscheme torte
set linespace=0


"menu define
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
an 10.320 &File.new\ &tab<Tab>:tabnew	:tabnew<CR>
set nomodeline