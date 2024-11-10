#!/bin/bash

# 备份原有的 CentOS 8 源
cp /etc/yum.repos.d/CentOS-*.repo /etc/yum.repos.d/backup/

# 创建阿里云源配置
cat <<EOL > /etc/yum.repos.d/CentOS-Base.repo
[base]
name=CentOS-\$releasever - Base
baseurl=http://mirrors.aliyun.com/centos/\$releasever/os/\$basearch/
gpgcheck=1
gpgkey=http://mirrors.aliyun.com/centos/RPM-GPG-KEY-centos7

[updates]
name=CentOS-\$releasever - Updates
baseurl=http://mirrors.aliyun.com/centos/\$releasever/updates/\$basearch/
gpgcheck=1
gpgkey=http://mirrors.aliyun.com/centos/RPM-GPG-KEY-centos7

[extras]
name=CentOS-\$releasever - Extras
baseurl=http://mirrors.aliyun.com/centos/\$releasever/extras/\$basearch/
gpgcheck=1
gpgkey=http://mirrors.aliyun.com/centos/RPM-GPG-KEY-centos7

[centosplus]
name=CentOS-\$releasever - Plus
baseurl=http://mirrors.aliyun.com/centos/\$releasever/centosplus/\$basearch/
gpgcheck=1
gpgkey=http://mirrors.aliyun.com/centos/RPM-GPG-KEY-centos7
EOL

# 清理缓存并更新
dnf clean all
dnf makecache

echo "CentOS 8 的软件源已成功更改为阿里云源！"
