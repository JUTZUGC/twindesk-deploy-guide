#!/usr/bin/env bash
set -euo pipefail
# TwinDesk 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/InukaAsith/TwinDesk#readme
# 更新日期：2026-10-30
# 类型：binary
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v curl >/dev/null 2>&1 || { echo "需要先安装 curl"; exit 1; }

mkdir -p .download
cd .download

curl -fL -o TwinDesk-2.4.0-x86_64.AppImage https://github.com/InukaAsith/TwinDesk/releases/download/v2.4.0/TwinDesk-2.4.0-x86_64.AppImage
chmod +x TwinDesk-2.4.0-x86_64.AppImage
echo "安装完成：运行 ./TwinDesk-2.4.0-x86_64.AppImage，再到另一台设备上装同一版本"

echo ""

echo "下载与校验完成，安装包在 .download 目录"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/InukaAsith/TwinDesk#readme"
