"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filename: .vimrc
"
" install:  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"           :BundleInstall
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get out of VI's compatible mode
set nocompatible

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Show line number
set nu
set relativenumber

" Turn on the WiLd menu
set wildmenu

"display the cursor postion in the lower right corner
"set ruler "covered by status line

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
"set cursorline

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \-\-\%P\-\-\ \ Position:\ %l\,\ %c

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Format the tab title
set tabline=%!MyTabLine()

function! MyTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
        let buflist = tabpagebuflist(i)
        let winnr = tabpagewinnr(i)
        let s .= '%' . i . 'T'
        let s .= (i == t ? '%1*' : '%2*')
        let s .= ' '
        let s .= i . ':'
"        let s .= winnr . '/' . tabpagewinnr(i,'$')
"        let s .= ' %*'
        let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
        let bufnr = buflist[winnr - 1]
        let file = bufname(bufnr)
        let buftype = getbufvar(bufnr, 'buftype')
        if buftype == 'nofile'
            if file =~ '\/.'
                let file = substitute(file, '.*\/\ze.', '', '')
            endif
        else
            let file = fnamemodify(file, ':p:t')
        endif
        if file == ''
            let file = '[No Name]'
        endif
        let s .= file
        let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs except makefiles
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

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filemanager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" Filelist and Taglist
map <silent> <leader>fl :NERDTreeToggle<cr>
"map <silent> <leader>tl :Tlist<cr>
"let Tlist_Show_One_File        = 1      " show tags current file only
"let Tlist_Exit_OnlyWindow      = 1      " exit when the taglist is the last
"let Tlist_Use_Right_Window     = 1      " show at right side
"let Tlist_File_Fold_Auto_Close = 1      " auto fold

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" abbreviation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ab abcpp #include <iostream><cr><cr>using std::cout;<cr>using std::cin;<cr>using std::endl;<cr><cr>

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
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>wq :close<cr>
map <leader>wo :only<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close preview window when 'completion'<c-x><c-o>
" set completeopt=longest,menu

" Stop complete when press enter
" inoremap <expr> <cr>    pumvisible()?"\<C-Y>":"\<CR>"

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
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_cache_omnifunc = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_error_symbol = 'E'
let g:ycm_warning_symbol = 'W'
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent><leader>tb :TagbarToggle<cr>
let g:tagbar_autofocus = 1
let NERDSpaceDelims = 1
let g:tagbar_sort = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

" File manage
Plugin 'The-NERD-tree'
Plugin 'kien/ctrlp.vim' "instead of lookupfile
Plugin 'fholgado/minibufexpl.vim'
"Plugin 'taglist.vim'
Plugin 'majutsushi/tagbar' "instead of taglist

" Programs moveing and editing
Plugin 'mbriggs/mark.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
"Plugin 'fcitx.vim'

" Programs check
Plugin 'scrooloose/syntastic'

" Others
Plugin 'altercation/vim-colors-solarized'
Plugin 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Set extra options when running in GUI mode
if has("gui_running")
    set background=dark
    colorscheme solarized
    set guioptions-=T
    set guioptions-=m       "close menu of gvim
    set t_Co=256
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Filecodings
set fileencodings=gb2312,utf-8
set termencoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tests
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
