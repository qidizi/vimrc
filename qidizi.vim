" 不兼容vi模式,使用vim自己的模式,功能更强大
set nocompatible
" 检测文件类型并加载相应的处理如高亮;根据文件类型的插件加载
filetype indent plugin on
" =============================
" 显示相关
" 语法高亮
set syntax=on
" 显示行号
set number
" 总是显示状态栏
set laststatus=2
" 设置命令输入栏的高度
set cmdheight=1
" 突出显示当前行
set cursorline 
" 设置自动换行
"set wrap
" 设置不自动换行,与上面不能同时设置
set nowrap
" 搜索高亮关键字
set hlsearch
" 输入搜索关键字时,实时匹配
set incsearch
" 所有模式都启用鼠标
set mouse="a"

" =============================
" 格式化相关
" tab使用4个空格
set tabstop=4
" 把tab输入解析成空格保存
set expandtab
" 删除时跟tab的行为相反
set softtabstop=4
" 自动换行时的自动缩进行为与tab一样
set shiftwidth=4
" 自动缩进
set autoindent 
" 调用这个键与平时用法相同
set backspace=indent,eol,start
" =============================
" 其它

" 编辑时,不自动生成备份文件
set nobackup 
"设置swap文件的目录,不保存在当前目录,它会优先使用第一个,如果后面加上//就会使用全路径做文件名;set noswapfile可以配置不生成,但是这样不安全
set dir=/tmp//,.  
" 不随着文件的打开改变pwd目录
set noautochdir
" -----------------------------------------------------------------------------
"  < 编码配置 >
"  -----------------------------------------------------------------------------
" 注：使用utf-8格式后，软件与程序源码、文件路径不能有中文，否则报错
"设置vim内部编码，默认不更改
set encoding=utf-8 
"设置当前文件编码，可以更改，如：gbk（同cp936）
"设置支持打开的文件的编码
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1  

" 加载插件管理脚本plug.vim
" 调用tmp/plug.vim;注意call语法不支持/,它总是从runtimepath来查找,如果有子目录,使用#号来标示
call plug#begin('/etc/vimrc.d/plugs')
"   " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"   Plug 'junegunn/vim-easy-align'
"
"   " Any valid git URL is allowed
"   Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
"   " Group dependencies, vim-snippets depends on ultisnips
"   Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
"   " On-demand loading
"   Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"   Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
"   " Using a non-master branch
"   Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
"   " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"   Plug 'fatih/vim-go', { 'tag': '*' }
"
"   " Plugin options
"   Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
"   " Plugin outside ~/.vim/plugged with post-update hook
"   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"
"   " Unmanaged plugin (manually installed and updated)
"   Plug '~/my-prototype-plugin'
"
"   " Add plugins to &runtimepath
"   call plug#end()
"
" Then reload .vimrc and :PlugInstall to install plugins.
"
" Plug options:
"
"| Option                  | Description                                      |
"| ----------------------- | ------------------------------------------------ |
"| `branch`/`tag`/`commit` | Branch/tag/commit of the repository to use       |
"| `rtp`                   | Subdirectory that contains Vim plugin            |
"| `dir`                   | Custom directory for the plugin                  |
"| `as`                    | Use different name for the plugin                |
"| `do`                    | Post-update hook (string or funcref)             |
"| `on`                    | On-demand loading: Commands or `<Plug>`-mappings |
"| `for`                   | On-demand loading: File types                    |
"| `frozen`                | Do not update unless explicitly specified        |
"
" More information: https://github.com/junegunn/vim-plug
"
"
" 在这里配置你需要的插件,配置例子见上面,或是直接打开插件编写作者的github页面查看;然后使用:so %指令重新加载vimrc;或是关闭再打开;再使用安装指令:PlugInstall
    Plug 'maksimr/vim-jsbeautify'
    " php的自动完成插件
    Plug 'shawncplus/phpcomplete.vim'
    " 支持php等多语言的调试插件; 用法  :help Vdebug
    Plug 'joonty/vdebug'
    " 标签 用法 :help taglist
    Plug 'vim-scripts/taglist.vim'



    " 下面都提到<leader>,它是前置键,可以通过:help <leader>查看您的前置键,一般是\;所以下面命令<leader>abc是在普通模式下按\abc来调用后面的funciton
    " 所有的文件都是根据类型来使用\btf来格式化
    " 美化javascript文件
    autocmd FileType javascript noremap <buffer>  <leader>btf :call JsBeautify()<cr>
    " 格式化 json
     autocmd FileType json noremap <buffer> <leader>btf :call JsonBeautify()<cr>
     " 格式化 html
     autocmd FileType html noremap <buffer> <leader>btf :call HtmlBeautify()<cr>
    " 格式化 css or scss
     autocmd FileType css noremap <buffer> <leader>btf :call CSSBeautify()<cr>
call plug#end()
" 插件管理脚本结束

