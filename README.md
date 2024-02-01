# 安装 WezTerm
 1.1 wezterm压缩包下载地址：https://github.com/wez/wezterm  
 1.2 添加path到系统变量：'D:\Program Files\WezTerm'  
 1.3 将仓库dot.wezterm中的文件复制到'C:\Users\ThinkPad\.config\wezterm\'  
 1.4 鼠标右键'Open WezTerm Here'  

       注册表路径： [HKEY_CLASSES_ROOT]
                       directory-background-shell
                       directory-shell
                       drive-shell

                       "计算机\HKEY_CLASSES_ROOT\Directory\Background\shell"
                       "计算机\HKEY_CLASSES_ROOT\Directory\shell"
                       "计算机\HKEY_CLASSES_ROOT\Drive\shell"

      - 新建项'Open WezTerm Here'
      - 新建字符串值，修改字符串值名称为Icon,值为'D:\Program Files\WezTerm\wezterm-gui.exe'
      - 修改'command'中字符串值为'D:\Program Files\WezTerm\wezterm-gui.exe start --no-auto-connect --cwd %V'

  - 配置文件Powershell快捷命令: 'weconfig'.  

### 优点
- 美观,顶部可以设置显示各种信息，电量，日期，天气等
- 可设置的颗粒度细
- 中文字体渲染好看
- 有且唯一支持nvim<C-space>快捷键的终端，快捷键设置丰富
- 支持背景gif动图
- 预览图片
- 支持nvim
  neo-tree预览图片,通过'https://github.com/adelarsq/image_preview.nvim'插件,快捷键v

### 缺点
- 不能显示lf和lazygit内的中文
- 键盘输入略有延迟
- 占用内存较高
- 设置相对较为复杂，配置代码为lua，较为灵活

![screenshot](./screenshots/screenshot-2.png)

### References/Links
- <https://github.com/rxi/lume>
- <https://github.com/catppuccin/wezterm>
- <https://github.com/wez/wezterm/discussions/628#discussioncomment-1874614>
- <https://github.com/wez/wezterm/discussions/628#discussioncomment-5942139>
