local platform = require('utils.platform')()

local options = {
   default_prog = {},
   launch_menu = {},
}

if platform.is_win then
   options.default_prog = { 'C:\\Program Files\\PowerShell\\7\\pwsh.exe' }
   -- options.default_prog = { 'wsl.exe', '-d', 'Ubuntu' }
   options.launch_menu = {
      { label = 'Ubuntu (WSL2)', args = { 'wsl.exe', '-d', 'Ubuntu' } },
      { label = 'pwsh7', args = { 'C:\\Program Files\\PowerShell\\7\\pwsh.exe' } },
      { label = 'Git Bash', args = { 'D:\\Program Files\\Git\\bin\\bash.exe' } },
      { label = 'CMD', args = { 'cmd' } },
      -- { label = 'PowerShell', args = { 'powershell' } },
      -- { label = 'Nushell', args = { 'E:\\Cache\\ChromeDownload\\nu-0.87.1-x86_64-windows-msvc-full\\nu.exe' } },
   }
elseif platform.is_mac then
   options.default_prog = { '/opt/homebrew/bin/fish' }
   options.launch_menu = {
      { label = 'Bash', args = { 'bash' } },
      { label = 'Fish', args = { '/opt/homebrew/bin/fish' } },
      { label = 'Nushell', args = { '/opt/homebrew/bin/nu' } },
      { label = 'Zsh', args = { 'zsh' } },
   }
end

return options
