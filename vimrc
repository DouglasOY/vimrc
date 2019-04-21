"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$VIM/vundle/Vundle.vim/
call vundle#begin('$VIM/vundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'nanotech/jellybeans.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'rakr/vim-one'
Plugin 'jacoborus/tender.vim'

Plugin 'tomasr/molokai'

" nerdtree, ctrlp, vimgrep, tools for vim IDE
Plugin 'scrooloose/nerdtree'
Plugin 'https://github.com/kien/ctrlp.vim.git'

Plugin 'luochen1990/rainbow'

" Plugin 'Valloric/YouCompleteMe'
Plugin 'dhruvasagar/vim-table-mode'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set to auto read when a file is changed from the outside
set autoread

set bs=indent,eol,start		" allow backspacing over everything in insert mode
set history=200		" keep 200 lines of command line history

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
" set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set noincsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Remember info about open buffers on close
set viminfo='20,\"50	" read/write a .viminfo file, don't store more " than 50 lines of registers
" set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set background=dark

if &term=="xterm"
     set t_Co=256
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> automatically indent lines (default)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent 		" always set autoindenting on
set cindent
set smartindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" set smartcase
set number

set nolist

" number of undos
set undolevels=100

" do i have a fast terminal?
set nottyfast
" continue searching at top when hitting bottom
set wrapscan
"always show the command
set showcmd
" show all changes
set report=0
" Highlight matching parens
set matchpairs=(:),[:],{:},<:>
set updatecount=75

" comment types
set comments=b:#,:%,fb:-,n:),n:> fo=cqrt

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set clipboard=unnamed

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

set splitbelow 
set splitright 

""""""""""""""""""""""""""""""
" => vimgrep
""""""""""""""""""""""""""""""
silent! map <F2> :b#<CR>
silent! map <F3> :cnext<CR>
silent! map <F4> :cprev<CR>

function! VimgrepHightWord()
    let curword = expand('<cword>')
    execute 'vimgrep /' . curword . '/j  **'
endfunction
nnoremap <leader>vg :call VimgrepHightWord()<cr>

""""""""""""""""""""""""""""""
" => CtrlP
""""""""""""""""""""""""""""""
let g:ctrlp_cmd = 'CtrlPMRU'

""""""""""""""""""""""""""""""
" => map, command
""""""""""""""""""""""""""""""
command! ABD 'a,'bd
command! ABY 'a,'by
command! ZF  'a,'bfold | 'a
map <C-a>   :'a,'by<cr>
map <C-e>   :'a,'bd<cr>
map <C-u>   :%!sort -u<cr>

" silent! map <F2> :b1<CR>
" nnoremap * :keepjumps normal *``<cr>
" silent! map <F5> :%!sort -u<CR>
" silent! map <F10> :set noignorecase<CR>
" silent! map <F11> :set nonumber<CR>
" silent! map <F12> dd 
" highlight nonascii guibg=Conceal ctermbg=1 term=standout
" au BufReadPost * syntax match nonascii "[^\u0000-\u007F]"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Linesearch()
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

function! MultiWordsSearch()
    let line = getline(".")
    let repl = substitute(line, "\\", "\\\\\\\\", "g")
    let repl = substitute(repl, "[", "\\\\[", "g")
    let repl = substitute(repl, "]", "\\\\]", "g")
    let repl = substitute(repl, "\\.", "\\\\.", "g")
    let repl = substitute(repl, "/", "\\\\/", "g")
    let repl = substitute(repl, "*", "\\\\*", "g")
    call append(line('.'), repl)
endfunction
nnoremap <leader>ms :call MultiWordsSearch()<cr>

function! Linesearchnoheader()
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
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>ce :cd %:p:h<CR>:e .<CR>
nnoremap <leader>p  :!echo %:p<CR>

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

function! Nohighlightnow()
    let var_s = 'abcdefghijklmnopqrstuvwxyz'
    let var_smode = getregtype('/')
    call setreg('/', var_s, var_smode)
