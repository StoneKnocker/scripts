"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filename: .vimrc
"
" based on: https://github.com/amix/vimrc
" and       https://github.com/easwy/share
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

" Turn on the WiLd menu
set wildmenu

"display the cursor postion in the lower right corner
"set ruler "covered by status line

" Show the command you type
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

"filecodings
set fileencodings=gb2312,utf-8
set termencoding=utf-8

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

"let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
"let g:winManagerWidth = 30
"let g:defaultExplorer = 0
"map <silent> <leader>wm :WMToggle<cr>

" Filelist and Taglist
map <silent> <leader>fl :NERDTreeToggle<cr>
map <silent> <leader>tl :Tlist<cr>

" Buflist: <leader>bv
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" abbreviation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ab #p #! /usr/bin/python<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings about tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open a draft tab
map <silent> <leader>dt :tabnew<cr>:setl buftype=nofile<cr> 

" Disable highlight when <leader><leader> is pressed
map <silent> <leader><leader> :noh<cr>

" Fast saving or leaving
map <leader>ww :w<cr>
map <leader>qq :q<cr>
map <leader>qf :q!<cr>

" Faster way to move between windows
" conflict with tmux
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

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
set completeopt=longest,menu

" Stop complete when press enter
inoremap <expr> <cr>    pumvisible()?"\<C-Y>":"\<CR>"

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
" Lookupfile settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 0
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
let g:LookupFile_UsingSpecializedTags = 1
let g:LookupFile_Bufs_LikeBufCmd = 0
let g:LookupFile_ignorecase = 1
let g:LookupFile_smartcase = 1
if filereadable("./filenametags")
   let g:LookupFile_TagExpr = '"./filenametags"'
endif
nmap <silent> <leader>lf :LUTags<cr>
nmap <silent> <leader>lb :LUBufs<cr>
nmap <silent> <leader>ld :LUWalk<cr>

" Lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
   let _tags = &tags
   try
       let &tags = eval(g:LookupFile_TagExpr)
       let newpattern = '\c' . a:pattern
       let tags = taglist(newpattern)
   catch
       echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
       return ""
   finally
       let &tags = _tags
   endtry

   " Show the matches for what is typed so far.
   let files = map(tags, 'v:val["filename"]')
   return files
endfunction
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mark settings(high lighting)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>hl <Plug>MarkSet
vmap <silent> <leader>hl <Plug>MarkSet
nmap <silent> <leader>hc <Plug>MarkClear
vmap <silent> <leader>hc <Plug>MarkClear
nmap <silent> <leader>hr <Plug>MarkRegex
vmap <silent> <leader>hr <Plug>MarkRegex

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Compiling settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F3> :call RunScript()<cr>

function! RunScript()
    if &filetype == "sh"
        exec "!sh %"
    elseif &filetype == "python"
        exec "!python %"
    endif
endfunction

" makeprg settings
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tmux settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmux_navigator_no_mappings = 1

nmap <silent> <c-h> :TmuxNavigateLeft<cr>
nmap <silent> <c-j> :TmuxNavigateDown<cr>
nmap <silent> <c-k> :TmuxNavigateUp<cr>
nmap <silent> <c-l> :TmuxNavigateRight<cr>
nmap <silent> <c-\> :TmuxNavigatePrevious<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" other plugins
Plugin 'jlanzarotta/bufexplorer'
Plugin 'genutils'
Plugin 'mbriggs/mark.vim'
Plugin 'ervandew/supertab'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'lookupfile'
Plugin 'The-NERD-tree'
Plugin 'taglist.vim'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
