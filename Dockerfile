# 使用 NVIDIA 官方 CUDA + Ubuntu 镜像（支持 PyTorch/Isaac）
FROM nvidia/cuda:12.2.2-cudnn8-devel-ubuntu22.04
#
# 设置非交互安装环境变量
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

# 使用清华源替换 Ubuntu 默认 apt 源
RUN sed -i 's|http://.*.ubuntu.com|https://mirrors.tuna.tsinghua.edu.cn|g' /etc/apt/sources.list && \
    apt-get update && apt-get install -y \
    wget curl git bzip2 sudo nano vim \
    build-essential cmake \
    libglib2.0-0 libx11-6 libxi6 libsm6 libxrender1 libgl1 \
    && rm -rf /var/lib/apt/lists/*

# 创建非 root 用户
RUN useradd -ms /bin/bash dockeruser && echo "dockeruser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER dockeruser
WORKDIR /home/dockeruser

# 安装 Miniconda（国内源一般不提供下载，仍从官网）
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && \
    bash miniconda.sh -b -p /home/dockeruser/miniconda && \
    rm miniconda.sh

# 设置环境变量
ENV PATH="/home/dockeruser/miniconda/bin:$PATH"

# 更换 conda 默认源为清华镜像
RUN conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main && \
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free && \
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge && \
    conda config --set show_channel_urls yes

# 初始化 conda + 创建 Python 3.10 环境
RUN conda init bash && \
    conda create -y -n isaacsim python=3.10 && \
    echo "conda activate isaacsim" >> ~/.bashrc

# 设置 pip 使用清华源，加速 PyPI 包下载
RUN mkdir -p ~/.pip && echo "[global]\nindex-url = https://pypi.tuna.tsinghua.edu.cn/simple" > ~/.pip/pip.conf

# 激活环境并安装 PyTorch + Isaac Sim（注意 IsaacSim 要用 NVIDIA 私有源）
# SHELL 指定为 bash
SHELL ["/bin/bash", "-c"]

# 正确初始化 Conda 并用 conda run 安装
# 创建环境
RUN conda create -y -n isaacsim python=3.10

# 安装 pip
RUN conda install -n isaacsim pip

# pip 升级
RUN conda run -n isaacsim pip install --upgrade pip

# 安装 torch
RUN conda run -n isaacsim pip install torch==2.5.1 torchvision==0.20.1 --index-url https://download.pytorch.org/whl/cu121

# 安装 isaacsim
RUN conda run -n isaacsim pip install 'isaacsim[all,extscache]==4.1.0' \
  --extra-index-url https://pypi.nvidia.com \
  --index-url https://pypi.org/simple \
  --timeout 1000 \
  --no-cache-dir

# 克隆 IsaacLab 并安装
# Dockerfile 里只克隆代码，不执行 install
RUN git clone https://github.com/isaac-sim/IsaacLab.git

WORKDIR /home/dockeruser/IsaacLab
CMD ["/bin/bash"]
