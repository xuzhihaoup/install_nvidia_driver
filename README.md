# initialize_isaac_sim4.1.0
[Isaac Sim 多无人机配置教程](https://github.com/xuzhihaoup/install_nvidia_driver/blob/main/__Isaacsim_%E5%A4%9A%E6%97%A0%E4%BA%BA%E6%9C%BA%E9%85%8D%E7%BD%AE%E6%95%99%E7%A8%8B__.md)
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
---------------------检查显卡驱动---------------------  
wget -qO- https://raw.githubusercontent.com/xuzhihaoup/install_nvidia_driver/main/install_nvidia_driver.sh  
chmod +x install_nvidia_driver.sh  
./install_nvidia_driver.sh  
---------------------创建容器---------------------  
wget https://raw.githubusercontent.com/xuzhihaoup/install_nvidia_driver/main/start_docker_run_display.sh  
chmod +x start_docker_run_display.sh  
./start_docker_run_display.sh  


