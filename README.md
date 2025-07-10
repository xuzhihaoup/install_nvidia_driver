# initialize_isaac_sim4.1.0
dockerfile文件用于构建镜像  
**镜像包环境配置信息：**
- Isaac Sim 版本：4.1.0  
- Python 版本：3.10  
- 系统版本：Ubuntu 22.04  
- Torch 版本：2.5.1  
- CUDA 版本：12.2  
## 使用方法
### 本地运行
chmod +x install_nvidia_driver.sh  
./install_nvidia_driver.sh
### 下载执行
wget -qO- https://raw.githubusercontent.com/xuzhihaoup/install_nvidia_driver/main/install_nvidia_driver.sh | bash   
wget -qO- https://raw.githubusercontent.com/xuzhihaoup/install_nvidia_driver/main/start_docker_run_display.sh | bash

