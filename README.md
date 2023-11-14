# 安装 WezTerm
 1.1 wezterm压缩包下载地址：https://github.com/wez/wezterm  
 1.2 添加path到系统变量：'D:\Program Files\WezTerm'  
 1.3 将仓库dot.wezterm中的文件复制到'C:\Users\ThinkPad\.config\wezterm\'  
 1.4 鼠标右键'Open WezTerm Here'  

       注册表路径： [HKEY_CLASSES_ROOT]
                       directory-background-shell
                       directory-shell
                       drive-shell
      - 新建项'Open WezTerm Here'
      - 新建字符串值，修改字符串值名称为Icon,值为'D:\Program Files\WezTerm\wezterm-gui.exe'
      - 修改'command'中字符串值为'D:\Program Files\WezTerm\wezterm-gui.exe start --no-auto-connect --cwd %V'

  - 配置文件Powershell快捷命令: 'weconfig'.  

![screenshot](./screenshots/screenshot-2.png)

### References/Links
- <https://github.com/rxi/lume>
- <https://github.com/catppuccin/wezterm>
- <https://github.com/wez/wezterm/discussions/628#discussioncomment-1874614>
- <https://github.com/wez/wezterm/discussions/628#discussioncomment-5942139>
