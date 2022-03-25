""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Github: Bedivere7
" Maintainer: Bedivere
"
" Sections:
"   -> General
"   -> VIM user interface
"   -> Colors and Fonts
"   -> Text, tab and indent related
"   -> Key mappings
"   -> Cursor movement
"   -> Status line
"   -> Spell checking
"   -> Misc
"   -> Helper functions
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color compatibility
let &t_ut=''

" Don't compatible vi
set nocompatible

" Open file type check
filetype on

" Jump to matches when entering parentheses
set showmatch
" Tenths of a second to show the matching parenthesis
set matchtime=2

" Auto change work dir
set autochdir

" Copy in system
set clipboard=unnamed

" Set Backspace mode
set bs=eol,start,indent

" Display line number
set number

" Display relative line number
set relativenumber

" The current line displays line
set cursorline

" Terminal default Bash
set shell=bash

" When error
set noerrorbells
set visualbell

" Words check
set spell spelllang=en_us

" cursor line
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Go back to the last edit
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" In normal can use mouse
set mouse=n

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't search again when both ends of the file are searched
set nowrapscan

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Change the terminal's title
set title

" Don't keep a backup file
set nobackup

" Don't create swap file
set noswapfile

" display tab bar
set showtabline=2

" display command line
set showcmd

" display mode
set showmode

" row 5 content
set scrolloff=5

" the new windows open in right
set splitright

" the new windows open in below
set splitbelow


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

try
    colorscheme slate
catch
endtry

set background=dark
colorscheme desert

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
set smarttab
set shiftround

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" list
set list
set listchars=tab:▸\ ,trail:▫

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set <LEADER> as <SPACE>
let mapleader="\<Space>"

" disable the default s key
noremap s <nop>

" Save & quit
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap S :w<CR>


" insert Key
noremap u i
noremap U I

" Undo operations
noremap l u

" make Y to copy till the end of the line
nnoremap Y y$

" copy to system clipboard
vnoremap Y "+y

" indentation
nnoremap < <<
nnoremap > >>

" search
nnoremap = n
nnoremap - N
noremap <LEADER><CR> :nohlsearch<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cursor movement
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" new cursor movement (the default arrow keys are used for resizing windows)
"noremap <silent> h h
noremap <silent> n j
noremap <silent> e k
noremap <silent> i l
noremap <silent> ge gk
noremap <silent> gn gj

" E/N keys for 5 times e/n (faster navigation)
noremap <silent> E 5k
noremap <silent> N 5j

" H key: go to the start of the line
noremap <silent> H 0
" I key: go to the end of the line
noremap <silent> I $

" faster in-line navigation
noremap W 5w
noremap B 5b

" set k (same as n, cursor left) to 'end of word'
noremap k e


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ Line:\ %l\ \ Column:\ %c

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open the vimrc file anytime
noremap <LEADER>rc :e $HOME/.vimrc<CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" run application
noremap <F5> :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        set splitbelow
        exec "!g++ -std=c++11 % -Wall -o %<"
        :sp
        :res -15
        :term ./%<
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        set splitbelow
        :sp
        :term python3 %
    elseif &filetype == 'html'
        silent! exec "!".g:mkdp_browser." % &"
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'tex'
        silent! exec "VimtexStop"
        silent! exec "VimtexCompile"
    elseif &filetype == 'dart'
        exec "CocCommand flutter.run -d ".g:flutter_default_device
        CocCommand flutter.dev.openDevLog
    elseif &filetype == 'javascript'
        set splitbelow
        :sp
        :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
    elseif &filetype == 'go'
        set splitbelow
        :sp
        :term go run .
    endif
endfunc

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
