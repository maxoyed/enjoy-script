# enjoy-script
Linux常用脚本合集

## server_init.sh
一键配置`Nginx + docker`服务器环境（目前支持Debian9 64位操作系统）

### Usage
```bash
curl -sSL https://raw.github.com/maxoyed/enjoy-script/master/server_init.sh | sh
```

## ssh_config.sh
ssh主机管理，提供增删(待开发)查改功能。

### 🚀![Download](https://raw.github.com/maxoyed/enjoy-script/master/ssh_config.sh)

### Usage
```bash
Usage:
  ssh-config [-a HOST_NAME] [-r HOST_NAME] [-l] [-e HOST_NAME]
Description:
    HOST_NAME, the lable of your ssh server.
    -a  Add a ssh server config.
    -r  Remove a ssh server config.
    -l  List ssh servers.
    -e  Edit a ssh server config.
    -h  Usage.
```
