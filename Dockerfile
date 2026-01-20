FROM node:18-slim

# 安装必要的系统依赖
RUN apt-get update && apt-get install -y \
    wget \
    && rm -rf /var/lib/apt/lists/*

# 创建应用目录
WORKDIR /app

# 设置工作目录权限
RUN chmod -R 777 /app

# 复制 package.json 和 package-lock.json（如果存在）
COPY package*.json ./

# 安装项目依赖
RUN npm install

# 复制应用程序代码
COPY . .

# 暴露应用端口
EXPOSE 5000

# 启动应用
CMD [ "node", "index.js" ]
