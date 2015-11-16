"" .vimrc for vim

" autoselect current buffer -- switch to buffer when trying to exit without saving
set cb=autoselect
" turn off vi compat
set nocompatible
" keep indentation when no filetype-specific
set autoindent
" indent is four spaces
set sw=4
" tab is four spaces
set ts=4
" no such thing as tab (it's spaces)
set expandtab
" backspace through autoindent, line break, start of insert action
set backspace=indent,eol,start
" arrow key goes through linebreaks
set whichwrap=b,s,l,h,<,>,[,]
set icon
set title
set showbreak=""
set noeol
set hlsearch
set keywordprg=man\ -k
set formatprg=fmt
" hidden buffers -- move through buffers without necessarily saving
set hidden
set switchbuf=useopen
set showmatch
set matchtime=1
set showcmd
" don't redraw while executing macros
set lazyredraw
set viminfo='20,\"50
set history=40
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set cpoptions=aABceFs
set smartcase
set autowrite
" distance to end of screen
set scrolloff=3
set nosmartindent

set report=0
set wildmenu
set cursorline
au FileType python let &colorcolumn=join(range(111,999),",")

filetype on

if has("mouse")
  set mouse=a
  set mousemodel=extend
  set mousefocus
  set mousehide
endif

if has("syntax")
  syntax on
endif

if has("autocmd")
  " automatically delete trailing DOS-returns and trailing whitespaces
  autocmd BufWritePre *.c,*.h,*.y,*.yy,*.l,*.ll,*.C,*.cpp,*.hh,*.cc,*.hxx,*.cxx,*.hpp,*.java,*.rb,*.py,*.m4,*.pl,*.pm,*.html silent! %s/[\r \t]\+$//
endif

" Key mapping

imap <C-SPACE> <C-P>

" Paste
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Hide coloration of found words
map <C-C> :nohlsearch<CR>

imap <C-TAB> <C-V><C-TAB>

" Colors for line numbers
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=None

" Paste toggle
set pastetoggle=<C-P>
noremap <C-P> :set invpaste<CR>

nmap _Y :!echo ""> ~/.vi_tmp<CR><CR>:w! ~/.vi_tmp<CR>
vmap _Y :w! ~/.vi_tmp<CR>
nmap _P :r ~/.vi_tmp<CR>

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'lukaszb/vim-web-indent'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'
Plugin 'tmhedberg/matchit'
Plugin 'voithos/vim-python-matchit'
Plugin 'tpope/vim-surround'
Plugin 'mpage'
Plugin 'Vundle.vim'
Plugin 'python.vim'
Plugin 'nvie/vim-flake8'

call vundle#end()

filetype plugin indent on

set encoding=utf-8
set t_Co=256

" NERDtree

" Surround mappings

let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"


" Mapping window splits nav shortcuts
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

map <C-x> :close<CR>

" Flake8
autocmd FileType python map <buffer> <C-n> :call Flake8()<CR>

let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--config=$HOME/.config/flake8'
let g:syntastic_enable_signs=0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

"tim
" Airline
" set laststatus=0
" let g:airline_theme="my_airline"
" let g:airline_section_a = "a"
" let g:airline_section_b = "b"
" let g:airline_section_c = "c"
" let g:airline_section_x = "x"
" let g:airline_section_y = "y"
" let g:airline_section_z = "z"
" let g:airline_section_gutter = "g"
" let g:airline_section_warning = "w"
" let g:airline_left_sep = "l"
" let g:airline_left_alt_sep = "lz"
" let g:airline_right_sep = "r"
" let g:airline_right_alt_sep = "rz"

syntax on
set bs=2
set softtabstop=4
set ai
set noincsearch
set nobackup
set noswapfile

execute pathogen#infect()
let g:solarized_termcolors=256
if &term =~ '256color'
        " Disable Background Color Erase (BCE) so that color schemes
        " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd BufNewFile,BufRead *.html set filetype=htmldjango
autocmd BufNewFile,BufRead *.html set syntax=htmldjango

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" on save any: trim trailing whitespace^[[M $"
autocmd! BufWrite * mark ' | silent! %s/\s\+$// | norm ''
nnoremap <silent> <F6> <esc>oimport pdb; pdb.set_trace()<esc>
nnoremap <silent> <F5> <esc>oimport pudb; pudb.set_trace()<esc>
"colorscheme apprentice
"colorscheme Tomorrow-Night-Eighties
"colorscheme zenburn
"colorscheme flattened_light
"colorscheme pencil
colorscheme summerfruit256
autocmd BufRead,BufNewFile,BufEnter *.py colorscheme summerfruit256
autocmd BufRead,BufNewFile,BufEnter *.css colorscheme summerfruit256
autocmd BufRead,BufNewFile,BufEnter *.html colorscheme summerfruit256
set background=light
let g:SimpylFold_docstring_preview = 1

let mapleader = ","
map <leader>n :noh<CR>
map <leader>m :set invnumber<CR>
map <leader>k :set relativenumber!<cr>
map <leader>r :redraw!<CR>
map <leader>q :lprevious<CR>
map <leader>w :lnext<CR>
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
map <leader>a :bn<CR>
map <leader>s :bp<CR>
map <leader>t :NERDTreeToggle<CR>
map <leader>c :SyntasticCheck<CR>

hi CursorLine cterm=NONE ctermbg=254

setlocal foldmethod=indent
set foldnestmax=1
set foldlevel=1

set noruler
set statusline=
set statusline+=%100l
hi StatusLine ctermbg=none cterm=bold
set ls=2
