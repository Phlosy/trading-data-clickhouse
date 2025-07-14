# 变量定义
IMAGE_NAME = trading-data-clickhouse
IMAGE_TAG = v1.0.1
CONTAINER_NAME = trading-data-clickhouse
HTTP_PORT = 8123
NATIVE_PORT = 9000
DATA_DIR = $(PWD)/data
LOGS_DIR = $(PWD)/logs

# Docker 相关命令
.PHONY: help docker-build docker-run docker-stop docker-logs docker-exec docker-restart

# 显示帮助信息
help:
	@echo "可用的 Makefile 命令:"
	@echo "  docker-build   - 构建 Docker 镜像"
	@echo "  docker-run     - 运行 Docker 容器"
	@echo "  docker-stop    - 停止并删除容器"
	@echo "  docker-logs    - 查看容器日志"
	@echo "  docker-exec    - 进入容器"
	@echo "  docker-restart - 重启容器"
	@echo "  help          - 显示此帮助信息"
	@echo ""
	@echo "当前配置:"
	@echo "  镜像名称: $(IMAGE_NAME)"
	@echo "  容器名称: $(CONTAINER_NAME)"
	@echo "  HTTP端口: $(HTTP_PORT)"
	@echo "  原生端口: $(NATIVE_PORT)"
	@echo "  数据目录: $(DATA_DIR)"
	@echo "  日志目录: $(LOGS_DIR)"

# 构建 Docker 镜像
docker-build:
	./prepare.sh
	sudo docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

# 运行 Docker 容器
docker-run:
	sudo docker run -d \
		--name $(CONTAINER_NAME) \
		-p $(HTTP_PORT):8123 \
		-p $(NATIVE_PORT):9000 \
		-v $(DATA_DIR):/var/lib/clickhouse \
		-v $(LOGS_DIR):/var/log/clickhouse-server \
		$(IMAGE_NAME):$(IMAGE_TAG)


# 停止并删除容器
docker-stop:
	sudo docker stop $(CONTAINER_NAME)
	sudo docker rm $(CONTAINER_NAME)

# 查看容器日志
docker-logs:
	sudo docker logs -f $(CONTAINER_NAME)

# 进入容器
docker-exec:
	sudo docker exec -it $(CONTAINER_NAME) /bin/bash

# 重启容器
docker-restart:
	sudo docker restart $(CONTAINER_NAME)

# 清理数据
clean-data:
	sudo rm -rf $(DATA_DIR)
	sudo rm -rf $(LOGS_DIR)



