#!/bin/bash

systemVimrcPath="/etc/vimrc";
shRoot="/qidizi/vimrc.d/";
autoloadPath="${shRoot}autoload";

if [[ ! -d "${autoloadPath}" ]];then
	echo "自动加载目录不存在,创建:${autoloadPath}";
	mkdir $autoloadPath;
	
	if [[ "${?}" -ne "0" ]];then
		echo "创建目录失败:${autoloadPath}";
		exit ${?};
	fi
fi
 
cd ${autoloadPath};
echo "当前目录:$(pwd)";
echo "开始下载插件管理脚本plug.vim到tmp目录";

if [[ -f "./plug.vim" ]];then
	echo "发现plug.vim已经存在,删除并重新下载...";
	unlink ./plug.vim;
	
	if [[ "${?}" -ne "0" ]];then
		echo "删除失败";
		exit ${?};
	fi
	
	echo "删除成功";
fi
	
wget  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;

if [[ "${?}" -ne "0" ]];then
	echo "插件下载失败";
	exit ${?};
fi

cd ../;
echo "当前目录:$(pwd)";

echo "确保您已经手工备份了vim系统级的配置文件${systemVimrcPath},下面将开始使用$(pwd)/vimrc替换${systemVimrcPath},确认继续请输入yes回车,其它输入终止:";
read y;

if [[ "${y}" -ne "yes" ]];then
	echo "您选择终止执行";
	exit 0;
fi

echo "开始使用$(pwd)/vimrc替换${systemVimrcPath}...";
cp -f ./vimrc ${systemVimrcPath};

if [[ "${?}" -ne "0" ]];then
	echo "替换失败";
	exit ${?};
fi


echo "操作完成";
exit 0;
