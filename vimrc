"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=/usr/local/share/vim/vundle/Vundle.vim/
" call vundle#begin('/usr/local/share/vim/vundle/')

set rtp+=$VIM/vundle/Vundle.vim/
call vundle#begin('$VIM/vundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'joshdick/onedark.vim'
Plugin 'rakr/vim-one'
" Plugin 'jacoborus/tender.vim'
Plugin 'fatih/vim-go'
Plugin 'tomasr/molokai'
" nerdtree, ctrlp, vimgrep, tools for vim IDE
Plugin 'scrooloose/nerdtree'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'luochen1990/rainbow'
" Plugin 'Valloric/YouCompleteMe'

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
if (has("termguicolors"))
  set termguicolors
endif

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
" netrw -- Vexplore
""""""""""""""""""""""""""""""
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_keepdir = 0
let g:netrw_sort_options = 'i'
" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'

""""""""""""""""""""""""""""""
" => vimgrep
""""""""""""""""""""""""""""""
function! VimgrepHightWord()
    let curword = expand('<cword>')
    execute 'vimgrep /' . curword . '/j  **'
endfunction
nnoremap <leader>vg :call VimgrepHightWord()<cr>

""""""""""""""""""""""""""""""
" => ripgrep
""""""""""""""""""""""""""""""
function! RipgrepCurrentWord()
    let curword = expand('<cword>')
    execute 'Rg -F ' . curword
endfunction
nnoremap <leader>rg :call RipgrepCurrentWord()<cr>

function! RipgrepPerlSubFunction()
    let curword = expand('<cword>')
    execute 'Rg "sub\s+' . curword . '" ./'
endfunction
nnoremap <leader>rp :call RipgrepPerlSubFunction()<cr>

function! RipgrepRegisterZWord()
    let curword = @z
    execute 'Rg -w "' . curword . '" ./'
endfunction
nnoremap <leader>rz :call RipgrepRegisterZWord()<cr>

""""""""""""""""""""""""""""""
" => CtrlP
""""""""""""""""""""""""""""""
let g:ctrlp_cmd = 'CtrlPMRU'

""""""""""""""""""""""""""""""
" => global search
""""""""""""""""""""""""""""""
function! LinesearchForRegisterg()
    let line = @g
    let repl = substitute(line, "\\", "\\\\\\\\", "g")
    let repl = substitute(repl, "[", "\\\\[", "g")
    let repl = substitute(repl, "]", "\\\\]", "g")
    let repl = substitute(repl, "\\.", "\\\\.", "g")
    let repl = substitute(repl, "\\~", "\\\\~", "g")
    let repl = substitute(repl, "/", "\\\\/", "g")
    let repl = substitute(repl, "*", "\\\\*", "g")
    let @g = repl
endfunction

nnoremap <leader>g1  "gye<CR>:Rg -F "<C-R>g"<CR>:call LinesearchForRegisterg()<CR>:match WildMenu /<C-R>g/<CR>
nnoremap <leader>g2  "gy2e<CR>:Rg -F "<C-R>g"<CR>:call LinesearchForRegisterg()<CR>:match WildMenu /<C-R>g/<CR>
nnoremap <leader>g3  "gy3e<CR>:Rg -F "<C-R>g"<CR>:call LinesearchForRegisterg()<CR>:match WildMenu /<C-R>g/<CR>
nnoremap <leader>g4  "gy4e<CR>:Rg -F "<C-R>g"<CR>:call LinesearchForRegisterg()<CR>:match WildMenu /<C-R>g/<CR>
nnoremap <leader>g5  "gy5e<CR>:Rg -F "<C-R>g"<CR>:call LinesearchForRegisterg()<CR>:match WildMenu /<C-R>g/<CR>
nnoremap <leader>g6  "gy6e<CR>:Rg -F "<C-R>g"<CR>:call LinesearchForRegisterg()<CR>:match WildMenu /<C-R>g/<CR>
nnoremap <leader>g7  "gy7e<CR>:Rg -F "<C-R>g"<CR>:call LinesearchForRegisterg()<CR>:match WildMenu /<C-R>g/<CR>
nnoremap <leader>g8  "gy8e<CR>:Rg -F "<C-R>g"<CR>:call LinesearchForRegisterg()<CR>:match WildMenu /<C-R>g/<CR>
nnoremap <leader>g9  "gy9e<CR>:Rg -F "<C-R>g"<CR>:call LinesearchForRegisterg()<CR>:match WildMenu /<C-R>g/<CR>
nnoremap <leader>gw  "gyE<CR>:Rg -F "<C-R>g"<CR>:call LinesearchForRegisterg()<CR>:match WildMenu /<C-R>g/<CR>
nnoremap <leader>ge  "gy$<CR>:Rg -F "<C-R>g"<CR>:call LinesearchForRegisterg()<CR>:match WildMenu /<C-R>g/<CR>

