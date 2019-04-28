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
set termencoding=utf-8
set cindent "开启c 缩进
set shiftwidth=4 "使用每层缩进的空格数
set expandtab "Python需要将tab转空格

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree' ", { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace' ", { 'for': 'clojure' }


" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'Valloric/YouCompleteMe'

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'ludovicchabant/vim-gutentags'

Plug 'Shougo/echodoc'

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


set cscopequickfix=s-,c-,d-,i-,t-,e-

set mouse=a
set tags+=~/projects/src/tags

nnoremap <silent> <F2> :A<CR>


" 设置powerline状态栏
" set nocompatible
" set t_Co=256
" set enc=utf-8
" let termencoding='utf-8'
" let g:Powerline_symbols = 'fancy'
" set guifont=Ubuntu\ Mono\ for\ Powerline\ 12
"

" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"let g:Lf_ShortcutF = '<c-p>'
"let g:Lf_ShortcutB = '<m-n>'
"noremap <c-n> :LeaderfMru<cr>
noremap <c-p> :LeaderfFunction<cr>
"noremap <m-n> :LeaderfBuffer<cr>
"noremap <m-m> :LeaderfTag<cr>

" ycm config
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
" set completeopt=menu,menuone
 
noremap <C-z> <NOP>
 
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }
let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ }
" highlight PMenu ctermfg=0 ctermbg=244 guifg=gray guibg=darkgrey
" highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=gray
