# vimrc
我的vimrc配置

使用方法

1. 备份vim的系统级配置文件/etc/vimrc,并删除里面的内容只添加如下指令

```vim
" 给运行时路径添加一个新路径,用来加载qidizi的/etc/vimrc.d中配置;可以在vim界面中运行:help rtp查看此指令用法
set rtp+=/etc/vimrc.d/vimrc
```

1. 创建目录/etc/vimrc.d/,并cd进入此目录
1. 使用git把github中文件克隆下来: git clone git@github.com:qidizi/vimrc.git ./
1. 开始使用vim
