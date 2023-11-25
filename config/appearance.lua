local Darkness = 1 -- 1: darkness, others: lightness
local BG_pic = 0  -- 0: without pic, others: pic
local Screen_width_ratio = 0.8
local Screen_height_ratio = 0.75

local theme = Darkness == 1 and "catppucchin_mocha" or "catppucchin_latte"
local colors = require('colors.' .. theme)
local wezterm = require('wezterm')

local function setupTheme()
    local light_theme_list = {
        "catppucchin_latte",
        "some colorcheme",
    }
    local defaultTheme = {
        color_scheme = 'Catppuccin Mocha', -- dark
        opacity = 0.97,
    }

    local setupLightTheme = function()
        require('events.tab-title-light').setup()
        require('events.right-status-light').setup()
        return {
            color_scheme = 'Catppuccin Latte', -- light
            opacity = 0.95,
        }
    end

    for _, value in ipairs(light_theme_list) do
        if theme == value then
            return setupLightTheme()
        end
    end

    require('events.tab-title-dark').setup()
    require('events.right-status-dark').setup()
    return defaultTheme
end

local themeConfig = setupTheme()

local config = {
    color_scheme = themeConfig.color_scheme,
    animation_fps = 60,
    max_fps = 60,
    front_end = 'WebGpu',
    webgpu_power_preference = 'HighPerformance',
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = false,
    use_fancy_tab_bar = false,
    tab_max_width = 25,
    show_tab_index_in_tab_bar = false,
    switch_to_last_active_tab_when_closing_tab = true,
    window_decorations = "INTEGRATED_BUTTONS|RESIZE",
    integrated_title_button_alignment = "Right",
    integrated_title_button_color = "Auto",
    integrated_title_button_style = "Windows",
    integrated_title_buttons = { 'Hide', 'Maximize', 'Close' },
    adjust_window_size_when_changing_font_size = false,
    enable_scroll_bar = false,
    window_padding = { left = 2, right = 2, top = 2, bottom = 2 },
    window_close_confirmation = 'NeverPrompt',
    window_frame = {
        active_titlebar_bg = '#090909',
    },
    inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
}

if BG_pic == 0 then
    config.window_background_opacity = themeConfig.opacity
else
    local random_pic = {
        '/backdrops/astro-jelly.jpg',
        '/backdrops/final-showdown.jpg',
        '/backdrops/pastel-samurai.jpg',
        '/backdrops/punk.jpg',
        '/backdrops/space.jpg',
        '/backdrops/voyage.jpg',
    }
    local pic = math.random(1, #random_pic)

    local backgroundImage = {
        {
            -- source = { File = { path = wezterm.config_dir .. '/backdrops/smoke.gif', speed = 0.2} },
            -- source = { File = { path = "C:/Users/ThinkPad/.config/wezterm/backdrops/smoke.gif",speed = 0.2} },
            -- source = { File = { path = "C:/Users/ThinkPad/.config/wezterm/backdrops/man.gif",speed = 0.2} },
            -- source = { File = { path = "C:/Users/ThinkPad/.config/wezterm/backdrops/nasa.gif",speed = 0.2} },
            source = { File = { path = wezterm.config_dir .. random_pic[pic] } },
        },
        {
            source = { Color = colors.background },
            height = '100%',
            width = '100%',
            opacity = themeConfig.opacity,
        },
    }
    config.background = BG_pic == 0 and { { source = { Color = colors.background }, opacity = themeConfig.opacity } } or backgroundImage
end

wezterm.on("gui-startup", function(cmd)
    local screen = wezterm.gui.screens().active
    local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
    local gui = window:gui_window()
    local width = Screen_width_ratio * screen.width
    local height = Screen_height_ratio * screen.height
    gui:set_inner_size(width, height)
    gui:set_position((screen.width - width) / 2, (screen.height - height) / 4)
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local pane = tab.active_pane
    local title = pane.foreground_process_name
    return {
        { Text = " " .. title .. " " },
    }
end)

return config
