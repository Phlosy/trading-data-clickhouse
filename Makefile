.PHONY: help up stop down logs restart exec backup-data clean-data clean-backup-data

# 默认目标
help:
	@echo "可用的命令:"
	@echo "  make up      - 启动所有服务"
	@echo "  make down    - 停止并删除所有容器"
	@echo "  make stop    - 停止所有服务"
	@echo "  make logs    - 查看所有服务日志"
	@echo "  make restart - 重启所有服务"
	@echo "  make exec    - 进入容器"
	@echo "  make backup-data - 备份数据"
	@echo "  make clean-data - 清理数据"
	@echo "  make clean-backup-data - 清理备份数据"

# 启动服务
up:
	docker-compose up -d

# 停止服务
stop:
	docker-compose stop

# 停止并删除容器
down:
	docker-compose down -v

# 查看日志
logs:
	docker-compose logs -f

# 进入容器
exec:
	docker-compose exec trading-data-clickhouse /bin/bash

# 重启服务
restart: stop up

# 备份数据
backup-data:
	mkdir -p backup
	timestamp=$$(date +%Y%m%d-%H%M%S); \
	mkdir -p backup/$$timestamp; \
	mkdir -p backup/$$timestamp/data; \
	mkdir -p backup/$$timestamp/logs; \
	sudo cp -r data backup/$$timestamp/data; \
	sudo cp -r logs backup/$$timestamp/logs

# 清理数据
clean-data:
	sudo rm -rf data 
	sudo rm -rf logs

# 清理备份数据
clean-backup-data:
	sudo rm -rf backup
