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



" 在/etc/vimrc文件,或是某些系统/etc/vim/vimrc中使用source引入本vim配置文件,比如 source 路径/vimrc.d/qidizi.vim
" 通用source指令加载的vim script,可以通过下面的命令得到这个脚本的路径;
let s:qidiziVimDir=expand('<sfile>:p:h')."/"
" 如果需要可以把本目录加入运行时查找目录;目前不清楚set怎么使用变量来拼接
" let &rtp=&rtp.",".s:qidiziVimDir

" 如果没有插件管理脚本,本脚本到此结束;插件管理脚本网址:https://github.com/junegunn/vim-plug
let plugsDir=s:qidiziVimDir . "plugs/"

if !isdirectory(plugsDir)
    " 如果插件缓存目录不存在,创建
    " 使用vimScript创建目录mkdir()
    if !mkdir(plugsDir)
        echo "无法创建用来安装插件的缓存目录:" .plugsDir
        finish
    endif
endif

let plugVim=plugsDir .'plug.vim'

if !filewritable(plugVim)
    if !executable('curl')
        " 如果没有系统的下载命令,需要提示用户自己手工下载
        echo "系统不支持curl命令,请手工下载插件管理脚本:https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 到 ".plugVim
        finish
    endif

    echo "正在下载插件管理脚本,请稍候..."
    silent let result=system('curl -v -fLo ' .plugVim. ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
 
    if v:shell_error 
        " 成功这个变量是0 
        echo "自动下载失败,请重启vim重试;或手工下载插件管理脚本:https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 到 ".plugVim
        finish
    endif

    echo "安装插件管理脚本成功!"
    echo "请使用:Plug*开头的命令来安装,使用插件管理"
endif
    
" 加载插件管理脚本plug.vim;这是source等关键字不支持变量的用法;
execute 'source ' .fnameescape(plugVim)

" 调用tmp/plug.vim;注意call语法不支持/,它总是从runtimepath来查找,如果有子目录,使用#号来标示
call plug#begin(plugsDir)
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
    " 启动vim时出现这个错误提示时: Taglist: Exuberant ctags (http://ctags.sf.net) not found in PATH. Plugin is not loaded.安装即可,如cetnos安装指令:yum install ctags-etags; ubuntu 安装 exuberant-ctags ;ubuntu python安装在/usr/bin/python,需要链接:ln -rs /usr/bin/python /bin/python;
    Plug 'vim-scripts/taglist.vim'
    " 只显示当前文件的tag
    let g:Tlist_Show_One_File=0
    " 按字母顺序排列tag而不是在代码中的出现的顺序
    let g:Tlist_Sort_Type="name"
    " 出现在右侧
    let g:Tlist_Use_Right_Window=1
    " 打开焦点移到在tag上
    let g:Tlist_GainFocus_On_ToggleOpen=0

    " vim目录树
    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
    " 配置目录树开关变量
    " 打开时开启
    let g:nerdtree_tabs_open_on_console_startup =1 

    " 加入html5支持
    Plug 'othree/html5.vim' 

    " js语法高亮
    Plug 'pangloss/vim-javascript'

    " 界面
    Plug 'vim-airline/vim-airline'

    " 自动完成
    Plug 'Valloric/YouCompleteMe'
    " 使用这个插件需要满足某些条件
    " 具体参考  http://vimawesome.com/plugin/youcompleteme
    " * 确认vim版本7.4.143+;查看方式,在vim命令中查看       :version
    " * 确认支持pyton与3;查看方式             :echo has('python') || has('python3')输出1
    " 如果需要c家族的自动完成还需要系统中安装动态库libclang;如centos执行
    " yum install -y clang
    " 需要编辑,要安装cmake;centos执行      yum install -y cmake
    " 先使用    :PlugInstall
    " plug没有完整的下载第三方插件代码,所以需要手工下载cd到/etc/vimrc.d/plugs/YouCompleteMe;执行
    " git submodule update --init --recursive
    " 才会下载完
    " 安装ycm,再cd到/etc/vimrc.d/plugs/YouCompleteMe下面
    " 创建一个编译目录 mkdir /etc/vimrc.d/tmp   并cd进入
    " 根据系统生成编译配置文件,在centos下是:         
    " cmake -G 'Unix Makefiles'  /etc/vimrc.d/plugs/YouCompleteMe/third_party/ycmd/cpp
    " 开始编译
    " cmake --build . --target ycm_core --config Release
    " 
    " 在fedora安装直接看http://vimawesome.com/plugin/youcompleteme中的教程即可

    " 加入通用语法检查插件
    Plug 'vim-syntastic/syntastic'
    " 配置语法检查
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 1
    let g:syntastic_aggregate_errors = 1

    " 下面都提到<leader>,它是前置键,可以通过:help <leader>查看您的前置键,一般是\;所以下面命令<leader>abc是在普通模式下按\abc来调用后面的funciton
    " 所有的文件都是根据类型来使用\btf来格式化
    " 美化javascript文件
    autocmd FileType javascript noremap <buffer>  <C-b> :call JsBeautify()<cr>
    " 格式化 json
     autocmd FileType json noremap <buffer> <C-b> :call JsonBeautify()<cr>
     " 格式化 html
     autocmd FileType html noremap <buffer> <C-b> :call HtmlBeautify()<cr>
    " 格式化 css or scss
     autocmd FileType css noremap <buffer> <C-b> :call CSSBeautify()<cr>
call plug#end()
" 插件管理脚本结束

" map
" php类型文件，使用php的插件格式化，注意它只会格式化php代码部分，并非所有混合html，js，css等
autocmd FileType php noremap <buffer> <C-b> :% ! php_beautifier <CR>

finish
