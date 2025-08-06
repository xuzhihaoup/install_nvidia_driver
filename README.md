# initialize_isaac_sim4.1.0
[Isaac Sim 多无人机配置教程](https://github.com/xuzhihaoup/install_nvidia_driver/blob/main/__Isaacsim_%E5%A4%9A%E6%97%A0%E4%BA%BA%E6%9C%BA%E9%85%8D%E7%BD%AE%E6%95%99%E7%A8%8B__.md)
dockerfile文件用于构建镜像  
**镜像包环境配置信息：**
- Isaac Sim 版本：4.1.0  
- Python 版本：3.10  
- 系统版本：Ubuntu 22.04  
- Torch 版本：2.5.1  
- CUDA 版本：12.2
- Package                  Version  
------------------------ -----------  
annotated-types          0.7.0  
antlr4-python3-runtime   4.9.3  
av                       15.0.0  
certifi                  2025.7.9  
charset-normalizer       3.4.2  
click                    8.2.1  
cloudpickle              3.1.1  
contourpy                1.3.2  
cycler                   0.12.1  
decorator                5.2.1  
einops                   0.8.1  
filelock                 3.18.0  
fonttools                4.58.5  
fsspec                   2025.5.1  
gitdb                    4.0.12  
GitPython                3.1.44  
hydra-core               1.3.2  
idna                     3.10  
imageio                  2.37.0  
imageio-ffmpeg           0.6.0  
importlib_metadata       8.7.0  
Jinja2                   3.1.6  
kiwisolver               1.4.8  
MarkupSafe               3.0.2  
matplotlib               3.10.3  
moviepy                  2.2.1  
mpmath                   1.3.0  
narwhals                 1.46.0  
networkx                 3.4.2  
numpy                    2.2.6  
nvidia-cublas-cu12       12.6.4.1  
nvidia-cuda-cupti-cu12   12.6.80  
nvidia-cuda-nvrtc-cu12   12.6.77  
nvidia-cuda-runtime-cu12 12.6.77  
nvidia-cudnn-cu12        9.5.1.17  
nvidia-cufft-cu12        11.3.0.4  
nvidia-cufile-cu12       1.11.1.6  
nvidia-curand-cu12       10.3.7.77  
nvidia-cusolver-cu12     11.7.1.2  
nvidia-cusparse-cu12     12.5.4.2  
nvidia-cusparselt-cu12   0.6.3  
nvidia-nccl-cu12         2.26.2  
nvidia-nvjitlink-cu12    12.6.85  
nvidia-nvtx-cu12         12.6.77  
omegaconf                2.3.0  
orjson                   3.10.18   
packaging                25.0  
pandas                   2.3.1  
pillow                   11.3.0  
pip                      25.1  
platformdirs             4.3.8  
plotly                   6.2.0  
proglog                  0.1.12  
protobuf                 6.31.1  
pydantic                 2.11.7  
pydantic_core            2.33.2  
pyparsing                3.2.3  
python-dateutil          2.9.0.post0  
python-dotenv            1.1.1  
pytz                     2025.2  
PyYAML                   6.0.2  
requests                 2.32.4  
sentry-sdk               2.32.0  
setuptools               78.1.1  
six                      1.17.0  
smmap                    5.0.2  
sympy                    1.14.0  
tensordict               0.9.0  
torch                    2.7.1  
torchrl                  0.3.1  
tqdm                     4.67.1  
triton                   3.3.1  
typing_extensions        4.14.1  
typing-inspection        0.4.1  
tzdata                   2025.2  
urllib3                  2.5.0  
wandb                    0.21.0  
wheel                    0.45.1  
zipp                     3.23.0  
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


