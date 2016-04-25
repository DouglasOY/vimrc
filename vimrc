"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible	" Use Vim defaults (much better!)

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=7
set history=200

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

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
" set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
" set incsearch
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
colorscheme desert

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

" Do not wake up system with blinking cursor:
let &guicursor = &guicursor . ",a:blinkon0"


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
set autoindent
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

"" In console mode, set mouse=v and set nonumber, then right-click it to copy .
"" In gvim, set mouse=a, apply command y to copy.
set mouse=v
" set mouse=a

"" autocmd GUIEnter * simalt ~x

"" set guioptions-=T
set guioptions=

" number of undos
set undolevels=200

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

" au GUIEnter * simalt ~x

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set clipboard=unnamed

set paste

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

set splitbelow 
set splitright 


""""""""""""""""""""""""""""""
" => map, command
""""""""""""""""""""""""""""""
" Fast saving
nmap <leader>w :w<cr>
nmap <leader>q :qa<cr>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

command! ABD 'a,'bd
command! ABY 'a,'by
command! ZF  'a,'bfold | 'a
map <C-a>   :'a,'by<cr>
map <C-e>   :'a,'bd<cr>


""""""""""""""""""""""""""""""
" => cscope
""""""""""""""""""""""""""""""
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

nmap <leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>sg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>sc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>st :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>se :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>si :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>sd :cs find d <C-R>=expand("<cword>")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" MiniBufExpl Colors
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg


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
nnoremap <leader>/ :echo @/<cr>

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

nnoremap <leader>t :execute 'normal "tyw'<cr>
nnoremap <leader>p :execute 'normal dwh"tp'<cr>

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


function! DebugEchoWordValue()
    let line = getline(".")
    let line = 'echo "' . line . ' = [${' . line . '}]"'
    call setline(".", line)
endfunction

nnoremap <leader>ev :call DebugEchoWordValue()<cr>

function! VsbFunction (arg1)
  execute 'vertical sbuffer ' a:arg1
endfunction
command! -nargs=1 Vsb call VsbFunction(<f-args>)

function! ExecMultiSubstitutions()
  execute 's=\${=!=g'
  execute 's=}=!=g'
  execute 's="==g'
endfunction
nnoremap <leader>bb :call ExecMultiSubstitutions()<cr>

function! CountNumberOfMatches()
    let line = @/
    execute '%s/' . line . '//gn'
endfunction
nnoremap <leader>mc :call CountNumberOfMatches()<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" function! FoldPreprocessor()
"     set foldmarker=#ifdef,#endif
"     set foldmethod=marker
" endfunction
" autocmd FileType *.[ch]{,pp} call FoldPreprocessor()
" 
" " You might also want to consider using:
" set foldmarker=#if,#endif

" navigate preprocessor conditional blocks with the % key
" Also, [# and ]# navigate up/down.
" go to the start of a conditional block (perhaps with /^#Enter) 
" then
"  zf%      -- fold to next conditional directive
"  v2]#zf   -- fold to second next directive (e.g. #else... #endif)

" :[N]Explore[!]  [dir]... Explore directory of current file      :Explore
" :[N]Hexplore[!] [dir]... Horizontal Split & Explore             :Hexplore
" :Rexplore            ... Return to Explorer                     :Rexplore
" :[N]Sexplore[!] [dir]... Split&Explore current file's directory :Sexplore
" :Texplore       [dir]... Tab              & Explore             :Texplore
" :[N]Vexplore[!] [dir]... Vertical   Split & Explore             :Vexplore

" Substitute with ascending numbers
" %s/pattern/\="pattern" . (line('.') + 8800)/
" %s/pattern88/pattern/

" colorscheme golden
" colorscheme vividchalk
" colorscheme vibrantink
" let g:airline_theme='papercolor'
" let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long', 'mixed-indent-file' ]

" let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" let g:rainbow_conf = {
" \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
" \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
" \	'operators': '_,_',
" \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
" \	'separately': {
" \		'*': {},
" \		'tex': {
" \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
" \		},
" \		'lisp': {
" \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
" \		},
" \		'vim': {
" \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
" \		},
" \		'html': {
" \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
" \		},
" \		'css': 0,
" \	}
" \}



