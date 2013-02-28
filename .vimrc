set nocompatible
set mouse=a             " hold shift to copy xterm
set ttymouse=xterm2     " necessary for gnu screen & mouseet mouse=a
set enc=utf-8
set fileencoding=utf-8
syntax enable
set background=dark

cabbrev e <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'tabedit' : 'e')<CR>
cabbrev bn <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'tabNext' : 'bn')<CR>
cabbrev nb <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'tabNext' : 'bn')<CR>
cabbrev bp <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'tabprevious' : 'bp')<CR>
cabbrev pb <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'tabprevious' : 'bp')<CR>
set t_Co=256
if &term =~ '^screen'
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after,~/.vim/bundle/webapi-vim,~/.vim/bundle/googletasks-vim


filetype plugin on
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to alway generate a file-name.
"é
" write four spaces instead of tab
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4   " make the four spaces feel like a tab
 
" OPTIONAL: This enables automatic indentation as you type.
filetype indent on
 
syntax on
 
" show cursor position all the time
set ruler
 
" line numbering
set nu
 
 
set guifont=DejaVu\ Sans\ Mono\ 10
 
" manual folding
set foldmethod=marker
 
" Save the folding state automatically 
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Arrêt de couper des mots !!
set lbr
"map <Esc>[27;6;9 <C-S-Tab>
"map <Esc>[27;5;9 <C-Tab> 
"map <C-Tab>  
"map <C-S-Tab> <Esc>:tabprevious
"map <C-Tab> <Esc>:tabnext

nmap <F2> :update<CR>
vmap <F2> <Esc><F2>gv
imap <F2> <c-o><F2>

map <Esc>[27;5;9~ <Esc>:tabnext<CR>
map <Esc>[27;6;9~ <Esc>:tabprevious<CR>

" keep at least 5 lines above/below cursor
set scrolloff=8
 
" show me where i am
set cursorline
 
set incsearch           " is:  show partial matches as search is entered
set hlsearch            " hls:  highlight search patterns
set ignorecase          " Ignore case distinction when searching
set smartcase           " ... unless there are capitals in the search string

" Spelling
set spelllang=fr 
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline



map <M-Esc>[62~ <MouseDown>
map! <M-Esc>[62~ <MouseDown>
map <M-Esc>[63~ <MouseUp>
map! <M-Esc>[63~ <MouseUp>
map <M-Esc>[64~ <S-MouseDown>
map! <M-Esc>[64~ <S-MouseDown>
map <M-Esc>[65~ <S-MouseUp>
map! <M-Esc>[65~ <S-MouseUp>

" Reglage de la latex suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
autocmd FileType tex set textwidth=80 


set completeopt=longest,menuone
execute pathogen#infect()
"let g:solarized_termcolors=256
colorscheme solarized
