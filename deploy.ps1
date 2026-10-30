# TwinDesk 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/InukaAsith/TwinDesk#readme
# 更新日期：2026-10-30
# 类型：binary
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw '需要先安装 curl（Windows 10+ 自带 curl.exe）' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

curl.exe -fL -o TwinDesk-Setup-2.4.0.exe https://github.com/InukaAsith/TwinDesk/releases/download/v2.4.0/TwinDesk-Setup-2.4.0.exe
Write-Host "已下载 TwinDesk-Setup-2.4.0.exe：双击安装，再到另一台设备上装同一版本"

Write-Host ''

Write-Host '下载与校验完成，安装包在 .download 目录'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/InukaAsith/TwinDesk#readme'
