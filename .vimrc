" truc/astuce vim, tips {
" :source ~/android/main/linux/kernel/Documentation/trace/function-graph-fold.vim

"g \cg : position exacte du curseur
" \cg: status du buffer.
" ga code ascii du curseur
" echo char2nr(getline('.')[col('.')-1])
" gv :pour reselectionner la derniere visual
" ctrl+n/p pour la completion
" mode ctrl+x terrible !
" :fold reduire les blocs d'instructions
" zz me replacer au centre de l'ecran en restant au même endroit dans le text (pas M car il ne deplace pas le text)
" copie le buffer (issue d'un y) dans la ligne de commande. (Tip #383) \cr"
" revenir a la derniere modification '.
" inverser les ligne d'une selection (sauf la premiere): :'<,'>g/./m'<
" }

" je cherche a faire: {
"  }

" set guifont=-b&h-lucidatypewriter-medium-r-normal-*-*-140-*-*-m-*-iso8859-15
" set encoding=iso-8859-15
"set encoding=utf-8
"set fileencoding=utf-8

"set encoding&      " terminal charset: follows current locale
"set termencoding=
"set fileencodings=   " charset auto-sensing: disabled
"set fileencoding&   " auto-sensed charset of current buffer


set incsearch
" set digraph

autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


set modeline
set modelines=5

filetype plugin on
filetype plugin indent on

" set background=light
" colorscheme solarized
" colorscheme guardian
colorscheme manxome

set hlsearch

set showmatch
"set scrolloff=10
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults (much better!)
set backspace=2		" allow backspacing over everything in insert mode
" Now we set some defaults for the editor
set autoindent		" always set autoindenting on
set textwidth=0		" Don't wrap words by default
set nobackup		" Don't keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than
			" 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set isfname=@,48-57,/,.,-,_,+,,,#,$,%,~
