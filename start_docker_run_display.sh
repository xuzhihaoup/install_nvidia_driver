# #配置容器启动并映射图像界面
# xhost local:root

# XAUTH=/tmp/.docker.xauth
# touch $XAUTH
# xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
# #如果你想执行后删除容器加上--rm
# docker run -it \
#     --gpus all \
#     --name isaac_sim_container \
#     --user root \
#     -e DISPLAY=$DISPLAY \
#     -e QT_X11_NO_MITSHM=1 \
#     --volume /tmp/.X11-unix:/tmp/.X11-unix:rw \
#     --volume ${HOME}/.Xauthority:/root/.Xauthority:rw \
#     --env XAUTHORITY=$XAUTH \
#     --volume $XAUTH:$XAUTH \
#     --net host \
#     --privileged \
#     -v $(pwd):/workspace \
#     crpi-p4y4hs8uwp1hkhn1.cn-shanghai.personal.cr.aliyuncs.com/isaac_sim/isaac_sim_syjs:isaacsim_4.1.0_py310_ubuntu22.04_torch2.5.1_cuda122 \
#     bash

xhost local:root

XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run -it \
    --gpus all \
    --name isaac_sim_container \
    --user root \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    --env XAUTHORITY=$XAUTH \
    --env __GLX_VENDOR_LIBRARY_NAME=nvidia \
    --volume /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --volume ${HOME}/.Xauthority:/root/.Xauthority:rw \
    --volume $XAUTH:$XAUTH \
    --volume /usr/share/vulkan/icd.d:/usr/share/vulkan/icd.d:ro \
    --volume /usr/share/vulkan/implicit_layer.d:/usr/share/vulkan/implicit_layer.d:ro \
    --volume /usr/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:ro \
    --volume /lib/x86_64-linux-gnu:/lib/x86_64-linux-gnu:ro \
    --net host \
    --privileged \
    -v $(pwd):/workspace \
    crpi-p4y4hs8uwp1hkhn1.cn-shanghai.personal.cr.aliyuncs.com/isaac_sim/isaac_sim_syjs:isaacsim_4.1.0_py310_ubuntu22.04_torch2.5.1_cuda122 \
    bash


