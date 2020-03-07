filetype on
filetype plugin on
syntax enable
set hlsearch
set helplang=cn
set nu
set backspace=indent,eol,start
set autoindent "自动缩进
set tabstop=2 "一个tab占2个空格
set softtabstop=2 "每次删除2空格
set fileencodings=utf-8,gb2312,gbk,gb18030,cp936,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set shiftwidth=4 "使用每层缩进的空格数
set expandtab "Python需要将tab转空格

" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree' ", { 'on':  'NERDTreeToggle' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20170907', 'rtp': 'vim' }

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" Initialize plugin system
call plug#end()


filetype plugin indent on    " required

" Ctrl+N 打开 /关闭
nnoremap <C-n> :NERDTreeToggle<CR>
" 当不带参数打开 Vim 时自动加载项目树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())| q | endif
" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
" 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1

set mouse=v
