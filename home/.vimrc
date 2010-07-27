filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

colorscheme vividchalk

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:˽
nmap <leader>l :set list!<CR>

set ruler          " show the cursor position
set incsearch      " do incremental searching
set ignorecase     " ignore case while searching
set smartcase
"set nowrap         " turn off long line wrapping
set number         " show line number
setlocal numberwidth=5

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml,haml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType cpp  setlocal ts=4 sts=4 sw=4 noexpandtab

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
else
  set autoindent
endif " has("autocmd")

" If the terminal has colors, or in GUI mode
if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
  set hlsearch
endif
