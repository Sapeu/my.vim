" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tmm1/ripper-tags'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sbdchd/neoformat'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()

"主题颜色
colorscheme gruvbox
set background=dark "设置背景为暗色
let g:gruvbox_contrast_dark='hard'

"fzf主题颜色
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"显示顶部tab
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_theme='simple'

"设置格式化
"Enable alignment
let g:neoformat_basic_format_align = 1
"Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
"Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

set showcmd
"set clipboard=unnamed,unnamedplus      "可以从vim复制到剪贴板中
set cursorline          "显示当前行
set hlsearch            "显示高亮搜索
"set incsearch
set pastetoggle=F3      "F3快捷键于paste模式与否之间转化，防止自动缩进
set helplang=cn "帮助中文

filetype plugin on "高亮
syntax on "高亮

"设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 "Vim写入文件时采用的编码类型
set termencoding=utf-8 "输出到终端时采用的编码类型
set encoding=utf-8 "用于缓存的文本、寄存器、Vim 脚本文件等

"显示行号
"set number "nu为缩写
set relativenumber

"显示突出行
set cursorline "cul缩写

"启用鼠标
"set mouse=a
"set selection=exclusive
"set selectmode=mouse,key

"显示括号匹配
set showmatch

"设置缩进
set tabstop=2 "设置Tab长度为4空格
set shiftwidth=2 "设置自动缩进长度为4空格
set autoindent "继承前一行的缩进方式，适用于多行注释

"设置粘贴模式
"set paste

"显示空格和Tab键
"set listchars=tab:>-,trail:-

"显示状态栏和光标当前位置
set laststatus=2 "总是显示状态栏
set ruler "显示光标当前位置

"打开文件类型检测
filetype plugin indent on

"删除尾部空格
"autocmd BufWritePre * :%s/\s\+$//e

"让vimrc配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"自动打标签
autocmd BufWritePost *rb !ripper-tags -R&
