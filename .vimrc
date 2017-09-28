"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Young's vimrc in linux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get out of VI's compatible mode
set nocompatible

" Sets how many lines of history VIM has to remember
set history=100

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
autocmd CursorHold * checktime

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

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

" When searching try to be smart about cases 
"set smartcase

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

" Always show the status line
set laststatus=2

" Highlight the screen line of the cursor
" set cursorline
hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Auto read and write
set autoread
set autowriteall

" Format the status line
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \-\-\%P\-\-\ \ Position:\ %l\,\ %c

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

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

set tabstop=4 " 1 tab == 4 spaces
set shiftwidth=4 " indent 4 spaces
set softtabstop=4 "<BS> del 4 spaces

" Linebreak on 79 characters
set linebreak
set textwidth=79

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filemanager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" Filelist
map <silent> <leader>fl :NERDTreeToggle<cr>
let NERDTreeIgnore = ['\.pyc$', '\.vim$']

" Tagbar settings
let g:tagbar_autofocus = 1
let NERDSpaceDelims = 1
let g:tagbar_sort = 0
nmap <silent><leader>tl :TagbarToggle<cr>

" Minibufferexpl
let g:miniBufExplorerAutoStart = 0
let g:miniBufExplMapWindowNavVim    = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs  = 1
let g:miniBufExplModSelTarget       = 1
let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplorerMoreThanOne=2
let g:miniBufExplCycleArround=1
let g:miniBufExplBRSplit = 0
map <silent><leader>bl :MBEToggle<cr>
map <silent><leader>bn :MBEbn<cr>
map <silent><leader>bp :MBEbp<cr>
map <silent><leader>bdo :BcloseOthers<cr>

command! BcloseOthers call <SID>BufCloseOthers()  
function! <SID>BufCloseOthers()  
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings about page tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open a draft tab
map <silent> <leader>dt :tabnew<cr>:setl buftype=nofile<cr> 

" Disable highlight when <leader><leader> is pressed
map <silent> <leader><cr> :noh<cr>

" Fast saving or leaving
map <leader>ww :w<cr>
map <leader>qq :q<cr>

" Useful mappings for managing tabs and windows
map <leader>te :tabedit 
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>wq :close<cr>
map <leader>wo :only<cr>

" Close the preview window automatically
set previewheight=5
autocmd CompleteDone * pclose
set nopreviewwindow

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Edit and source vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <leader>ee :e ~/.vimrc<cr>
map <silent> <leader>ss :source ~/.vimrc<cr>
map <leader>ws :mksession! session.vim<cr>
map <leader>wi :wviminfo! info.vim<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cscope and tag settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=1
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
    cs add cscope.out
    endif
    set csverb
endif

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

set tags=./tags,./TAGS,tags,TAGS
nmap <leader>gc :call job_start(['/bin/bash','-c', '/home/maque/sbin/create_cscope_file.sh'])<cr>
nmap <leader>gt :call job_start(['/bin/bash','-c', '/home/maque/sbin/create_tag_file.sh'])<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mark settings(highlight the word under the cursor)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>hl <Plug>MarkSet
vmap <silent> <leader>hl <Plug>MarkSet
nmap <silent> <leader>hc <Plug>MarkClear
vmap <silent> <leader>hc <Plug>MarkClear
nmap <silent> <leader>hr <Plug>MarkRegex
vmap <silent> <leader>hr <Plug>MarkRegex

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tmux settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmux_navigator_no_mappings = 1

nmap <silent> <c-h> :TmuxNavigateLeft<cr>
nmap <silent> <c-j> :TmuxNavigateDown<cr>
nmap <silent> <c-k> :TmuxNavigateUp<cr>
nmap <silent> <c-l> :TmuxNavigateRight<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_cache_omnifunc = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_confirm_extra_conf = 0
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_show_diagnostics_ui = 0 "work with syntastic
if !exists("g:ycm_semantic_triggers")
      let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToReferences<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neocomplete settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php set completefunc=phpcomplete#CompletePHP

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
nmap <leader>st :SyntasticToggleMode<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigge="<c-k>"
inoremap <c-x><c-k> <c-x><c-k>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:airline_theme='solarized'
let g:airline_theme='dark'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrlp settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_regexp = 1
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|svn)$',
    \ 'file': '\v\.(exe|so|dll|pyc|o|js|html|phtml)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

" File manage
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim' "instead of lookupfile
Plugin 'fholgado/minibufexpl.vim'
Plugin 'majutsushi/tagbar' "instead of taglist

" moveing and editing
Plugin 'mbriggs/mark.vim'
Plugin 'easymotion/vim-easymotion'
" Plugin 'SirVer/ultisnips'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'

" Programs check
Plugin 'scrooloose/syntastic'
" Plugin 'nvie/vim-flake8'
Plugin 'shawncplus/phpcomplete.vim'

" Color schemes
Plugin 'altercation/vim-colors-solarized'

" Others
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Set extra options when running in GUI mode
" if has("gui_running")
    set t_Co=256
    set background=dark
    colorscheme desert
    " set guioptions-=T
    " set guioptions-=m       "close menu of gvim
" endif

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set utf8 as standard encoding
set encoding=utf-8

" Filecodings
set fileencodings=gb2312,utf-8
set termencoding=utf-8

