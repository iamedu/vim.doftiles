set nocompatible " be iMproved
filetype off " required!

set shell=/bin/zsh
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" My Plugins here:
"
" Clojure
Plugin 'tpope/vim-fireplace'
" Plugin 'tpope/vim-classpath'
Plugin 'cemerick/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'derekwyatt/vim-scala'
Plugin 'scrooloose/nerdtree'
Plugin 'goldfeld/vim-seek'
Plugin 'terryma/vim-multiple-cursors'
" Plugin 'scrooloose/syntastic'
Plugin 'benmills/vimux'
Plugin 'hallison/vim-markdown'
Plugin 'tomtom/tcomment_vim'
Plugin 'lukerandall/haskellmode-vim'
" Snipmate Plugins
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" Plugin 'honza/vim-snippets'
" Plugin 'garbas/vim-snipmate'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
" Html
" Plugin 'hallettj/jslint.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mattn/emmet-vim'
Plugin 'closetag.vim'
Plugin 'editorconfig/editorconfig-vim'
" Prolog
Plugin 'msteinert/vim-prolog'
" Airline
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
" Unite
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
" vim-scripts repos
Plugin 'matchit.zip'
Plugin 'L9'
Plugin 'csv.vim'
" Lisp
Plugin 'iamedu/slimv'
" ...
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'sudo.vim'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()            " required

filetype plugin indent on " required!
"
" Brief help
" :PluginList - list configured bundles
" :PluginInstall(!) - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!) - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..

" My personal configuration
set number
set wildmenu

" Give a shortcut key to NERD Tree
map <F3> :NERDTreeToggle<CR>

" change the mapleader from \ to ,
let mapleader=","

let g:lisp_rainbow=1
let g:paredit_electric_return=1
let g:slimv_disable_clojure=1

"Tabs
set ai

"Search
set hlsearch

"Change options
set cpoptions+=ces$
" set virtualedit=block,insert

set nobackup
set noswapfile

set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
set laststatus=2
set vb

if &t_Co > 2 || has("gui_running")
" switch syntax highlighting on, when the terminal has colors
    syntax enable
    set background=dark
    colorscheme solarized
endif

set wildmode=full

set pastetoggle=<F2>

" Identation
set tabstop=4
set shiftwidth=4
set expandtab



" Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['yellow',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" Unite.vim
" Use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

let g:unite_source_history_yank_enable = 1

" " ctags
" nnoremap <leader>. :CtrlPTag<cr>
" nnoremap <silent> <Leader>b :TagbarToggle<CR>

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : '\<Space>'

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . '\<Left>'
"inoremap <expr><Right> neocomplete#close_popup() . '\<Right>'
"inoremap <expr><Up>    neocomplete#close_popup() . '\<Up>'
"inoremap <expr><Down>  neocomplete#close_popup() . '\<Down>'
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? '\<Down>' : '\<C-x>\<C-u>'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>
nnoremap <space>y :Unite history/yank<cr>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

autocmd FileType clojure nnoremap <C-e> :Eval<CR>
autocmd FileType clojure nnoremap E :%Eval<CR>

autocmd FileType cpp set tabstop=4|set shiftwidth=4
autocmd FileType xml set tabstop=4|set shiftwidth=4
autocmd FileType java set tabstop=4|set shiftwidth=4
autocmd FileType groovy set tabstop=2|set shiftwidth=2
autocmd FileType ruby set tabstop=2|set shiftwidth=2
autocmd FileType eruby set tabstop=2|set shiftwidth=2
autocmd FileType javascript set tabstop=2|set shiftwidth=2

au BufEnter *.edn set filetype=clojure
au BufEnter *.fleet set filetype=html

au Filetype html,xml,xsl,fleet source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

set wildignore+=*.class,.git,.hg,.svn,target/**,node_modules,**/components/**,target/*