""""""""""""""""""""""""""""""
" => Local search
""""""""""""""""""""""""""""""
function! LinesearchForRegisterl()
    let line = @l
    let repl = substitute(line, "\\", "\\\\\\\\", "g")
    let repl = substitute(repl, "[", "\\\\[", "g")
    let repl = substitute(repl, "]", "\\\\]", "g")
    let repl = substitute(repl, "\\.", "\\\\.", "g")
    let repl = substitute(repl, "\\~", "\\\\~", "g")
    let repl = substitute(repl, "/", "\\\\/", "g")
    let repl = substitute(repl, "*", "\\\\*", "g")
    let @l = repl
endfunction

nnoremap <leader>l1  "lye<CR>:call LinesearchForRegisterl()<CR>/<C-R>l<CR>:match WildMenu /<C-R>l/<CR>
nnoremap <leader>l2  "ly2e<CR>:call LinesearchForRegisterl()<CR>/<C-R>l<CR>:match WildMenu /<C-R>l/<CR>
nnoremap <leader>l3  "ly3e<CR>:call LinesearchForRegisterl()<CR>/<C-R>l<CR>:match WildMenu /<C-R>l/<CR>
nnoremap <leader>l4  "ly4e<CR>:call LinesearchForRegisterl()<CR>/<C-R>l<CR>:match WildMenu /<C-R>l/<CR>
nnoremap <leader>l5  "ly5e<CR>:call LinesearchForRegisterl()<CR>/<C-R>l<CR>:match WildMenu /<C-R>l/<CR>
nnoremap <leader>l6  "ly6e<CR>:call LinesearchForRegisterl()<CR>/<C-R>l<CR>:match WildMenu /<C-R>l/<CR>
nnoremap <leader>l7  "ly7e<CR>:call LinesearchForRegisterl()<CR>/<C-R>l<CR>:match WildMenu /<C-R>l/<CR>
nnoremap <leader>l8  "ly8e<CR>:call LinesearchForRegisterl()<CR>/<C-R>l<CR>:match WildMenu /<C-R>l/<CR>
nnoremap <leader>l9  "ly9e<CR>:call LinesearchForRegisterl()<CR>/<C-R>l<CR>:match WildMenu /<C-R>l/<CR>
nnoremap <leader>lw  "lyE<CR>:call LinesearchForRegisterl()<CR>/<C-R>l<CR>:match WildMenu /<C-R>l/<CR>
nnoremap <leader>le  "ly$<CR>:call LinesearchForRegisterl()<CR>/<C-R>l<CR>:match WildMenu /<C-R>l/<CR>

""""""""""""""""""""""""""""""
" => vimdiff color scheme
""""""""""""""""""""""""""""""
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

""""""""""""""""""""""""""""""
" => map, command
""""""""""""""""""""""""""""""
command! ABD 'a,'bd
command! ABY 'a,'by
nnoremap <Leader>zz  :'a,'bfold<cr>
nnoremap <Leader>zi  :set foldmethod=indent<cr>
nnoremap <C-a>   :'a,'by<cr>
nnoremap <C-e>   :'a,'bd<cr>
nnoremap <C-u>   :%!sort -u<cr>

