#!/bin/bash

set -e

# 检查系统版本，只允许Ubuntu 20.04或22.04
if ! command -v lsb_release &> /dev/null; then
  echo "❌ 系统不支持：找不到 lsb_release 命令。"
  exit 1
fi

OS_NAME=$(lsb_release -si)
OS_VERSION=$(lsb_release -sr)

if [[ "$OS_NAME" != "Ubuntu" ]]; then
  echo "❌ 当前系统不是 Ubuntu，脚本只支持 Ubuntu 系统。"
  exit 1
fi

if [[ "$OS_VERSION" != "20.04" && "$OS_VERSION" != "22.04" ]]; then
  echo "❌ 只支持 Ubuntu 20.04 或 22.04，当前版本是 $OS_VERSION"
  exit 1
fi

echo "ℹ️ 检测到支持的系统版本：$OS_NAME $OS_VERSION"
echo ""

echo "🔍 检测你的 NVIDIA 显卡..."

GPU_NAME=$(lspci | grep -i nvidia)

if [ -z "$GPU_NAME" ]; then
  echo "❌ 没有检测到 NVIDIA 显卡，或当前环境不支持检测。"
  exit 1
fi

echo "✅ 检测到显卡信息："
echo "$GPU_NAME"
echo ""

echo "📦 查询系统中可用的 NVIDIA 驱动版本..."

AVAILABLE_DRIVERS=$(ubuntu-drivers devices | grep driver | awk '{print $3}')

if [ -z "$AVAILABLE_DRIVERS" ]; then
  echo "❌ 未找到可用的 NVIDIA 驱动版本，请检查软件源。"
  exit 1
fi

RECOMMENDED_DRIVER=$(ubuntu-drivers devices | grep recommended | awk '{print $3}')

echo "🟢 推荐驱动版本：$RECOMMENDED_DRIVER"
echo ""
echo "📋 可用驱动版本列表："

i=1
declare -a DRIVER_LIST
for drv in $AVAILABLE_DRIVERS; do
  echo "$i) $drv"
  DRIVER_LIST[$i]=$drv
  ((i++))
done

echo ""
read -p "请输入要安装的驱动编号（回车默认推荐版本 $RECOMMENDED_DRIVER）: " CHOICE

if [ -z "$CHOICE" ]; then
  SELECTED_DRIVER=$RECOMMENDED_DRIVER
else
  SELECTED_DRIVER=${DRIVER_LIST[$CHOICE]}
  if [ -z "$SELECTED_DRIVER" ]; then
    echo "❌ 无效选择，退出。"
    exit 1
  fi
fi

read -p "确认安装驱动 $SELECTED_DRIVER 吗？(y/N): " CONFIRM

if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]; then
  echo "❎ 取消安装。"
  exit 0
fi

echo "⚙️  正在安装驱动 $SELECTED_DRIVER ..."
sudo apt update
sudo apt install -y "$SELECTED_DRIVER"

echo ""
echo "✅ 驱动安装完成！请重启系统后使用 nvidia-smi 验证。"
echo "建议命令：sudo reboot"