endfunction
nnoremap <leader>nl :call Nohighlightnow()<cr>

function! CountDiffsVimdiff()
    let winview = winsaveview() 
    let num_diffs = 0
    if &diff
        let pos = getpos(".")
        keepj sil exe 'normal! G'
        let lnum = 1
        let moved = 1
        while moved
            let startl = line(".")
            keepj sil exe 'normal! [c'
            let moved = line(".") - startl
            if moved
                let num_diffs+=1
            endif
        endwhile
        call winrestview(winview)
        call setpos(".",pos)
    endif
    return num_diffs
endfunction
nnoremap <leader>dc :let diffcounts = CountDiffsVimdiff()<cr>:echo "total number of changes is [" . diffcounts . "]"<cr>

function! VsbFunction (arg1)
  execute 'vertical sbuffer ' a:arg1
endfunction
command! -nargs=1 Vsb call VsbFunction(<f-args>)

function! ExecMultiSubstitutions()
  execute 's=\${=!=g'
  execute 's=}=!=g'
  execute 's="==g'
endfunction

function! CountNumberOfMatches()
    let line = @/
    execute '%s/' . line . '//gn'
endfunction
nnoremap <leader>mc :call CountNumberOfMatches()<cr>

function! CamelToUnderlineHighlight()
    let origname = @/
    let newname = substitute(origname, "\\", "", "g")
    let newname = substitute(newname, "<", "", "")
    let newname = substitute(newname, ">", "", "")
    " let newname = substitute(newname, "\\([a-z]\\)\\([A-Z]\\)", "\\1_\\l\\2", "g")
    let newname = substitute(newname, "\\([A-Z]\\)", "_\\l\\1", "g")
    " let newname = substitute(newname, "\\([a-z]\\)", "_\\u\\1", "g")
    execute '%s/\<' . origname . '\>/' . newname . '/g'
    " echo "origname = " . origname
    " echo "newname = " . newname
endfunction

function! CamelToUnderline()
    let origname = expand('<cword>')
    let newname = substitute(origname, "\\([A-Z]\\)", "_\\l\\1", "g")
    " let newname = substitute(newname, "\\([a-z]\\)\\([A-Z]\\)", "\\1_\\l\\2", "g")
    " let newname = substitute(newname, "\\([a-z]\\)", "_\\u\\1", "g")
    execute '%s/\<' . origname . '\>/' . newname . '/g'
endfunction
nnoremap <leader>cu :call CamelToUnderline()<cr>

""""""""""""""""""""""""""""""
" => color another word
""""""""""""""""""""""""""""""
function! ColorAnotherWord(type, colorgroup)
    let curword = expand('<cword>')
    let curword = "/" . curword . "/"
    execute a:type . ' ' . a:colorgroup  . ' ' . curword
endfunction

" MatchParen     xxx term=reverse ctermbg=6 guibg=DarkCyan
" Conceal        xxx ctermfg=7 ctermbg=242 guifg=LightGrey guibg=DarkGrey
" SpellBad       xxx term=reverse ctermbg=9 gui=undercurl guisp=Red
" SpellCap       xxx term=reverse ctermbg=12 gui=undercurl guisp=Blue
" SpellRare      xxx term=reverse ctermbg=13 gui=undercurl guisp=Magenta
" SpellLocal     xxx term=underline ctermbg=14 gui=undercurl guisp=Cyan
nnoremap <leader>m1 :call ColorAnotherWord('match', 'SpellCap')<cr>
nnoremap <leader>m2 :call ColorAnotherWord('2match', 'SpellRare')<cr>
nnoremap <leader>m3 :call ColorAnotherWord('3match', 'MatchParen')<cr>
nnoremap <leader>m4 :call ColorAnotherWord('match', 'Conceal')<cr>
nnoremap <leader>m5 :call ColorAnotherWord('2match', 'SpellLocal')<cr>
nnoremap <leader>m6 :call ColorAnotherWord('3match', 'SpellBad')<cr>
nnoremap <leader>mn :match none<cr>:2match none<cr>:3match none<cr>

