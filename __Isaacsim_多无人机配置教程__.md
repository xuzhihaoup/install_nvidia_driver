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
**安装常见报错教程**  
https://zhuanlan.zhihu.com/p/21891391762  
## **常用命令**
./clash -d . &====打开代理   
pkill clash   ====关闭代理  
docker ps -a  ====查看容器列表  
docker rm isaac_sim_container  ====删除容器  
sudo systemctl isolate graphical.target ====重启显示  
watch -n 1 nvidia-smi =====显卡刷新  
source ~/.bashrc =====bashrc刷新  
## **配置要求**  
 - **Ubuntu**: 20.04/22.04  
 - **宿主机**：Ubuntu20.04  
 - **Isaac Sim**: 4.1.0 
 - **Isaac Lab**: 1.** * **
 - **python**: 3.10
 - **pytorch**: 2.2.2+cu118
 - **rl**: 0.3.1  
## **实验环境**
 - Ubuntu 20.040.6 LTS
 - NVIDIA-SMI 550.54.14  
 - Driver Version: 550.54.14    
 - CUDA Version: 12.4  
 - miniconda3  
 - annotated-types          0.7.0  
 - antlr4-python3-runtime   4.9.3  
 - av                       15.0.0  
 - certifi                  2025.7.9  
 - charset-normalizer       3.4.2  
 - click                    8.2.1  
 - cloudpickle              3.1.1  
 - contourpy                1.3.2  
 - cycler                   0.12.1  
 - decorator                5.2.1  
 - einops                   0.8.1  
 - filelock                 3.18.0  
 - fonttools                4.58.5  
 - fsspec                   2025.5.1
 - gitdb                    4.0.12
 - GitPython                3.1.44
 - hydra-core               1.3.2
 - idna                     3.10
 - imageio                  2.37.0
 - imageio-ffmpeg           0.6.0
 - importlib_metadata       8.7.0
 - Jinja2                   3.1.6
 - kiwisolver               1.4.8
 - MarkupSafe               3.0.2
 - matplotlib               3.10.3
 - moviepy                  2.2.1
 - mpmath                   1.3.0
 - narwhals                 1.46.0
 - networkx                 3.4.2
 - numpy                    2.2.6
 - nvidia-cublas-cu12       12.6.4.1
 - nvidia-cuda-cupti-cu12   12.6.80
 - nvidia-cuda-nvrtc-cu12   12.6.77
 - nvidia-cuda-runtime-cu12 12.6.77
 - nvidia-cudnn-cu12        9.5.1.17
 - nvidia-cufft-cu12        11.3.0.4
 - nvidia-cufile-cu12       1.11.1.6
 - nvidia-curand-cu12       10.3.7.77
 - nvidia-cusolver-cu12     11.7.1.2
 - nvidia-cusparse-cu12     12.5.4.2
 - nvidia-cusparselt-cu12   0.6.3
 - nvidia-nccl-cu12         2.26.2
 - nvidia-nvjitlink-cu12    12.6.85
 - nvidia-nvtx-cu12         12.6.77
 - omegaconf                2.3.0
 - orjson                   3.10.18
 - packaging                25.0
 - pandas                   2.3.1
 - pillow                   11.3.0
 - pip                      25.1
 - platformdirs             4.3.8
 - plotly                   6.2.0
 - proglog                  0.1.12
 - protobuf                 6.31.1
 - pydantic                 2.11.7
 - pydantic_core            2.33.2
 - pyparsing                3.2.3
 - python-dateutil          2.9.0.post0
 - python-dotenv            1.1.1
 - pytz                     2025.2
 - PyYAML                   6.0.2
 - requests                 2.32.4
 - sentry-sdk               2.32.0
 - setuptools               78.1.1
 - six                      1.17.0
 - smmap                    5.0.2
 - sympy                    1.14.0
 - tensordict               0.9.0
 - torch                    2.7.1
 - torchrl                  0.3.1
 - tqdm                     4.67.1
 - triton                   3.3.1
 - typing_extensions        4.14.1
 - typing-inspection        0.4.1
 - tzdata                   2025.2
 - urllib3                  2.5.0
 - wandb                    0.21.0
 - wheel                    0.45.1
 - zipp                     3.23.0


推荐配置网络代理-clash  
## **系统环境搭建**  
nvidia-smi查看显卡信息--ubuntu-drivers devices看是否为recommended版本--不是请卸载安装 方式2重新安装  
recommended版本太新不建议使用经实验4090在575驱动CUDA12.8下不能调用Vulkan接口最后更换550CUDA12.4(宿主机)  
**方式1**  

    ubuntu-drivers devices安装系统推荐驱动有recommended
    sudo apt install [xx]

