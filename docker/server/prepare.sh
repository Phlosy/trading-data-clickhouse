#!/bin/bash

# 检查是否安装docker
if ! command -v docker &> /dev/null; then
    echo "错误: 未找到docker命令，请先安装docker"
    exit 1
fi

# 检查Dockerfile是否存在
if [ ! -f "Dockerfile" ]; then
    echo "错误: Dockerfile文件不存在"
    exit 1
fi

# 检查entrypoint.sh是否存在
if [ ! -f "entrypoint.sh" ]; then
    echo "错误: entrypoint.sh文件不存在"
    exit 1
fi

# 检查docker_related_config.xml是否存在
if [ ! -f "docker_related_config.xml" ]; then
    echo "错误: docker_related_config.xml文件不存在"
    exit 1
fi

# 拷贝../../table文件夹到当前文件夹
if [ -d "../../table" ]; then
    # 检查当前目录是否已存在table文件夹
    if [ -d "table" ]; then
        echo "警告: 当前目录已存在table文件夹，将删除现有文件夹"
        rm -rf table
    fi
    cp -r ../../table .
    echo "成功拷贝table文件夹到当前目录"
else
    echo "错误: ../../table文件夹不存在"
    exit 1
fi

echo "所有检查完成，文件准备就绪"