""""""""""""""""""""""""""""""
" => global increasing number 
""""""""""""""""""""""""""""""
let g:globalincreasingcounter = 0 
function! GlobalIncreasingNumber()
    let g:globalincreasingcounter += 1
    return g:globalincreasingcounter
endfunction

""""""""""""""""""""""""""""""
" => grep
""""""""""""""""""""""""""""""
let Grep_Default_Options = '-r'
let Grep_Skip_Dirs = '.git'

""""""""""""""""""""""""""""""
" MiniBufExpl Colors
""""""""""""""""""""""""""""""
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

""""""""""""""""""""""""""""""
" => airline-themes.vim
""""""""""""""""""""""""""""""
" let g:airline_theme='papercolor'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#checks = [ ]
" let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long', 'mixed-indent-file' ]

""""""""""""""""""""""""""""""
" => CtrlP.vim
""""""""""""""""""""""""""""""
let g:ctrlp_cmd = 'CtrlPMRU'

""""""""""""""""""""""""""""""
" => tender.vim
""""""""""""""""""""""""""""""
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors
endif

" set lighline theme inside lightline config
" let g:lightline = { 'colorscheme': 'tender' }
" set airline theme
" let g:airline_theme = 'tender'

""""""""""""""""""""""""""""""
" => onedark.vim
""""""""""""""""""""""""""""""
let g:lightline = { 'colorscheme': 'onedark' }
let g:airline_theme='onedark'

""""""""""""""""""""""""""""""
" => rainbow.vim
""""""""""""""""""""""""""""""
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

nnoremap <Leader><Bar> :new<CR>:set buftype=nofile bufhidden=wipe noswapfile<CR>
let g:SignatureEnabledAtStartup = 1

""""""""""""""""""""""""""""""
" => fold
""""""""""""""""""""""""""""""
nnoremap zs :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>

""""""""""""""""""""""""""""""
" => translation
""""""""""""""""""""""""""""""
" pip install ici
nmap <Leader>ts :!echo --==<C-R><C-w>==-- ;ici <C-R><C-W><CR>

""""""""""""""""""""""""""""""
" => windows GUI settings
""""""""""""""""""""""""""""""
set guifont=Consolas:h11

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p

" In gvim, set mouse=a, apply command y to copy.
" set mouse=v
set mouse=c

set guioptions=
" autocmd GUIEnter * simalt ~x

" Don't wake up system with blinking cursor:
let &guicursor = &guicursor . ",a:blinkon0"

if has("gui_running")
    set lines=99
    set columns=90
endif

""""""""""""""""""""""""""""""
" => changed frequently
""""""""""""""""""""""""""""""
" colorscheme zenburn
" colorscheme golden
" colorscheme vividchalk
" colorscheme solarized
" colorscheme tender
colorscheme one-dark

hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set cursorline

" Substitute with ascending numbers
" %s/pattern/\="pattern" . (line('.') + 8800)/
" %s/pattern88/pattern/
" %s/\d00/\="[" . GlobalIncreasingNumber(). "]"/
" let @/='\d00' | keepjumps silent execute 'normal! gg' | for i in range(1, 9) | keepjumps silent execute 'normal! n' | execute 's/\d00/[' . i . ']/'  | endfor
" :%s/    \([\u4e00-\u9fff," ]\{2,18}\)$/\="第" . GlobalIncreasingNumber() .  "部分  " . submatch(1)/

""""""""""""""""""""""""""""""
" => most common
""""""""""""""""""""""""""""""
" Ignore case when searching
set noignorecase


nmap <Leader>sp  :set paste<cr>
nmap <Leader>si  :set ignorecase<cr>
nmap <Leader>sn  :set noignorecase<cr>
nmap <Leader>su  :%!sort -u<cr>

" hi Search term=reverse ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim的菜单乱码解决, 一定要加到最后.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
