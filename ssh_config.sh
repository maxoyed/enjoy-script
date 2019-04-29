#!/bin/sh

# 使用帮助
usage() {
    echo "Usage:"
    echo "  ssh-config [-a HOST_NAME] [-r HOST_NAME] [-l] [-e HOST_NAME]"
    echo "Description:"
    echo "    HOST_NAME, the lable of your ssh server."
    echo "    -a  Add a ssh server config."
    echo "    -r  Remove a ssh server config."
    echo "    -l  List ssh servers."
    echo "    -e  Edit a ssh server config."
    echo "    -h  Usage."
    exit -1
}

# 必填参数
_is_empty(){
    if [ -z "$1" ]
    then
        echo "输入不能为空!"
        exit 1
    fi
}


# 增加主机配置
add_host(){
    line=`cat ~/.ssh/config | grep '^Host\>.*' | cut -f2 -d" "`;
    OLD_IFS="$IFS"
    IFS=" "
    hosts_list=($line)
    IFS="$OLD_IFS"
    for host in ${hosts_list[@]}
    do
        if [ $host == $OPTARG ]
        then
            echo "Host <$OPTARG> was already exist."
            exit
        fi
    done

    read -p "服务器域名/IP地址(必填): " HostName
    _is_empty "$HostName"
    read -p "端口(默认22): " Port
    Port=${Port:-"22"}
    read -p "用户名(默认为root): " User
    User=${User:-"root"}
    read -p "密钥文件路径(默认~/.ssh/id_rsa): " IdentityFile
    IdentityFile=${IdentityFile:-"~/.ssh/id_rsa"}

    echo "
Host $OPTARG
    HostName $HostName
    User $User
    Port $Port
    IdentityFile $IdentityFile" >> ~/.ssh/config
}

# 删除主机配置
remove_host(){
    # echo $OPTARG;
    # TODO 删除功能
    perl -i.bak -pe 's/Host.maxoyed[\w\W]*/test/g' ./config
}

# 查询主机列表
list_hosts(){
    cat ~/.ssh/config | grep '^Host\>.*' | cut -f2 -d" "
}

# 修改主机配置
edit_host(){
    vim ~/.ssh/config
}

while getopts 'a:r:e:lh' OPT; do
    case $OPT in
        a) add_host $OPTARG;;
        r) remove_host $OPTARG;;
        e) edit_host $OPTARG;;
        l) list_hosts;;
        h) usage;;
        ?) usage;;
    esac
done
