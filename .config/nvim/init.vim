if &compatible
  set nocompatible
endif

" <Leader> = <Space>
let mapleader = "\<Space>"
let g:outher_package_path = '~/.config/nvim/other_tools'

let s:dein_cache_path = expand('~/.cache/nvim/dein')
let s:dein_dir = s:dein_cache_path
                 \ .'/repos/github.com/Shougo/dein.vim'

" Load dein.
if &runtimepath !~ '/dein.vim'
  if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
  endif
  execute 'set runtimepath+=' . fnamemodify(s:dein_dir, ':p')
endif

if dein#load_state(s:dein_cache_path)
  call dein#begin(s:dein_cache_path)

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy' : 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy' : 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

set termguicolors
filetype plugin indent on
syntax enable
" colorscheme solarized8_dark_flat
colorscheme tender
set fileformats=unix,mac,dos

" Messages in English
language C

set smarttab
"insert space when entered tab
set expandtab
"enable to move to the space where no characters
set virtualedit=block
set tabstop=4
set shiftwidth=4

set list
set listchars=tab:>-,trail:~
set number
set cursorline
set smartindent
" 括弧入力時の対応する括弧を表示"
set showmatch

" lightlineで設定を行うのでコメントアウト
" ファイル名表示
"set statusline=%F
"" これ以降は右寄せ表示
"set statusline+=%=
"" file encoding
"set statusline+=[enc=%{&fileencoding}]
"" 現在行数/全行数
"set statusline+=[row=%l/%L]
"" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
"set laststatus=2

" swap colon and semicolon
nnoremap ; :
nnoremap : ;

"タイトル表示"
set title

set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set incsearch
set wrapscan "検索時に最後まで行ったら最初に戻る

" integrate yank and clipboard
set clipboard+=unnamedplus
" enable backspace for indent eol and start
set backspace=indent,eol,start

" bash like filename complete
set wildmenu
" set wildmode=list:full
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll

let g:python_highlight_all = 1
let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'
let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'

" 補完時にpreviewを表示しない
"set completeopt=menuone

" terminal settings
set sh=bash
nnoremap tig :terminal tig<cr>

" tab switch key mapping
nnoremap <C-L> gt
nnoremap <C-H> gT

" ctags settings
" propose other tags
nnoremap <C-]> g<C-]>

" Buffer moving shortcut
nnoremap <Leader>p :bprevious<CR>
nnoremap <Leader>n :bnext<CR>

" markdownの折りたたみなし
let g:vim_markdown_folding_disabled=0


" fro webpack build
set backupcopy=yes