**方式2 推荐**

    通过下载安装包安装

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

    sudo apt update  
    sudo apt install -y x11-apps  
    xclock   

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


#  **成功复现说明**：
最后Omnnidrones在docker容器复现失败，在服务器本地复现成功，现进行原因分析： 
 - **原因1**-已解决    
    docker容器不界面调用vulkan失败，通过映射到X11显示解决(详情见容器启动脚本：[容器启动脚本][1])。   
 - **原因2**-半解决    
 由于isaacsim加载模型需要调用Opengl接口，但是服务器无外接显示器，导致Opengl接口一直挂载到核显上不是挂载到NVIDAI显卡，但是最后使用Nomachine+zerotier方案好像映射了一个虚拟显示器，这个时候程序不报错OPengl问题但是打印glxinfo -B还是挂载到核显。未来复现推荐使用物理机。    
 - **原因3**-已解决  
 由于实验设计isaacsim、isaacLab和Omnidrones，但是Omnidrones是基于sim4.1.0实现(最后一版)，截至2025-7-13，sim已经更新至5.0.0，Lab也向后更新了9个版本，而且isaacsim更新完全不向后兼容，Omnidrones也停止更新了，导致这3个在最后运行时候各种版本不兼容报错，最后在GPT老师+咸鱼技术哥的帮助下一顿库库乱配置（此时已经折腾快10天，死马当活马医🐎，都准备换方案到AirGym）最后成功运行。是在sim自带的python.sh里面运行成功的。  
#  代码提示  
##   train  
    主要从Omnidrones/scripts/train.py 文件，开始阅读，作者所有文件都是通过yaml加载  
### 变量加载  
@hydra.main(version_base=None, config_path=".", config_name="train")  
大部分yaml在omnidrones/cfg文件夹  
### 环境初始化  
env_class = IsaacEnv.REGISTRY[cfg.task.name]#环境基类 注册表容器
作者使用动态注册，注册环境
IsaacEnv为环境母类，里面的各个子方法需要在子类内声明方法，各个子类在omnidrones/envs/single（单任务）  
这里以track.py为例，这里面主要有设置轨迹_compute_traj，计算奖励与设置终止条件_compute_reward_and_done，获取观测数据_compute_state_and_obs，环境初始化设置相关设置_pre_sim_step，重置环境_reset_idx，设置观测奖励动作空间_set_specs，设置环境物理世界_design_scene，__init__里面主要是相关参数  
### 强化算法实例化  
policy = ALGOS[cfg.algo.name.lower()](  
            cfg.algo,#选择强化学习算法  
            env.observation_spec,#环境观察空间的数据规范格式  
            env.action_spec,#动作空间的数据规范  
            env.reward_spec,#环境奖励的数据类型与形状规范  
            device=base_env.device#训练设备  
        )  
作者是通过动态注册，注册相关强化学习算法类相关强化学习算法文件在omnidrones/learning里面，作者也是通过动态注册加载网络模型，所以只能训练不能验证，验证的话要重新搭网络。  

## 总结  

要设计自己的任务去omnidrones/envs/single文件夹下参照其他任务设计自己的任务类。（这里面设计自己的奖励规则）  
要设计强化学习算法去omnidrones/learning里面参照其他强化学习算法设计自己的算法。  
作者这个代码只是做了仿真train，甚至不能验证，模型权重保存也只是保存的网络权重没有保存模型。所以不能sim2real。  


--------------------------------------------------------------
##  **相关提示**
 - pip指令安装isaacsim
pip指令只支持Ubuntu22.04安装isaacsim且只有4以上版本支持

pip install 'isaacsim[all,extscache]==4.1.0' --extra-index-url https://pypi.nvidia.com  

Isaac Sim 需要 Python 3.10.才可访问 Python 下载页面 以获得合适的版本。
在 Linux 上，GLIBC 2.34+ （manylinux_2_34_x86_64） 版本兼容性，pip 需要版本兼容性才能发现和安装 Python 软件包。使用命令检查 GLIBC 版本 `ldd --version.`
 - run指令下载显卡驱动  

wget https://developer.download.nvidia.com/compute/cuda/12.4.0/local_installers/cuda_12.4.0_550.54.14_linux.run
sudo sh cuda_12.4.0_550.54.14_linux.run  

 [1]: https://github.com/xuzhihaoup/install_nvidia_driver/blob/main/start_docker_run_display.sh/ "启动脚本"  


