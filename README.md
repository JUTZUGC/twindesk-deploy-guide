# TwinDesk 一键安装指南

> 第三方部署指南 · 非 TwinDesk 官方仓库。官方项目：[InukaAsith/TwinDesk](https://github.com/InukaAsith/TwinDesk)
> 内容来自官方文档（2026-10-30）。项目迭代快，请以[官方文档](https://github.com/InukaAsith/TwinDesk#readme)为准。

[![⚡ 一键安装](https://img.shields.io/badge/%E2%9A%A1_%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#一键安装推荐用百度搭子)

## 一键安装（推荐：用百度搭子）

> [!TIP]
> 不用云、不用账号，几台设备直连：同一套键鼠、对方的窗口、第二块屏、剪贴板与摄像头都能借过来。

⚠️ 支持 Windows 10/11、macOS 13+、Linux（X11 与 Wayland）、Android 10+，两端都要装。连接方式可以是同一 Wi-Fi、USB 线，也可以完全不走局域网（蓝牙或直连热点）。所有功能默认关闭，逐项打开才加载；安装包未签名时系统可能拦截。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/twindesk-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子会按系统下载对应安装包，安装后在两台设备上配对，再逐项打开你需要的共享能力，按它的提示确认即可，结束时它会告诉你结果。
   （下载地址与校验方式以官方文档为准。）



## TwinDesk 是什么？

TwinDesk 是开源的把几台电脑和手机连成一张桌面：共用一套键鼠、互开窗口、拖文件、同步剪贴板，还能接打电话与短信（协议：GPL-3.0，<img src="https://img.shields.io/github/stars/InukaAsith/TwinDesk?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

设备间直连的协同层：一套鼠标键盘控制多台电脑、把对方的应用窗口开在自己屏幕上、把旧笔记本或安卓平板当第二块屏、跨设备拖文件与同步剪贴板，另外还有摄像头、通话短信与通知转发。

- 任意组合：Mac、Windows、Linux、Android 两两互联
- 多台同时：TwinDesk Mesh 一次连上所有设备
- 不依赖云：设备之间加密直连，没有账号体系
- 三种链路：同一 Wi-Fi、USB 线、蓝牙或直连热点
- 能力按需开：每个功能默认关闭，不打开就不加载
- 手机当外设：摄像头进视频会议，还能远程操作

（来源：[官方仓库](https://github.com/InukaAsith/TwinDesk)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 1 | . |
| 跨 | 四 |
| 不 | 依 |
| 没 | 有 |
| 能 | 力 |
| G | P |

| 需要注意 | 说明 |
|---|---|
| 两 | 端 |
| 安 | 装 |
| 功 | 能 |
| 手 | 机 |
| 项 | 目 |

> 以上基于官方文档与社区反馈整理（2026-10-30），以官方最新文档为准。

## 官方安装方式（可手动执行）

```bash
curl -fL -o TwinDesk-2.4.0-x86_64.AppImage https://github.com/InukaAsith/TwinDesk/releases/download/v2.4.0/TwinDesk-2.4.0-x86_64.AppImage
chmod +x TwinDesk-2.4.0-x86_64.AppImage
echo "安装完成：运行 ./TwinDesk-2.4.0-x86_64.AppImage，再到另一台设备上装同一版本"
```

安装包来源：[https://github.com/InukaAsith/TwinDesk/releases/tag/v2.4.0](https://github.com/InukaAsith/TwinDesk/releases/tag/v2.4.0)

## 验证状态

| 场景 | 状态 |
|---|---|
| README 确认四平台支持、连接方式与「功能默认关闭」设计 | 已核对 2026-10-30 |
| Release v2.4.0 资产名与大小已核对 | 已核对 2026-10-30 |
| 未实测安装与配对 | 说明 2026-10-30 |
| MCP 冒烟：initialize / tools/list 返回 get_guide、search_guide、get_project_info | 已验证 2026-10-30 |
| 非目标宿主调用 get_guide 被拦截（HOST_NOT_ALLOWED） | 已验证 2026-10-30 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

项目本身不含 MCP；本仓库的 MCP 只提供安装包选择、配对步骤与常见问题。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-30）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\twindesk-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 安装包对照（v2.4.0）

| 平台 | 文件 | 大小 |
|---|---|---|
| Windows x64 | TwinDesk-Setup-2.4.0.exe | 102.4 MB |
| Windows arm64 | TwinDesk-Setup-2.4.0-arm64.exe | 104.4 MB |
| macOS Apple Silicon | TwinDesk-2.4.0-arm64.dmg | 152.5 MB |
| macOS Intel | TwinDesk-2.4.0-x64_Intel.dmg | 160.2 MB |
| Linux x64 | TwinDesk-2.4.0-x86_64.AppImage | 125.7 MB |
| Debian / Ubuntu | TwinDesk-2.4.0-amd64.deb | 87.3 MB |
| Arch | twindesk-bin-2.4.0-1-x86_64.pkg.tar.zst | 119.0 MB |
| Android | TwinDesk-2.4.0.apk | 23.9 MB |

## 第一次配对

1. 两台设备都装**同一版本**
2. 打开 TwinDesk，在一边点添加设备，另一边会收到邀请
3. 默认走同一 Wi-Fi；不同网段时改用 USB 线、蓝牙或直连热点
4. 配对成功后逐项打开需要的能力：键鼠共享、第二屏、文件、剪贴板、摄像头、通知

## 需要注意

- 所有功能默认关闭，第一次用会觉得「怎么没反应」，先去开关里打开
- 手机当第二屏时要保持屏幕常亮，耗电会明显增加
- Linux 上 Wayland 与 X11 行为略有差异，遇到问题先看官方 issue
- GPL-3.0：二次分发与修改都要开源
- 没有账号体系，设备配对靠本地确认，别在公共网络随意接受邀请

## 常见坑

- 搜不到对方设备：确认同网段，或改用 USB / 蓝牙 / 直连热点
- 功能没反应：到开关里逐项启用，默认全关
- Windows 拦截安装：核对来源后选「更多信息 → 仍要运行」
- macOS 打不开：系统设置 → 隐私与安全性 → 仍要打开，并按提示给屏幕录制与辅助功能权限
- 剪贴板不同步：检查两端剪贴板开关与系统权限
- 手机连不上：确认 Android 10 以上，且没有被省电策略杀后台
- 版本不一致：两端升到同一版本再配对

## 免责声明

本仓库为第三方指南，与 TwinDesk 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-30），项目迭代快，请以[官方文档](https://github.com/InukaAsith/TwinDesk#readme)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
