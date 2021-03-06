"autocmd BufEnter * :lcd %:p:h

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

if has("autocmd")
    filetype plugin on
    filetype indent on

    autocmd FileType python set omnifunc=pythoncomplete#Complete
    " Some additions from http://wiki.python.org/moin/Vim
    autocmd BufRead,BufNewFile *.py syntax on
    autocmd BufRead,BufNewFile *.py set ai
    autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class
    inoremap <Nul> <C-x><C-o>
    set tags+=~/.vim/tags/python26.ctags
    set tags+=~/.vim/tags/perl5.ctags
    let g:ctags_statusline=1

endif

python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

" Make UTF-8
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Try and enable color for xterms
if &term =~ 'xterm'
    if has("terminfo")
        set t_Co=8
        set t_Sf=[3%p1%dm
        set t_Sb=[4%p1%dm
    else
        set t_Co=8
        set t_Sf=[3%dm
        set t_Sb=[4%dm
    endif
endif

if &term =~ '-256color'
	if has("terminfo")
		set t_Co=256
        set t_Sf=[3%p1%dm
        set t_Sb=[4%p1%dm
	else
		set t_Co=256
        set t_Sf=[3%dm
        set t_Sb=[4%dm
	endif
endif

" Switch syntax highlighting on
syntax enable
set hlsearch
set modeline

" Display bufnr:filetype (dos,unix,mac) in status line
set statusline=%<%n:%f%h%m%r%=%{&ff}\ %l,%c%V\ %P

" === VERSION 5.00 AND UP SETTINGS ===
" Only do this for Vim version 5.0 and later.
if version >= 500

    set notitle
    
    set bs=2		        " allow backspacing over everything in insert mode
    set ai			        " always set autoindenting on
    set et					" Use spaces instead of tab when <TAB> is pressed
    set sta					" Split the window for the found tag
    set sts=4				" Split the window for the selected tag
    set ts=8				" List the tags that match using info. in the tag file(s)
    "set tw=78				" Auto wrap text at 78 chars
    set nobackup	        " don't keep a backup file
    "set viminfo='20,\"50	" read/write a .viminfo file, don't store more
    			            " than 50 lines of registers
    set history=50		    " keep 50 lines of command line history
    set ruler		        " show the cursor position all the time
    "set nowrap              " make sure that long lines don't wrap
    set wrap
    set background=dark     " Make sure we have a nice dark background
    set laststatus=2        " Make sure the status line is always displayed

    " Hide the mouse pointer while typing
    " The window with the mouse pointer does not automatically become the active window
    " Right mouse button extends selections
    " Turn on mouse support
    set mousehide
    set nomousefocus
    set mousemodel=extend
    set mouse=a

    " Show paren matches
    " For 5 tenths of a second
    set showmatch
    set matchtime=5

    " Setup tabs for 4 spaces
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4

    " Nice default colorscheme
    colorscheme blackboard

    " Working on building nice development environment
    "map <Leader>v :vsplit<CR>:vertical resize 20<CR>:Explore<CR><C-W>l<C-W>sz1<CR><C-W>j<C-W>h

    runtime macros/matchit.vim

endif

" Map H to stop highlighting search matches
noremap H :set hlsearch!<CR>

" Make shift-insert work like in Xterm
noremap <S-Insert> <MiddleMouse>
noremap! <S-Insert> <MiddleMouse>

set number
set numberwidth=4
map <F4> :set number! <cr>

" Taken from http://vimcasts.org/episodes/indentation-commands/
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Change date/time format for vim's bash-support plugin
let g:BASH_FormatDate = '%F'
let g:BASH_FormatTime = '%T %z'
let g:BASH_FormatYear = '%Y'
