set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
    " Global
        Plugin 'gmarik/Vundle.vim'

    " Project
        Plugin 'scrooloose/nerdtree'
        Plugin 'kien/ctrlp.vim'
        Plugin 'tpope/vim-fugitive'
        Plugin 'grep.vim'
        Plugin 'tpope/vim-commentary'

    " Language
        " html/css/js
            Plugin 'othree/html5.vim'
            Plugin 'rstacruz/sparkup'
            Plugin 'pangloss/vim-javascript'
            Plugin 'elzr/vim-json'
        " python
            Plugin 'hynek/vim-python-pep8-indent'
            Plugin 'klen/python-mode'
        " clojure
            Plugin 'guns/vim-clojure-static'
            Plugin 'tpope/vim-fireplace'
        " erlang
            Plugin 'jimenezrick/vimerl'
        " markdown
            Plugin 'jtratner/vim-flavored-markdown'
            Plugin 'tpope/vim-markdown'

    " Graphics
        Plugin 'nanotech/jellybeans.vim'
        Plugin 'itchyny/lightline.vim'

    " Editor
        Plugin 'kien/rainbow_parentheses.vim'
        Plugin 'scrooloose/syntastic'

    " Misc
        Plugin 'mattn/gist-vim'
        Plugin 'godlygeek/tabular'
        Plugin 'airblade/vim-gitgutter'                 " See git diff next to line number
        Plugin 'SearchComplete'
        Plugin 'tpope/vim-repeat'                       " Repeat with a '.' [dot]
        Plugin 'osyo-manga/vim-anzu'                    " Search Status (1/17)
        Plugin 'Raimondi/delimitMate'                   " Auto-completion for quotes, parens, etc
        Plugin 'tpope/vim-abolish'                      " Smart search & replace
        Plugin 'Shougo/vimshell.vim'

call vundle#end()

" Terminal
    set term=xterm-256color
    set t_Co=256
    set ttyfast
    set shell=zsh                                       " Ever heard of ShellShock?

" Encoding
    set termencoding=utf-8
    set encoding=utf-8                                  " Too young to use ASCII

" Wild Menu
    set wildmode=list:longest,full
    set wildignore=*.o,*~,*.pyc
    set wildmenu

" Indentation
    filetype plugin indent on
    syntax on
    set autoindent
    set smartindent
    set expandtab                                       " Fuck tabs. Uses spaces
    set wrap                                            " I wrap my shit. You should too.
    set cc=+1                                           " Mark no man's land

" Text settings
    set textwidth=80                                    " Max text width
    set tabstop=4                                       " numbers of spaces of tab character
    set shiftwidth=4                                    " numbers of spaces to (auto)indent
    set softtabstop=4                                   " numbers of spaces to (auto)indent
    set showcmd                                         " display incomplete commands
    vnoremap <silent> * :call VisualSelection('f')<CR>
    vnoremap <silent> # :call VisualSelection('b')<CR>

" Search
    set nohlsearch                                      " highlight searches
    set incsearch                                       " do incremental searching
    set ignorecase                                      " Case-insensitive search
    set smartcase                                       " Smartly searches

" Notifications
    set report=0                                        " Tell me how many lines commands change
    set number                                          " show line numbers
    set ruler                                           " show the cursor position all the time
    set ls=2                                            " always show status line

" Folds
    set foldenable                                      " Folding FTW.
    set foldmethod=indent                               " My files are always neatly indented
    set foldlevel=100                                   " Don't autofold

" Backup files - Nah!
    set nobackup                                        " Do not keep backup files
    set noswapfile                                      " Do not write annoying swap files
    set nowb

" Misc Behaviour
    set backspace=eol,start,indent
    set lazyredraw
    set showmatch
    set magic
    set autoread                                        " Auto read when file is changed from outside

" (Hopefully) removes the delay when hitting esc in insert mode
    set noesckeys
    set ttimeout
    set ttimeoutlen=1

" Mapping

    " Fn Keys Mapping
        map <F2> :NERDTreeToggle<CR>
        map <F3> :RainbowParenthesesToggle<CR>

    " Git specific (requires vim-fugitive)
        map <leader>gs :Gstatus<CR>
        map <leader>gd :Gdiff<CR>
        map <leader>gc :Gcommit<CR>
        map <leader>gl :Glog<CR>
        map <leader>gp :Git push<CR>

    " Custom Leaders
        map <leader>x :x<CR>
        map <leader>i gg=G''
        map <leader>v :tabe $MYVIMRC<CR>
        map <leader>V :so $MYVIMRC<CR>
        map <leader>w :w!<CR>
        map <leader>pp :setlocal paste!<CR>
        " vmap <leader>C  <esc>;'<,'>:w !xclip -selection clipboard -i<CR>


    " Ctrl Key Mapping
        map <c-S-a> ^
        map <c-S-e> %

" ColorSchemes
    colorscheme jellybeans
    set cursorline
    hi CursorLine term=bold cterm=bold

" CtrlP settings
    let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|_site\|env\|bower_components'
    let g:ctrlp_switch_buffer = 0
    let g:ctrlp_working_path_mode = 0

" Python Mode
    let g:pymode_rope = 1
    let g:pymode_rope_complete_on_dot = 0
    let g:pymode_rope_lookup_project = 1
    let g:pymode_indent = 1

" Autocmds
    " Filetypes
        autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
        autocmd BufNewFile,BufRead .jshintrc,.bowerrc setlocal filetype=json

    " Git
        autocmd Filetype gitcommit setlocal spell textwidth=72

    " Rainbow Parentheses
        autocmd VimEnter * RainbowParenthesesToggle
        autocmd Syntax * RainbowParenthesesLoadRound
        autocmd Syntax * RainbowParenthesesLoadSquare
        autocmd Syntax * RainbowParenthesesLoadBraces

    " Misc
        autocmd BufWrite !*.md :call DeleteTrailingWS()
        autocmd! BufNewFile,BufRead *.raml set filetype=yaml foldmethod=indent

""""""""""""""""
" Misc Fn defs "
""""""""""""""""
    func! DeleteTrailingWS()
        exe "normal mz"
        %s/\s\+$//ge
        exe "normal `z"
    endfunc

""""""""""""""""""""""""""""""""
" User interface configuration "
""""""""""""""""""""""""""""""""
    set mouse=a            " I (sometimes) like using my mouse
    set noerrorbells       " Hate console beeps.
