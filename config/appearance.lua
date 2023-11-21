-- chose colorcheme
-- local theme = "catppucchin_latte" -- light
local theme = "catppucchin_mocha" -- dark

local colors = require('colors.' .. theme)
local light_theme_list= {
    "catppucchin_latte",
    "some colorcheme",
}

local wezterm = require('wezterm')

local function setupTheme()
    for _, value in ipairs(light_theme_list) do
        if theme == value then
            require('events.tab-title-light').setup()
            require('events.right-status-light').setup()
            return {
                color_scheme = 'Catppuccin Latte',
                opacity = 0.95,
            }
        end
    end
    require('events.tab-title-dark').setup()
    require('events.right-status-dark').setup()
    return {
        color_scheme = 'Catppuccin Mocha',
        opacity = 0.97,
    }
end

-- random background
local random_pic = {
    -- '/backdrops/astro-jelly.jpg',
    -- '/backdrops/final-showdown.jpg',
    -- '/backdrops/pastel-samurai.jpg',
    -- '/backdrops/punk.jpg',
    '/backdrops/space.jpg',
    '/backdrops/voyage.jpg',
}
local pic = math.random(1, #random_pic)

return {
    color_scheme = setupTheme().color_scheme,
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

    background = {
        {
            -- img 
            -- source = { File = { path = wezterm.config_dir .. '/backdrops/smoke.gif', speed = 0.2} },
            -- source = { File = { path = "C:/Users/ThinkPad/.config/wezterm/backdrops/smoke.gif",speed = 0.2} },
            -- source = { File = { path = "C:/Users/ThinkPad/.config/wezterm/backdrops/man.gif",speed = 0.2} },
            -- source = { File = { path = "C:/Users/ThinkPad/.config/wezterm/backdrops/nasa.gif",speed = 0.2} },
            -- source = { File = { path = wezterm.config_dir .. random_pic[pic] } },

            -- pure color
            source = { Color = 'black' },
        },
        {
            source = { Color = colors.background },
            height = '100%',
            width = '100%',
            opacity = setupTheme().opacity,
        },
    },

    wezterm.on("gui-startup", function(cmd)
        local screen = wezterm.gui.screens().active
        local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
        local gui = window:gui_window()
        local width = 0.75 * screen.width
        local height = 0.7 * screen.height
        gui:set_inner_size(width, height)
        gui:set_position((screen.width - width) / 2, (screen.height - height) / 4)
    end),
    wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
        local pane = tab.active_pane
        local title = pane.foreground_process_name
        return {
            { Text = " " .. title .. " " },
        }
    end),
}


