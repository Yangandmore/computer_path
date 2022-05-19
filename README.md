我的电脑环境备份
---

当前电脑为mac笔记本
主要的操作以vim为主

使用yabai + skhd + alactritty + zsh + ohmyzsh + tmux + neovim 的配置完成整体布局。
配合spacebar来查看界面的窗口显示（需要隐藏mac上方的控制栏）。
uTool：软件、文件、小插件配合使用

* control：来完成**tmux**下的界面控制与管理。
* option：主要以控制**yabai/skhd**来完成屏幕切换、调整的操作。
* command：主要完成uTool的软件控制。

终端展示效果图：
<img width="1680" alt="image" src="https://user-images.githubusercontent.com/16630631/169191183-c6ff5497-d41b-430c-be16-f55a712dd1e7.png">

终端nvim展示效果图：
<img width="1680" alt="image" src="https://user-images.githubusercontent.com/16630631/169191149-20da2abb-7b45-4da0-a26e-1f6fceef2128.png">

全功能展示效果图
<img width="1679" alt="image" src="https://user-images.githubusercontent.com/16630631/169192392-f5724062-5692-44da-8236-99ff223d14aa.png">


电脑界面快捷键简介：
常用|   快捷键  | 效果
:-:|:--------:|:-------
\*  | ⌥ + c    | 新建窗口
\*  | ⌥ + ⌘ + c| 创建一个新的桌面，并将该焦点所在的软件移动过去
\*  | ⌥ + n/p  | 向下/上一个屏幕切换
|   | ⌥ + hjkl | 焦点切换
\*  | ⌥ + ⇧ + hjkl | 调整窗口位置
\*  | ⌥ + f/F  | 全屏/真全凭，再次点击回复
\*  | ⌥ + 0    | 平衡界面布局
\*  | ⌥ + 1/2/3| 切屏到指定位置
\*  | ⌥ + ⌘ + 1/2/3| 切屏到指定位置，并将该焦点所在的软件移动过去
\*  | ⌥ + x    | 关闭窗口
|   | ⌥ + wasd | 增大窗口（只能增大，不能缩小）
|   | ⌥ + ⇧ + wasd | 缩小窗口（只能缩小，不能增大）
\*  | ⌥ + t    | 不受**yabai**控制，再次点击恢复
|   | ⌥ + o    | 缩略图，方便移动，再次点击恢复
\*  | ⌥ + r    | 逆时针旋转空间多个窗口
|   | ⌥ + v    | 垂直切换
|   | ⌥ + b    | 水平切换
\*  | ⌥ + e    | 切换分割方式
|   | ⌥ + y    | 窗口固定(⌥ + t可以还原)
 

tmux 快捷键简介：
常用|   快捷键  | 效果
:-:|:--------:|:-------
\* | ⌃ + a    | tmux下的prefix，下面统称为prifix
\* | ⌃ + hjkl | 光标焦点移动
\* | prifix + c | 新建页面
\* | prifix + n/p | 光标向下/向上窗口移动
\* | prifix + 1/2/3| 切屏到指定位置
\* | prifix + x | 关闭当前窗口
\* | prifix + z | 最大化/关闭最大化当前窗口
\* | prifix + -/\| | 窗口向右/下分割
\* | prifix + , | 重命名页面
|  | prifix + }/{ | 与下一个/上一个窗格交换位置
|  | prifix + ! | 将当前窗格置于新窗口
\* | prifix + (⌃ + s) | 保存当前tmux下的所有页面
\* | prifix + (⌃ + r) | 恢复之前保存的tmux下的所有页面及状态
|  | prifix + r| 刷新tmuxconf文件新增内容
\* | prifix + \[ | 进入copy状态，可以通过vim模式的操作复制tmux下的内容，如v+y复制内容
\* | prifix + \] | 将copy状态下复制的内容粘贴到命令行中
\* | prifix + \\ | 插件功能，用于打开tmux下的功能列表
\* | prifix + < | 插件功能，用于打开tmux下的功能列表
\* | prifix + > | 插件功能，用于打开tmux下的功能列表

neovim 快捷键简介

常用|   快捷键  | 效果
:-:|:--------:|:-------
\* | \\       | leader键
\* | ⌃ + hjkl | 光标焦点移动
\* | BN、BP、BD、BL  | buffer 下一个、上一个、删除、列表
\* | TN、TD   | 新建Tab、删除Tab
\* | \"       | Tab向下移动
\* | jj       | esc 代替品
\* | space  | 代码折叠
\* | ;;、,,、>> ｜ 双击后快速在末尾添加该字符 
\* | F1     | 左侧打开tree、重复点击关闭
\* | F2     | 返回tree
\* | F3     | 在tree中找到当前文件的位置
\* | F4     | 右侧打开代码结构tree
\* | F5     | 代码中 git状态
\* | F6     | 历史记录
\* | F7     | git历史记录
\* | F8     | sh命令行
\* | gd、gy   | 定义跳转
\* | gi       | 实现跳转
\* | gr       | 参考
\* | leader + rn | 重命名
 
 
 
