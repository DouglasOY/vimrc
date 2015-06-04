set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=200		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
let &guicursor = &guicursor . ",a:blinkon0"

"" ===================================================
" automatically indent lines (default)
set autoindent
set cindent
set smartindent

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

set nobackup
set noswapfile

" set smartcase
set ignorecase
set hlsearch
set number

set is
set noincsearch

set nolist
"" set cmdheight=2

"" In console mode, set mouse=v and set nonumber, then right-click it to copy .
"" In gvim, set mouse=a, apply command y to copy.
set mouse=v
" set mouse=a

"" autocmd GUIEnter * simalt ~x

"" set guioptions-=T
set guioptions=

" show the laststatus line always
set laststatus=2
" number of undos
set undolevels=200

" do i have a fast terminal?
set nottyfast
" fuck the beeps
set noerrorbells
" for hidden buffers
set hidden
" continue searching at top when hitting bottom
set wrapscan
"always show the command
set showcmd
" Continue searching at top when hitting bottom
set smarttab
" show all changes
set report=0
" Highlight matching parens
set matchpairs=(:),[:],{:},<:>
" no the terminal is not always fast
" fancy menu
set wildmenu
set uc=75
let mapleader=","
let g:mapleader=","

" Use brighter colors if your xterm has a dark background.
if &term =~ "xterm"
  set background=dark
  " set background=light
endif

" comment types
set comments=b:#,:%,fb:-,n:),n:> fo=cqrt

" CTRL-X and SHIFT-Del are Cut
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
" map <C-V>       "+gP
map <S-Insert>      "+gP
imap <S-Insert>   "+gP
vmap <S-Insert>   "+gP

" au GUIEnter * simalt ~x

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set clipboard=unnamed

command ABD 'a,'bd
command ABY 'a,'by
map <C-a>   :'a,'by<cr>
map <C-e>   :'a,'bd<cr>

set vb t_vb=
set paste
set novisualbell
colorscheme ron
map <C-p>   :b#<cr>
" MiniBufExpl Colors
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

set splitbelow 
set splitright 

" if &diff
"     " diff mode
"     set diffopt+=iwhite
" endif

function Linesearch()
    let line = getline(".")
    let repl = substitute(line, "\\", "\\\\\\\\", "g")
    let repl = substitute(repl, "[", "\\\\[", "g")
    let repl = substitute(repl, "]", "\\\\]", "g")
    let repl = substitute(repl, "\\.", "\\\\.", "g")
    let repl = substitute(repl, "/", "\\\\/", "g")
    let repl = substitute(repl, "*", "\\\\*", "g")
    let @/ = repl
endfunction

nnoremap <leader>l :call Linesearch()<cr>
" nnoremap <leader>l :call Linesearch()<cr>n
nnoremap <leader>/ :echo @/<cr>


function Linesearchnoheader()
    let line = getline(".")
    let repl = substitute(line, "^.\\s*", "", "")
    let repl = substitute(repl, "\\", "\\\\\\\\", "g")
    let repl = substitute(repl, "[", "\\\\[", "g")
    let repl = substitute(repl, "]", "\\\\]", "g")
    let repl = substitute(repl, "\\.", "\\\\.", "g")
    let repl = substitute(repl, "/", "\\\\/", "g")
    let repl = substitute(repl, "*", "\\\\*", "g")
    let @/ = repl
endfunction

nnoremap <leader>h :call Linesearchnoheader()<cr>
" nnoremap <leader>h :call Linesearchnoheader()<cr>n
" nnoremap <leader>cd :cd %:p:h<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>ce :cd %:p:h<CR>:e .<CR>

nnoremap <F8> :vertical wincmd f<CR>

function! Appendwordtoregister()
    let var_s = getreg('/', 1)
    let var_smode = getregtype('/')
    let curword = expand('<cword>')

    if var_s != ""
        if curword != ""
            let var_s = substitute(var_s, "^\\\\(", "", "")
            let var_s = substitute(var_s, "\\\\)$", "", "")
            let var_s = '\(' . var_s . '\|' . curword . '\)'
        endif
    else
        let var_s = curword
    endif

    call setreg('/', var_s, var_smode)
endfunction

nnoremap <leader>a :call Appendwordtoregister()<cr>

function! Nohighlightnow()
    let var_s = 'abcdefghijklmnopqrstuvwxyz'
    let var_smode = getregtype('/')
    call setreg('/', var_s, var_smode)
endfunction

nnoremap <leader>nl :call Nohighlightnow()<cr>

