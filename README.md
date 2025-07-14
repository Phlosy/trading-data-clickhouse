# Trading Data Clickhouse

这是一个使用 ClickHouse 存储和管理交易数据的项目。

## 目录结构

```
.
├── backup              # 数据备份目录
├── bin                 # 可执行文件目录
├── config              # ClickHouse 配置文件目录
│   ├── config.xml         # 主配置文件
│   └── users.xml         # 用户配置文件
├── data                # ClickHouse 数据存储目录
│   ├── access             # 访问控制数据
│   ├── data              # 实际数据存储
│   ├── flags             # 系统标志
│   ├── format_schemas    # 数据格式模式
│   ├── metadata          # 元数据
│   ├── metadata_dropped  # 已删除的元数据
│   ├── preprocessed_configs  # 预处理配置
│   ├── status            # 系统状态
│   ├── store             # 数据存储
│   ├── tmp               # 临时文件
│   ├── user_files        # 用户文件
│   └── uuid              # UUID 存储
├── docker              # Docker 相关配置
│   └── server            # clickhouse-server镜像配置
├── docker-compose.yaml # Docker Compose 配置文件
├── logs                # 日志目录
│   ├── clickhouse-server.err.log  # 错误日志
│   └── clickhouse-server.log      # clickhouse-server日志
├── Makefile            # 项目管理脚本
└── table               # 表结构定义
    └── crypto            # 加密货币相关表结构

```

## 快速开始

### 环境要求
- Docker
- Docker Compose

### 安装步骤

1. 克隆项目
```bash
git clone [项目地址]
cd trading-data-clickhouse
```

2. 启动服务
```bash
make up
```

3. 停止服务
```bash
make down
```

## 配置说明

### 配置文件
- `config/config.xml`: ClickHouse 主配置文件
- `config/users.xml`: 用户权限配置文件

### 数据备份
备份文件存储在 `backup` 目录下，按时间戳命名

## 表结构

加密货币相关的表结构定义位于 `table/crypto` 目录下

## 日志

- 错误日志：`logs/clickhouse-server.err.log`
- 服务器日志：`logs/clickhouse-server.log`

## 维护命令

项目使用 Makefile 管理常用命令，具体命令请查看 `Makefile` 文件。

## 许可证

[待补充]

## 贡献指南

[待补充]

