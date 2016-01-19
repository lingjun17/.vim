filetype on
filetype plugin on
syntax enable
set hlsearch
set helplang=cn
set nu
set backspace=indent,eol,start
set autoindent "自动缩进
set tabstop=4 "一个tab占4个空格
set softtabstop=4 "每次删除4个空格
set fileencodings=utf-8,gb2312,gbk,gb18030,cp936,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8,gbk,gb2312
set cindent "开启c 缩进
set shiftwidth=4 "使用每层缩进的空格数
set expandtab "Python需要将tab转空格
set makeprg=cd\ build\ \&\&\cmake\ ..\ \&\&\ make
" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'"目录树插件
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim' "全局搜索插件
Plugin 'Raimondi/delimitMate'  "自动缩进插件
Plugin 'mitsuhiko/vim-python-combined' 
Plugin 'Lokaltog/vim-powerline.git'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/a.vim'
" plugin from http://vim-scripts.org/vim/scripts.html
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" All of your Plugins must be added before the following line
call vundle#end()            " required
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


"  全局搜索配置
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip     
let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$'}

set cscopequickfix=s-,c-,d-,i-,t-,e-

set mouse=a
set tags+=~/projects/src/tags

nnoremap <silent> <F2> :A<CR>


" 设置powerline状态栏
set nocompatible
set t_Co=256
set enc=utf-8
let termencoding='utf-8'
let g:Powerline_symbols = 'fancy'
set guifont=Ubuntu\ Mono\ for\ Powerline\ 12


"YCM CONFIG
set completeopt=longest,menu   
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif 
"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    
"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" :
"\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" 跳转到定义处
nnoremap <F4>  g:YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR> :YcmDiags<CR> 


inoremap <leader>; <C-x><C-o>

"force recomile with syntastic
" " nnoremap <leader>lo :lopen<CR>  "open locationlist
" " nnoremap <leader>lc :lclose<CR> "close locationlist
" inoremap <leader><leader> <C-x><C-o>
"
let g:ycm_global_ycm_extra_conf = '~/projects/.ycm_extra_conf.py'
" " 不显示开启vim时检查ycm_extra_conf文件的信息  
let g:ycm_confirm_extra_conf=0
" " 开启基于tag的补全，可以在这之后添加需要的标签路径  
let g:ycm_collect_identifiers_from_tags_files=0
" "注释和字符串中的文字也会被收入补全
" let g:ycm_collect_identifiers_from_comments_and_strings = 0
" " 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" " 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1  
" "在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" "在字符串输入中也能补全
let g:ycm_complete_in_strings = 1

let g:ycm_error_symbol='E'
" 警告标识
let g:ycm_warning_symbol='W'

let g:ycm_key_invoke_completion = '<F3>'
