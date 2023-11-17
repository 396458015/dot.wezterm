local colors = require('colors.catppucchin_latte') --light
-- local colors = require('colors.catppucchin_mocha') --drak

local basecolor = colors.background 
if basecolor == "#eff1f5" then
    require('events.right-status-light').setup()
    require('events.tab-title-light').setup()
else
    require('events.right-status-dark').setup()
    require('events.tab-title-dark').setup()
end
local Config = require('config')
require('events.new-tab-button').setup()
return Config:init()
    :append(require('config.appearance'))
    :append(require('config.bindings'))
    :append(require('config.domains'))
    :append(require('config.fonts'))
    :append(require('config.general'))
    :append(require('config.launch')).options



