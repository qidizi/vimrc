" ==============================================================
" vim  插件管理 Vundle 配置内容
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" 在这里放要让vundle管理的插件
Plugin 'gmarik/Vundle.vim'
Plugin 'jsbeautify'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" EOF
" 快捷键之类

" 格式化js快捷键
nnoremap <silent> <leader>fmjs :call g:Jsbeautify()<cr>
" =============================
" 显示相关

set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示
set syntax=on " 语法高亮
set number " 显示行号
set laststatus=2                                      "总是启用状态栏信息
set cmdheight=1                                       "设置命令行的高度为2，默认为1
set cursorline                                        "突出显示当前行
set wrap                                            "设置自动换行,不自动换行是nowrap
set shortmess=atI                                     "去掉欢迎界面
set hlsearch        "高亮搜索
set incsearch       "在输入要搜索的文字时，实时匹配
set mouse="a"                    " 启用鼠标

" =============================
" 格式化相关

set tabstop=4 " tab使用4个空格
set expandtab " 把tab输入解析成空格保存
set softtabstop=4 " 删除时跟tab的行为相反
set shiftwidth=4 " 自动换行时的自动缩进行为与tab一样
set autoindent " 自动缩进

" =============================
" 其它

set nobackup " 不生成备份文件
set dir=/tmp//,.  "设置swap文件的目录,不保存在当前目录,它会优先使用第一个,如果后面加上//就会使用全路径做文件名
"set autochdir=off " 不随着文的打开改变pwd目录
" -----------------------------------------------------------------------------
"  < 编码配置 >
"  -----------------------------------------------------------------------------
" 注：使用utf-8格式后，软件与程序源码、文件路径不能有中文，否则报错
set encoding=utf-8 "设置gvim内部编码，默认不更改
set fileencoding=utf-8 "设置当前文件编码，可以更改，如：gbk（同cp936）
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1  "设置支持打开的文件的编码
