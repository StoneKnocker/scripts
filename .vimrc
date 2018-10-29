"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
" File manage
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'

" moveing and editing
Plug 'easymotion/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'

" Programs
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'Valloric/YouCompleteMe'
Plug 'fatih/vim-go'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-syntastic/syntastic'

" Frontend
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'

" Color schemes
Plug 'altercation/vim-colors-solarized'

" Others
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get out of VI's compatible mode
set nocompatible

filetype plugin indent on

" Enable syntax highlighting
syntax enable 
set t_Co=256
set background=dark
colorscheme solarized

" Use Unix as the standard file type
set ffs=unix,mac,dos

" Set utf8 as standard encoding
set encoding=utf-8
set fileencodings=utf-8,chinese
set termencoding=utf-8

" Sets how many lines of history VIM has to remember
set history=100

set so=2

" Show line number
set nu
set relativenumber

" Turn on the WiLd menu
set wildmenu

" Show the command you typed
set showcmd

" Height of the command bar
set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2

" Highlight the screen line of the cursor
set cursorline
hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Auto read and write
set autoread
set autowriteall

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Close the preview window automatically
set previewheight=5
autocmd CompleteDone * pclose
set completeopt-=preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs except in makefiles
if &filetype != "make"
    set expandtab
else
    set noexpandtab
endif

" Be smart when indenting
set smarttab

set tabstop=4 " 1 tab = 4 spaces
set shiftwidth=4 " indent 4 spaces
set softtabstop=4 "<BS> del 4 spaces

" Linebreak on 79 characters
" set linebreak
" set textwidth=79

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filemanager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

map <leader>bw :bw<cr>
map <leader>bo :BufOnly<cr>

command! BufOnly call <SID>BufOnly()  
function! <SID>BufOnly()  
   let l:currentBufNum   = bufnr("%")  
   let l:alternateBufNum = bufnr("#")  
   for i in range(1,bufnr("$"))  
     if buflisted(i)  
       if i!=l:currentBufNum  
         execute("bdelete ".i)  
       endif  
     endif  
   endfor  
endfunction  

" Open a draft tab
map <leader>dt :tabnew<cr>:setl buftype=nofile<cr>:set nonu<cr>:set norelativenumber<cr> 

map <leader><cr> :noh<cr>

map <leader>s :w<cr>
map <leader>wq :close<cr>
map <leader>wo :only<cr>

" edit and source vimrc
map <leader>ee :e ~/.vimrc<cr>
map <leader>es :source ~/.vimrc<cr>
map <leader>ws :mksession! session.vim<cr>:wviminfo! info.vim<cr>
map <leader>rs :source session.vim<cr>:rviminfo info.vim<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tmux settings
let g:tmux_navigator_no_mappings = 1
nmap <c-h> :TmuxNavigateLeft<cr>
nmap <c-j> :TmuxNavigateDown<cr>
nmap <c-k> :TmuxNavigateUp<cr>
nmap <c-l> :TmuxNavigateRight<cr>

" YouCompleteMe
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"

" Airline
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>h <Plug>AirlineSelectPrevTab
nmap <leader>l <Plug>AirlineSelectNextTab

" Ctrlp
let g:ctrlp_regexp = 1
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|svn)$',
    \ 'file': '\v\.(exe|so|dll|pyc|o|class)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

" Filelist
map <leader>fl :NERDTreeToggle<cr>
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.class$']

" Tagbar settings
let g:tagbar_autofocus = 1
let NERDSpaceDelims = 1
let g:tagbar_sort = 0
nmap <leader>tl :TagbarToggle<cr>

" terminal
" set splitright
map <leader>tm :vertical terminal<cr>

" go
let g:go_fmt_command = "goimports"
let g:go_def_mode = 'godef'
let g:go_list_type = "quickfix"
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
map <leader>gi :GoImport 

" php
autocmd FileType php setlocal omnifunc=phpactor#Complete
autocmd FileType php setlocal completefunc=phpactor#Complete
let g:phpactorBranch = "develop"
let g:phpactorOmniError = v:true

" frontend
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
