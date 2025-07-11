# **Isaacsim_多无人机配置教程**

## **常用文档链接**
**OmniDrones 0.1.1 documentation**  
https://omnidrones.readthedocs.io/en/latest/installation.html  
**Isaac Sim Documentation**  
https://docs.isaacsim.omniverse.nvidia.com/4.2.0/installation/install_cloud.html  
**Isaac Sim Documentation-国内翻译中文版**  
https://docs.robotsfan.com/isaaclab/source/setup/installation/pip_installation.html  
**Isaac Lab Documentation**  
https://isaac-sim.github.io/IsaacLab/main/source/setup/installation/pip_installation.html  
**OmniDrones Github**  
https://github.com/btx0424/OmniDrones  
**Dockerfile原始文件**  
https://github.com/xuzhihaoup/install_nvidia_driver/blob/main/Dockerfile  
**显卡驱动查询**   
https://www.nvidia.cn/geforce/drivers/  
**CUDA-toolkit工具链**  
https://developer.nvidia.com/cuda-toolkit-archive  
## **常用命令**
./clash -d . &====打开代理
pkill clash   ====关闭代理
docker ps -a  ====查看容器列表
docker rm isaac_sim_container  ====删除容器
## **配置要求**
 - **Ubuntu**: 20.04/22.04
 - **宿主机**：Ubuntu20.04
 - **Isaac Sim**: 4.1.0
 - **Isaac Lab**: 1.** * **
 - **python**: 3.10
 - **pytorch**: 2.2.2+cu118
 - **rl**: 0.3.1
##**实验环境**
 - Ubuntu 20.040.6 LTS
推荐配置网络代理-clash
## **系统环境搭建**
nvidia-smi查看显卡信息--ubuntu-drivers devices看是否为recommended版本--不是请卸载安装 方式2重新安装
recommended版本太新不建议使用经实验4090在575驱动CUDA12.8下不能调用Vulkan接口最后更换550CUDA12.4(宿主机)
**方式1**

    ubuntu-drivers devices安装系统推荐驱动有recommended
    sudo apt install [xx]

**方式2 推荐**

    sudo ubuntu-drivers install自动安装推荐版本

**安装太慢推荐阿里云**
完成后重启系统`sudo reboot`
## **Step1：下载Docker镜像**
远程设备Todesk密码：Xzh123456++
登录密码：QMh4Ceg4--syjs123456
先从阿里云拉去docker镜像
**镜像包环境配置信息：**
Isaac Sim 版本：4.1.0
Python 版本：3.10
系统版本：Ubuntu 22.04(pip安装isaacsim仅支持22.04)
Torch 版本：2.5.1
CUDA 版本：12.2
测试显卡驱动：

    python -c "import torch; print(torch.cuda.is_available()); print(torch.cuda.get_device_name(0))"

**登录指令**：`docker login --username=xuzhihao2000 crpi-p4y4hs8uwp1hkhn1.cn-shanghai.personal.cr.aliyuncs.com`
**登录密码**：`xzh123456---syjs123456`（优先输入这个，前面是账号登录密码后面是仓库访问密码）
**pull指令**：`docker pull crpi-p4y4hs8uwp1hkhn1.cn-shanghai.personal.cr.aliyuncs.com/isaac_sim/isaac_sim_syjs:isaacsim_4.1.0_py310_ubuntu22.04_torch2.5.1_cuda122`
----------如果提示权限不够，请将终端切换至root用户(`su root`)，或者将当前用户加入docker组(推荐去root)
**运行镜像**
---------------------创建容器---------------------
### 指令执行-----非root用户

    docker run -it --gpus all --name isaac_sim_container -v $(pwd):/workspace crpi-p4y4hs8uwp1hkhn1.cn-shanghai.personal.cr.aliyuncs.com/isaac_sim/isaac_sim_syjs:isaacsim_4.1.0_py310_ubuntu22.04_torch2.5.1_cuda122 bash

### 脚本执行-----root用户

    wget https://raw.githubusercontent.com/xuzhihaoup/install_nvidia_driver/main/start_docker_run_display.sh
    chmod +x start_docker_run_display.sh
    ./start_docker_run_display.sh

进入后测试是否能显示图像
xclock

    sudo apt update
    sudo apt install -y x11-apps

进入conda base空间

    conda init 
    source ~/.bashrc

**离开镜像**

ctrl+p->ctrl+q or exit

**再次进入**

    docker start -ai isaac_sim_container

## **Step2: run isaacsim**
root 用户进入需要设置：

---------------------------------------------------------------

    echo 'export OMNI_KIT_ALLOW_ROOT=1' >> ~/.bashrc
    source ~/.bashrc

---------------------------------------------------------------
export XDG_RUNTIME_DIR=/run/user/$(id -u)



--------------------------------------------------------------
## **相关提示**
 - pip指令安装isaacsim
pip指令只支持Ubuntu22.04安装isaacsim且只有4以上版本支持
pip install 'isaacsim[all,extscache]==4.1.0' --extra-index-url https://pypi.nvidia.com  
Isaac Sim 需要 Python 3.10.才可访问 Python 下载页面 以获得合适的版本。
在 Linux 上，GLIBC 2.34+ （manylinux_2_34_x86_64） 版本兼容性，pip 需要版本兼容性才能发现和安装 Python 软件包。使用命令检查 GLIBC 版本 `ldd --version.`
 - run指令下载显卡驱动
wget https://developer.download.nvidia.com/compute/cuda/12.4.0/local_installers/cuda_12.4.0_550.54.14_linux.run
sudo sh cuda_12.4.0_550.54.14_linux.run