nnoremap <Leader>b1  :buffer 1<CR>
nnoremap <Leader>b2  :buffer 2<CR>
nnoremap <Leader>b3  :buffer 3<CR>
nnoremap <Leader>b4  :buffer 4<CR>
nnoremap <Leader>b5  :buffer 5<CR>
nnoremap <Leader>b6  :buffer 6<CR>
nnoremap <Leader>b7  :buffer 7<CR>
nnoremap <Leader>b8  :buffer 8<CR>
nnoremap <Leader>b9  :buffer 9<CR>
nnoremap <Leader>bb  :buffer #<CR>
nnoremap <Leader>bp  :buffer #<CR>
nnoremap <Leader>bc  :cclose<CR>


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
    let repl = substitute(repl, "\\~", "\\\\~", "g")
    let repl = substitute(repl, "/", "\\\\/", "g")
    let repl = substitute(repl, "*", "\\\\*", "g")
    let @/ = repl
endfunction
nnoremap <leader>ll :call Linesearch()<cr>

function! MultiWordsSearch()
    let line = getline(".")
    let repl = substitute(line, "\\", "\\\\\\\\", "g")
    let repl = substitute(repl, "[", "\\\\[", "g")
    let repl = substitute(repl, "]", "\\\\]", "g")
    let repl = substitute(repl, "\\.", "\\\\.", "g")
    let repl = substitute(repl, "\\~", "\\\\~", "g")
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
    let repl = substitute(repl, "\\~", "\\\\~", "g")
    let repl = substitute(repl, "/", "\\\\/", "g")
    let repl = substitute(repl, "*", "\\\\*", "g")
    let @/ = repl
endfunction
nnoremap <leader>lh :call Linesearchnoheader()<cr>
nnoremap <leader>cw :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>ce :cd %:p:h<CR>:e .<CR>
nnoremap <leader>cp  :!echo %:p<CR>

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
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#checks = [ ]
" let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long', 'mixed-indent-file' ]

""""""""""""""""""""""""""""""
" => CtrlP.vim
""""""""""""""""""""""""""""""
let g:ctrlp_cmd = 'CtrlPMRU'

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
nnoremap <Leader>ts :!echo --==<C-R><C-w>==-- ;ici <C-R><C-W><CR>

""""""""""""""""""""""""""""""
" => xclip clipboard
""""""""""""""""""""""""""""""
set clipboard=unnamedplus

""""""""""""""""""""""""""""""
" => windows GUI settings
""""""""""""""""""""""""""""""
set guifont=Consolas:h11

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
colorscheme molokai

hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkblue guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkblue guifg=white
set cursorline
let g:airline#extensions#whitespace#enabled = 0

" Substitute with ascending numbers
" %s/pattern/\="pattern" . (line('.') + 8800)/
" %s/pattern88/pattern/
" %s/\d00/\="[" . GlobalIncreasingNumber(). "]"/
" let @/='\d00' | keepjumps silent execute 'normal! gg' | for i in range(1, 9) | keepjumps silent execute 'normal! n' | execute 's/\d00/[' . i . ']/'  | endfor
" :%s/    \([\u4e00-\u9fff," ]\{2,18}\)$/\="第" . GlobalIncreasingNumber() .  "部分  " . submatch(1)/

function! <SID>ColorGroupSynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" a little more informative version of the above
nnoremap <Leader>cg :call <SID>ColorGroupSynStack()<CR>

""""""""""""""""""""""""""""""
" => most common
""""""""""""""""""""""""""""""
" Ignore case when searching
set noignorecase

nnoremap <Leader>sp  :set paste<cr>
nnoremap <Leader>si  :set ignorecase<cr>
nnoremap <Leader>sn  :set noignorecase<cr>
nnoremap <Leader>su  :%!sort -u<cr>
" nnoremap * :keepjumps normal *``<cr>
nnoremap <Leader>sb :set nonumber<CR>
nnoremap <Leader>da :resize +8<CR>
nnoremap <Leader>db :resize -8<CR>
" hi Search term=reverse ctermfg=0 ctermbg=10 guifg=Black guibg=Yellow
nnoremap <F9> <c-w>H
nnoremap <F10> <c-w>K

"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" " vim的菜单乱码解决, 一定要加到最后.
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" source $VIMRUNTIME/delmenu.vim
"" source $VIMRUNTIME/menu.vim

