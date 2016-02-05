set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""""""""""""""""
" Misc Fn defs "
""""""""""""""""
    func! DeleteTrailingWS()
        exe "normal mz"
        %s/\s\+$//ge
        exe "normal `z"
    endfunc

    func! SetTabWidth(width)
        exe 'set tabstop='    .a:width
        exe 'set shiftwidth=' .a:width
        exe 'set softtabstop='.a:width
    endfunc

" Plugins
    " Global
        Plugin 'gmarik/Vundle.vim'

    " Project
        Plugin 'kien/ctrlp.vim'
        Plugin 'tpope/vim-commentary'
        Plugin 'tpope/vim-fugitive'
        Plugin 'tpope/vim-git'
        Plugin 'scrooloose/syntastic'

    " Language
        " html/css/js
            Plugin 'elzr/vim-json'
            Plugin 'othree/html5.vim'
            Plugin 'pangloss/vim-javascript'
            Plugin 'rstacruz/sparkup'
        " python
            Plugin 'klen/python-mode'
        " markdown
            Plugin 'jtratner/vim-flavored-markdown'
            Plugin 'tpope/vim-markdown'
        " lisp
            Plugin 'kovisoft/slimv'

    " Graphics
        Plugin 'nanotech/jellybeans.vim'
        Plugin 'lyxell/pride.vim'
        Plugin 'itchyny/lightline.vim'

    " Edit
        Plugin 'kien/rainbow_parentheses.vim'
        Plugin 'Shougo/neocomplete.vim'
        Plugin 'vim-scripts/camelcasemotion'

    " Misc
        Plugin 'airblade/vim-gitgutter'                 " See git diff next to line number
        Plugin 'godlygeek/tabular'
        Plugin 'jceb/vim-orgmode'                       " Org Mode
        Plugin 'raimondi/delimitMate'                   " Auto-completion for quotes, parens, etc
        Plugin 'svermeulen/vim-easyclip'                " Simplified clipboard functionality
        Plugin 'tpope/vim-abolish'                      " Smart search & replace
        Plugin 'tpope/vim-repeat'                       " Repeat with a '.' [dot]
        Plugin 'tpope/vim-surround'
        Plugin 'tpope/vim-speeddating'

call vundle#end()

" Terminal
    set term=screen-256color
    set t_Co=256
    set ttyfast
    set shell=zsh                                       " Ever heard of ShellShock?

" Encoding
    set termencoding=utf-8                              " Too young to use ASCII
    set encoding=utf-8                                  " No seriously, way too young to use ASCII

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
    set cc=+1                                           " Mark no man's land

" Text settings
    call SetTabWidth(4)
    set textwidth=80                                    " Max text width
    set showcmd                                         " Display incomplete commands

" Search
    set nohlsearch                                      " Highlight searches
    set incsearch                                       " Do incremental searching
    set ignorecase                                      " Case-insensitive search
    set smartcase                                       " Smartly searches

" Notifications
    set report=0                                        " Tell me how many lines commands change
    set number                                          " Show line numbers
    set ruler                                           " Show the cursor position all the time
    set ls=2                                            " Always show status line

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
    set lazyredraw                                      " Don't redraw while executing macros
    set showmatch
    set magic
    set autoread                                        " Auto read when file is changed from outside
    set title

" (Hopefully) removes the delay when hitting esc in insert mode
    set noesckeys
    set ttimeout
    set ttimeoutlen=1

" Mapping

    " Fn Keys Mapping
        map <F5> :source $MYVIMRC<CR>
        map <F6> :PluginInstall<CR>

    " Git specific (requires vim-fugitive)
        map <leader>gs :Gstatus<CR>
        map <leader>gd :Gvdiff<CR>
        map <leader>gc :Gcommit<CR>
        map <leader>gl :Glog<CR>
        map <leader>gp :Git push<CR>

    " Custom Leaders
        map <leader>x :x<CR>
        map <leader>i gg=G''
        map <leader>v :tabe $MYVIMRC<CR>
        map <leader>w :w!<CR>
        map <leader>pp :setlocal paste!<CR>
        " vmap <leader>C  <esc>;'<,'>:w !xclip -selection clipboard -i<CR>


    " Ctrl Key Mapping
        map <c-S-a> ^
        map <c-S-e> $

" ColorSchemes
    set background=dark
    colorscheme jellybeans
    set cursorline
    hi CursorLine term=bold cterm=bold

    " let g:solarized_termcolors=256

" CtrlP settings
    let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|_site\|env\|bower_components'
    let g:ctrlp_switch_buffer = 0
    let g:ctrlp_working_path_mode = 0

" Python Mode
    let g:pymode_rope = 0
    let g:pymode_rope_complete_on_dot = 0
    let g:pymode_rope_lookup_project = 0
    let g:pymode_indent = 0

" Syntastic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

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
        autocmd BufWrite *.js,*.json :call SetTabWidth(2)

" User interface configuration "
""""""""""""""""""""""""""""""""
    set mouse=a            " I (sometimes) like using my mouse
    set noerrorbells       " Hate console beeps.
