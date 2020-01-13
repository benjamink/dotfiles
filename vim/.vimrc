" Call Pathogen
call pathogen#infect()
call pathogen#helptags()

"####################################################################
"# General editor settings
"####################################################################

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

" Remember more commands and search history
set history=1000

" Make tab completion for files/buffers act like bash
set wildmenu

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

" Keep more context when scrolling off the end of a buffer
set scrolloff=3

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" show the cursor position all the time
set ruler

" Enable line numbers in the gutter
set number

" Set the gutter width
set numberwidth=5

" Always show tab bar
set showtabline=2

" Define status line layout
set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'
hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red

" display incomplete commands
set showcmd

" Make whitespace & tabs visible
set list listchars=tab:»·,trail:·

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  "set guifont=Andale\ Mono:h11
  set guifont=Inconsolata-dz:h11
  set noantialias
  set guicursor+=a:blinkon0
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " Remove remaining whitespace
  autocmd BufWritePre * :%s/\s\+$//e

  augroup END

  " Set Chef filetypes for vim-chef plugin
  "autocmd FileType ruby,eruby set filetype=ruby.eruby.chef

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Insert spaces when the tab key is pressed
set expandtab

" Set the number of spaces to insert for a tab
set tabstop=2

" Set the number of spaces used with re-indent operations
set shiftwidth=2

" Set the number of spaces to use when the tab key is pressed in insert mode
set softtabstop=2

" Automatically insert one extra level of indentation for new code
" blocks/conditionals
set smartindent

" Always show the status line
set laststatus=2

" Highlight matching braces & brackets
set showmatch

" Start searching as the search term is typed
set incsearch

" Disable Visual Bell
set visualbell t_vb=

" Wrap (visually) text cleanly at the window border (does not add line breaks
" into text.
set wrap

" Break lines at appropriate characters rather than mid-word
set linebreak

" Highlighting search
set hlsearch

" visual line length indicator
hi ColorColumn ctermbg=black

"match ErrorMsg '\%>80v.\+'
nnoremap <silent> <Leader>l
  \ :if exists('w:long_line_match') <Bar>
  \   silent! call matchdelete(w:long_line_match) <Bar>
  \   unlet w:long_line_match <Bar>
  \ elseif &textwidth > 0 <Bar>
  \   set colorcolumn=0 <Bar>
  \   let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1) <Bar>
  \ else <Bar>
  \   set colorcolumn=80 <Bar>
  \   let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1) <Bar>
  \ endif<CR>

if has("gui_running")
  " Set window size"
  set lines=60
  set columns=100
  set guifont=Andale\ Mono:h14

  " Highlight current line
  set cursorline
  hi CursorLine cterm=NONE ctermbg=black

  " Set color scheme
  "colorscheme bk_grb4
  colorscheme jellybeans

  " Hide the toolbar in the GUI
  set go-=T

  " Set the command bar height
  set cmdheight=2

  " Don't show scroll bars in the GUI
  set guioptions-=L
  set guioptions-=r

  " Use italics for comments
  highlight Comment cterm=italic

endif


"####################################################################
"# Folding Options
"####################################################################

" Space bar folds/unfolds current fold
nnoremap <space> zA
vnoremap <space> zf

" Short-cut to unfold all folds in the current window
map ,f zR

" Auto fold between markers
"set fmr={,}

" Folding method
set fdm=marker

"####################################################################
"# Powerline
"####################################################################

let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
let g:Powerline_mode_V="V·LINE"
let g:Powerline_mode_cv="V·BLOCK"
let g:Powerline_mode_S="S·LINE"
let g:Powerline_mode_cs="S·BLOCK"

"####################################################################
"# Syntastic
"####################################################################

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"####################################################################
"# Pymode
"####################################################################

"let g:pymode_rope_lookup_project = 0
let g:pymode_run = 1
let g:pymode_rope = 0
let g:pymode_folding = 0
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_slow_sync = 1
let g:pymode_trim_whitespace = 1
let g:pymode_lint = 1
let g:pymode_dco = 0

let g:pymode_lint_ignore="E501"

"####################################################################
"# vim-session
"####################################################################

:let g:session_autosave = 'no'

"####################################################################
"# Airline
"####################################################################

let g:airline_powerline_fonts = 1

"####################################################################
"# Load in additional vimrc files
"####################################################################
"
" source ~/.vim/custom/<vimrc>
