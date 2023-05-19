#!/bin/bash

# 檢測是否為root權限
if [[ $EUID -ne 0 ]]; then
    echo "請以root權限運行此脚本"
    exit 1
fi

# 檢測所屬系統
if [ -f /etc/debian_version ]; then
    # Debian系統
    debian_version=$(cat /etc/debian_version | cut -d'.' -f1)
    if [ $debian_version -lt 8 ]; then
        echo "脚本不支援Debian 8以下版本"
        exit 1
    fi
    apt-get update -y
    apt-get install wget python -y
elif [ -f /etc/centos-release ]; then
    # CentOS系統
    centos_version=$(cat /etc/centos-release | cut -d' ' -f4 | cut -d'.' -f1)
    if [ $centos_version -lt 7 ]; then
        echo "脚本不支援CentOS 7以下版本"
        exit 1
    fi
    yum update -y
    yum install wget python -y
else
    # 不支援其他系統
    echo "脚本不支援此系統"
    exit 1
fi

# 安裝speedtest
wget -O speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
chmod +x speedtest-cli
echo "speedtest安裝完成"

# 循環運行speedtest
while true; do
    ./speedtest-cli
    sleep 60
done
