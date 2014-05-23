set nocompatible
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

"filetype off
"call pathogen#runtime_append_all_bundles()
execute pathogen#infect()
syntax on
"filetype on
filetype indent plugin on
colorscheme koehler
if has("gui_running")
      " GUI is running or is about to start.
      "   " Maximize gvim window.
    set lines=50 columns=150
    colorscheme Mustang_Vim_Colorscheme_by_hcalves
    " remove toolbar, menubar and right scrollbar
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
endif


set tabstop=4
set shiftwidth=4
set shiftround
set smarttab
set softtabstop=4
set autoindent
set nosmartindent
set nobackup
set nowritebackup
set noswapfile
set expandtab
set number
set pastetoggle=<F2>
set backspace=indent,eol,start
set ruler
set hlsearch
set incsearch
set showcmd

set list                        " show tabs and spaces at end of line:
set listchars=tab:>-,trail:.,extends:>

if has("linebreak")
    let &sbr = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines
endif

autocmd FileType html,xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
"autocmd FileType zcml set syntax=xml
autocmd FileType jinja2 set syntax=html


function Comment()
    let cur = getpos(".")
    execute "normal 0i#\<Esc>"
    call setpos(".", cur)
endfunction

function ToggleHLSearch()
    if &hls
        set nohls
    else
        set hls
    endif
endfunction

function ToggleNumber()
    if &number
        set nonumber
    else
        set number
    endif
endfunction

"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

map <buffer> <F9> :w<CR>:!python % <CR>
map! <buffer> <F9> <Esc> :w<CR>:!python % <CR>

map <silent> <F3> ;call ToggleNumber()<CR>
map <silent> <F4> ;call ToggleHLSearch()<CR>
nnoremap <F5> :buffers<CR>:e<Space>#
"map <silent> <F5> :call Comment()<CR>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"map : to ; in order to save ourselves from pressing shift
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

"highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"match OverLength /\%80v.*/
au FileType python set cc=80

"smart tab autocomplete
set wildmenu
"smart tab skip
set wildignore=*.pyc,*.swp
set wildignore+=*.egg-info/**
set wildignore+=__pycache__/**
"When moving vertical, start scrolling 4 lines before reaching the extremity
set so=4

"inserting ipdb will insert 'import pdb;pdb.set_trace()'
iab ipdb import pdb; pdb.set_trace()
"hide pyc files in netrw browser
let g:netrw_list_hide= '.*\.pyc$'

" allows switching to other buffers without saving active one
set hidden
set title

"show whitespaces
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.

" force to use hjkl instead of arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"nnoremap j gj
"nnoremap k gk
let mapleader=","

" show number of lines relative to current line
set relativenumber

" allow undo after closing and reopening file
"set undofile

" allow jumping between opening and closing brackets with tab
nnoremap <tab> %
vnoremap <tab> %

" pressing double zz in insert mode will act as escape button
inoremap zz <esc>

" call ack with ,a
nnoremap <leader>a :Ack 