" set iskeyword=@,48-57,_
set iskeyword=@,48-57,192-255,_

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=<ESC>[3%dm
  set t_Sb=<ESC>[4%dm
endif

" Vim5 comes with syntaxhighlighting. If you want to enable syntaxhightlighting
" by default uncomment the next three lines.
"if has("syntax")
"  syntax on		" Default to no syntax highlightning
"endif


if has("autocmd")

" Set some sensible defaults for editing C-files
augroup cprog
  " Remove all cprog autocommands
  au!

  " When starting to edit a file:
  "   For *.c and *.h files set formatting of comments and set C-indenting on.
  "   For other files switch it off.
  "   Don't change the order, it's important that the line with * comes first.
  autocmd BufRead *       set formatoptions=tcql nocindent comments&
  autocmd BufRead *.cpp,*.c,*.h set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
augroup END

" " Also, support editing of gzip-compressed files. DO NOT REMOVE THIS!
" " This is also used when loading the compressed helpfiles.
" augroup gzip
"   " Remove all gzip autocommands
"   au!
"
"   " Enable editing of gzipped files
"   "	  read:	set binary mode before reading the file
"   "		uncompress text in buffer after reading
"   "	 write:	compress file after writing
"   "	append:	uncompress file, append, compress file
"   autocmd BufReadPre,FileReadPre	*.gz set bin
"   autocmd BufReadPre,FileReadPre	*.gz let ch_save = &ch|set ch=2
"   autocmd BufReadPost,FileReadPost	*.gz '[,']!gunzip
"   autocmd BufReadPost,FileReadPost	*.gz set nobin
"   autocmd BufReadPost,FileReadPost	*.gz let &ch = ch_save|unlet ch_save
"   autocmd BufReadPost,FileReadPost	*.gz execute ":doautocmd BufReadPost " . expand("%:r")
"
"   autocmd BufWritePost,FileWritePost	*.gz !mv <afile> <afile>:r
"   autocmd BufWritePost,FileWritePost	*.gz !gzip <afile>:r
"
"   autocmd FileAppendPre			*.gz !gunzip <afile>
"   autocmd FileAppendPre			*.gz !mv <afile>:r <afile>
"   autocmd FileAppendPost		*.gz !mv <afile> <afile>:r
"   autocmd FileAppendPost		*.gz !gzip <afile>:r
" augroup END
"
" augroup bzip2
"   " Remove all bzip2 autocommands
"   au!
"
"   " Enable editing of bzipped files
"   "       read: set binary mode before reading the file
"   "             uncompress text in buffer after reading
"   "      write: compress file after writing
"   "     append: uncompress file, append, compress file
"   autocmd BufReadPre,FileReadPre        *.bz2 set bin
"   autocmd BufReadPre,FileReadPre        *.bz2 let ch_save = &ch|set ch=2
"   autocmd BufReadPost,FileReadPost      *.bz2 |'[,']!bunzip2
"   autocmd BufReadPost,FileReadPost      *.bz2 let &ch = ch_save|unlet ch_save
"   autocmd BufReadPost,FileReadPost      *.bz2 execute ":doautocmd BufReadPost " . expand("%:r")
"
"   autocmd BufWritePost,FileWritePost    *.bz2 !mv <afile> <afile>:r
"   autocmd BufWritePost,FileWritePost    *.bz2 !bzip2 <afile>:r
"
"   autocmd FileAppendPre                 *.bz2 !bunzip2 <afile>
"   autocmd FileAppendPre                 *.bz2 !mv <afile>:r <afile>
"   autocmd FileAppendPost                *.bz2 !mv <afile> <afile>:r
"   autocmd FileAppendPost                *.bz2 !bzip2 -9 --repetitive-best <afile>:r
" augroup END

endif " has ("autocmd")

" Some Debian-specific things
augroup filetype
  au BufRead reportbug.*		set ft=mail
augroup END

" The following are commented out as they cause vim to behave a lot
" different from regular vi. They are Highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
" auto indentation pour la programmation
" permet d'avoir la position
"mes fichier sont unix tout le temps
set fileformats=unix
set formatoptions=rtql

" pas de copie de sauvegarde
set nobackup

" permet les couleurs pour la prog
" autocmd BufRead *.sh,*.c,*.h,*.pl,mutt*,*.php,*.php3,*.html,*.htm syntax on
syntax on

autocmd BufRead *.votl set foldenable
autocmd BufRead .followup,.article*,.letter,/tmp/mutt*,*.txt,.signature*,signature* set ft=mail
autocmd BufRead .followup,.article*,.letter,/tmp/mutt*,*.txt,.signature*,signature* set nomodeline
autocmd BufRead .followup,.article*,.letter,/tmp/mutt*,*.txt,.signature*,signature* set noautoindent
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* normal ;vide

" pour la prog avec mots clés
autocmd BufRead *.html,*.htm set ft=html
autocmd BufRead *.inc,*.php,*.php3 set ft=php
autocmd BufRead *.c,*.h set ft=c
autocmd BufRead *.sh set ft=sh
autocmd BufRead *.pl set ft=perl
autocmd BufRead *logcat* set ft=logcat
autocmd BufRead *aplog* set ft=logcat
autocmd BufRead *.mk set et
autocmd BufRead *.mk set ts=2
autocmd BufRead *.mk set sw=2

" commente/decommenter auto
autocmd BufEnter *.sh,*.pl,*rc vmap ;com :s/^/# /<CR>
autocmd BufEnter *.sh,*.pl,*rc vmap ;uncom :s/^#[<TAB> ]//<CR>
autocmd BufEnter *.htm,*.html,*.xml,*.wml vmap ;com :<backspace><backspace><backspace><cr>O<!--<esc>:'><cr>o--><esc>
autocmd BufEnter *.html,*.php,*.php3 vmap ;table :<backspace><backspace><backspace><cr>O<table><esc>:'><cr>o</table><esc>
autocmd BufEnter *.html,*.php,*.php3 vmap ;tr <tab>O<tab><tr><esc>:'><cr>o<tab></tr><esc>
autocmd BufEnter *.html,*.php,*.php3 vmap ;td <tab>O<tab><td><esc>:'><cr>o<tab></td><esc>
autocmd BufEnter *.html,*.php,*.php3 vmap ;form <tab>O<tab><form action=\".\" method=get enctype=\"text/plain\"><esc>:'><cr>o<tab></form><esc>
autocmd BufEnter *.php,*.php3 nnoremap gx yiw/^\(sub\<bar>function\)\s\+<C-R>"<CR>
autocmd BufEnter *.vimrc vmap ;com :s/^/" /<CR>
autocmd BufEnter *.vimrc vmap ;uncom :s/^"[<TAB> ]//<CR>
autocmd BufEnter *.php,*.c,*.h,*.cc,*.C,*.H,*.hh,*.cpp,*.cxx,*.c++,*.y,*.l vmap ;com :s/^/\/\/ /g<CR>
autocmd BufEnter *.php,*.c,*.h,*.cc,*.C,*.H,*.hh,*.cpp,*.cxx,*.c++,*.y,*.l vmap ;uncom :s/^\/\/[<TAB> ]//g<CR>
" map!  <ESC>lxi
" nnoremap  x
" nnoremap  hx

" backspace     
" map! <S- > <M- >
map!  <backspace>
" nnoremap  hx
" map! <ESC>Oq 1
" map! <ESC>Or 2
" map! <ESC>Os 3
" map! <ESC>Ot 4
" map! <ESC>Ou 5
" map! <ESC>Ov 6
" map! <ESC>Ow 7
" map! <ESC>Ox 8
" map! <ESC>Oy 9
" map! <ESC>OQ /
" map! <ESC>OR *
" map! <ESC>OS -
" map! <ESC>Ol +
" map! <ESC>OM <CR>
" map! <ESC>On .
" map! <ESC>Op 0
nnoremap [2~ 0
nnoremap [4~ $
"map! [2~ <esc>I
"map! [4~ <esc>A

"tabulation
vnoremap <TAB> >
vnoremap <S-TAB> <
nnoremap <TAB> >>
" nnoremap <ESC>[Z <<
vnoremap <TAB> >
" vnoremap <ESC>[Z <
" vnoremap <SHIFT><TAB> <
"inoremap  <esc>O
"inoremap  <esc>o

" Editer le .vimrc
nnoremap ;v :split ~/.vimrc " <CR>:source ~/.vimrc<CR>
" Reload le .vimrc sans quitter vim
" autocmd BufLeave .vimrc :source ~/.vimrc<CR>
" autocmd BufWritePost ~/.vimrc :source ~/.vimrc

"marche pas sur deb apparement...
" highlight Search      term=reverse ctermbg=2 guibg=Yellow
" highlight Pmenu      ctermbg=1 guibg=Red
" highlight PmenuSel   ctermbg=2 ctermfg=4 guibg=Green

" autocmd FileType c,cpp,java let &colorcolumn=join(range(&textwidth+1,999),",")
" set colorcolumn=+1
" To be able to use mouse cursor up to 222 column
"set ttymouse=urxvt
"set ttymouse=xterm2
"set ttymouse=screen-256colors
map! [7~ <Home>
map! [8~ <End>
map [7~ <Home>
map [8~ <End>
map [11~ <F1>
map [12~ <F2>
map [13~ <F3>
map [14~ <F4>
map [23~ <S-F1>
map [24~ <S-F2>
map [25~ <S-F3>
map [26~ <S-F4>
cmap <Esc>b <S-Left>
cmap <Esc>f <S-Right>
"cmap <C-Right> <S-Right>
"cmap <C-Left> <S-Left>

set foldmethod=syntax

nnoremap     <C-Z>   :shell<CR>
nnoremap     [c   :bn<cr>
nnoremap     [d   :bp<cr>
nnoremap     [a   :ls<cr>
inoremap     [c   <esc>:bn<cr>
inoremap     [d   <esc>:bp<cr>
inoremap     [a   <esc>:ls<cr>
"nnoremap     <C-N>   :bn<cr>
"nnoremap     <C-P>   :bp<cr>
"inoremap     <C-N>   <esc>:bn<cr>
"inoremap     <C-P>   <esc>:bp<cr>
"inoremap     <C-L>   <esc>:ls<cr>
noremap <C-Left> :bp<cr>
noremap Ob :ls<cr>
noremap Oa :b
"noremap Od :bp<cr>
" noremap [D :bp<cr>
noremap Oc :bn<cr>
" noremap [C :bn<cr>



set dictionary=~/.vim/dictionary
" syntax keyword  Moi michoux MichouX
" hi Moi term=reverse ctermbg=red ctermfg=blue guibg=red guifg=blue



" copie/collis
nnoremap <S-right> v<right>
inoremap <S-right> v<right>
vnoremap <S-right> <right>

nnoremap <S-left> v<left>
inoremap <S-left> v<left>
vnoremap <S-left> <left>

nnoremap <S-down> v<down>
inoremap <S-down> v<down>
vnoremap <S-down> <down>

nnoremap <S-up> v<up>
inoremap <S-up> v<up>
vnoremap <S-up> <up>

nnoremap <S-home> v<home>
inoremap <S-home> v<home>
vnoremap <S-home> <home>

nnoremap <S-end> v<end>
inoremap <S-end> v<end>
vnoremap <S-end> <end>

" Fabien Penso - Pour copier/coller du texte dans deux sessions vim
nnoremap    _Y      :.w! ~/.vi_tmp<CR>
vnoremap    _Y      :w! ~/.vi_tmp<CR>
nnoremap    _P      :r ~/.vi_tmp<CR>

if &encoding =~ "utf-8"
    inoreab bientot bientôt
    inoreab arrete arrête
    inoreab dasn dans
    inoreab dsna dans
    inoreab dnas dans
    inoreab ;à ;p
    inoreab ca ça
    inoreab apres après
    inoreab aprés après
    inoreab Etre Être
    inoreab meme même
    inoreab deja déjà
    inoreab decu deçu
    inoreab recu reçu
    inoreab etait était
    inoreab etais étais
    inoreab ecris écris
    inoreab paris Paris
    inoreab Sebastien Sébastien
    inoreab tlse Toulouse
    inoreab toulouse Toulouse
    inoreab facon façon
    inoreab fete fête
    inoreab helene Hélène
    inoreab ;H häagen-dazs
    inoreab urlfamille http://famille:famille@michoux.born2frag.org/famille/
    inoreab urlparis http://b2f:b2f@michoux.born2frag.org/paris/
    inoreab urlft http://ft:ft@michoux.born2frag.org/foyerft/
endif


command! -nargs=1 Silent
            \ | execute ':silent !'.<q-args>
            \ | execute ':redraw!'

"noremap  <C-]>
"cnoremap  <CR>
" :lolder to reopen old searches
map <F1> :execute "lvimgrep! /" . @/ . "/j %" <Bar>botright lw<CR>
map <S-F1> :execute "lvimgrep! /" . expand("<cword>") . "/j %" <Bar>botright lw<CR>
"can be done with: :g/mypattern/caddexpr expand("%") . ":" . line(".") .  ":" . getline(".")
" Search word on current buffer's directory
map <F2> :execute "lvimgrep! /" . @/ . "/j %:h/*"  <Bar>botright lw<cr>
map <S-F2> :execute "lvimgrep! /" . expand("<cword>") . "/j %:h/*"  <Bar>botright lw<cr>
" map <F3> :execute "silent lgrepadd! " . expand("<cword>") . " %:h/*" <Bar>:redraw! <Bar>botright lw<cr>
" Search word on current vim's directory and all subdirectories
map <F3> :execute "lvimgrep! /" . @/ . "/j **" <Bar>botright lw<CR>
map <S-F3> :execute "lvimgrep! /" . expand("<cword>") . "/j **" <Bar>botright lw<CR>
map <F4> :execute "lclose" <Bar> call setloclist(0,[])<CR>
noremap <F5> :e!<cr>
noremap <F6> :set list!<cr>:set list?<cr>
noremap <F7> :set foldenable!<cr>:set foldenable?<cr>
noremap <F8> :set hlsearch!<cr>:set hlsearch?<cr>
noremap <F9> :set paste!<cr>:set paste?<cr>
noremap [D :bp<cr>
noremap <C-Left> :bp<cr>
" noremap [D :bp<cr>
noremap [C :bn<cr>
noremap <C-Right> :bn<cr>
" noremap [C :bn<cr>
map <leader>a :call setloclist(0,[{'bufnr': bufnr(''), 'lnum': line('.'), 'text': getline('.')}], 'a')<cr>
map <leader>s :QuickfixsignsToggle<cr>

"set mouse=n
set mouse=
set expandtab
set tabstop=4
set shiftwidth=4
set cursorline
"set nofoldenable

vmap P "0p

" set foldmethod=marker
" set foldmarker={,}
" set foldminlines=5
""" Start -- colorscheme manxome amend
hi clear Folded
" highlight Folded ctermbg=0 ctermfg=7
hi Folded       ctermbg=232 cterm=bold ctermfg=5
hi FoldColumn   ctermbg=232 ctermfg=6
"highlight Folded ctermfg=darkblue
hi Search       ctermfg=0 ctermbg=11
hi MatchParen   ctermbg=14 ctermfg=2
hi Visual       ctermfg=11 ctermbg=4
hi DiffChange   term=reverse ctermbg=225 ctermfg=1 guibg=LightMagenta
hi DiffText     term=reverse ctermbg=9 ctermfg=5 gui=bold guibg=Red
hi DiffAdd      term=bold ctermbg=81 guibg=LightBlue ctermfg=2
hi Pmenu        ctermbg=225 guibg=LightMagenta ctermfg=2
hi PmenuSel     ctermbg=7 guibg=Grey ctermfg=1
hi PmenuSbar    ctermbg=248 guibg=Grey ctermfg=4
hi StatusLineNC ctermbg=0
" hi StatusLineNC ctermfg=8 ctermbg=0
hi StatusLine   ctermfg=15 ctermbg=5
hi DiffAdd      term=bold ctermfg=2 ctermbg=0
hi CursorLine   cterm=NONE ctermbg=0
highlight Search term=reverse cterm=bold ctermfg=61 ctermbg=0
highlight Cursor   guifg=red  guibg=black
highlight iCursor  guifg=white  guibg=steelblue
highlight ColorColumn ctermbg=0
" highlight Comment  term=bold ctermfg=cyan
" highlight Comment ctermfg=13
"let g:showmarks_textlower="\t>"
hi default ShowMarksHLl ctermfg=green ctermbg=blue cterm=bold guifg=blue guibg=lightblue gui=bold
hi default ShowMarksHLu ctermfg=green ctermbg=yellow cterm=bold guifg=blue guibg=lightblue gui=bold
hi default ShowMarksHLo ctermfg=green ctermbg=red cterm=bold guifg=blue guibg=lightblue gui=bold
hi default ShowMarksHLm ctermfg=green ctermbg=cyan cterm=bold guifg=blue guibg=lightblue gui=bold
" highlight WildMenu term=standout ctermbg=Black ctermfg=blue guibg=Yellow guifg=blue
""" End -- colorscheme manxome amend


" Extra whitespaces highlighting
" Highlight trailing whitespaces and spaces followed by tabs
highlight ExtraWhitespace ctermbg=darkred
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

"noremap H :e %
"noremap h :e <c-r>%<c-w>h<cr>
"noremap H :e <c-r>%<c-w>cpp<cr>

"function NewMyFoldText()
"    let previous_pos = line(".")
"    let line = getline(v:foldstart + 1)
"    let sub = substitute(line, '.*description=', '', 'g')
"    let linenum = 1
"    let tasknum = 0
"    "cursor(line)
""   while search('<task','b',1)
""       let tasknum = tasknum + 1
""   endwhile
""   cursor(previous_pos)
"    return v:folddashes . "<" . previous_pos . ">" . tasknum . " : " . sub
"endfunction

let g:CommandTMaxFiles=50000
" set wildignore+=cts,out

set nostartofline   " don't jump to first character when paging
nmap <C-N> nzb

" Expand tabs for java
autocmd FileType java setlocal expandtab

set laststatus=2

" set colorcolumn=80
cnoremap <C-a> <home>

"let g:pathogen_disabled="ShowMarks"
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'ShowMarks')
"execute pathogen#infect()
call pathogen#infect()
Helptags

runtime ftplugin/man.vim
noremap K :Man <cword><CR>

" call QuickfixsignsToggle()
let g:quickfixsigns_lists = {}
let g:editqf_no_type_mappings = 1

"call add(g:pathogen_disabled, 'vim-airline')
let g:airline_theme='luna' " good status color for separate hsplits
let g:airline_theme='light' " good status color for separate hsplits
let g:airline_theme='bubblegum' " too normal
let g:airline_theme='kolor' "sweet colors
let g:airline_theme='papercolor' " good but classic
let g:airline_powerline_fonts = 1

" I also like:
let g:airline_theme='hybridline'
"let g:airline_powerline_fonts = 0
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"let g:Powerline_symbols = 'fancy'
"let g:airline_symbols.space = "\ua0"
"set t_Co=256
"echo &t_Co
if has('cscope')
        if has('quickfix')
            set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
        endif
endif

autocmd FileType qf setlocal nowrap
autocmd BufReadPost * :QuickfixsignsDisable
let g:bookmark_save_per_working_dir = 1

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

let g:airline_theme = "oux"

""""""""""""""""""""""""""
" python

" PIP8:
au BufNewFile,BufRead *.py :
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=79 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix

let g:pymode_python = 'python3'
let g:pymode = 1
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
let g:pymode_options_max_line_length = 110
let g:pymode_syntax = 1
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CompleteDone * pclose
