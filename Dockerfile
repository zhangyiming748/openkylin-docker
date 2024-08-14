# 基于空镜像scratch
FROM scratch
LABEL maintainer="zen <zhangyiming748@gmail.com>"
LABEL version="1.0"
LABEL description="This is a custom image based on scratch"
# 添加rootfs文件到镜像中
ADD ./yangtze/yangtze-rootfs.tar.gz /
# 安装curl和vim
# RUN apt-get update && apt-get install -y curl vim git neofetch
# 创建一个用户
RUN adduser zen && echo "zen:123456" | chpasswd
# 用户加入到sudo
RUN adduser zen sudo
# 切换到用户目录
WORKDIR /home/zen
# 设置容器启动时的默认命令，并切换到xxx
USER zen
CMD ["/bin/bash"]

