local colors = require('colors.catppucchin_latte') --light
-- local colors = require('colors.catppucchin_mocha') --drak

local wezterm = require('wezterm')
-- random background
random_pic = {
    -- '/backdrops/astro-jelly.jpg',
    -- '/backdrops/final-showdown.jpg',
    -- '/backdrops/pastel-samurai.jpg',
    -- '/backdrops/punk.jpg',
    '/backdrops/space.jpg',
    '/backdrops/voyage.jpg',
}
local pic = math.random(1,#random_pic)

if colors == require('colors.catppucchin_latte') then
    return {
        color_scheme = 'Catppuccin Latte',

        animation_fps = 60,
        max_fps = 60,
        front_end = 'WebGpu',
        webgpu_power_preference = 'HighPerformance',

        background = {
            {
                -- img
                -- source = { File = { path = wezterm.config_dir .. '/backdrops/smoke.gif', speed = 0.2} },
                -- source = { File = { path = "C:/Users/ThinkPad/.config/wezterm/backdrops/smoke.gif",speed = 0.2} },
                -- source = { File = { path = "C:/Users/ThinkPad/.config/wezterm/backdrops/man.gif",speed = 0.2} },
                -- source = { File = { path = "C:/Users/ThinkPad/.config/wezterm/backdrops/nasa.gif",speed = 0.2} },
                -- source = { File = { path = wezterm.config_dir .. random_pic[pic] } },
                -- pure
                source = { Color = 'black' },
            },
            {
                source = { Color = colors.background },
                height = '100%',
                width = '100%',
                opacity = 0.95,
            },
        },

        --cursor color
        force_reverse_video_cursor = true,

        -- tab bar
        enable_tab_bar = true,
        hide_tab_bar_if_only_one_tab = false,
        use_fancy_tab_bar = false,
        tab_max_width = 25,
        show_tab_index_in_tab_bar = false,
        switch_to_last_active_tab_when_closing_tab = true,

        -- window
        window_decorations = "INTEGRATED_BUTTONS|RESIZE",
        integrated_title_button_alignment = "Right",
        integrated_title_button_color = "Auto",
        integrated_title_button_style = "Windows",
        integrated_title_buttons = { 'Hide', 'Maximize', 'Close' },
        adjust_window_size_when_changing_font_size = false,
        enable_scroll_bar = false,-- no scrollbar
        window_padding = { left = 2, right = 2, top = 2, bottom = 2, },
        --[[ enable_scroll_bar = true,-- scrollbar
   window_padding = { left = 5, right = 10, top = 12, bottom = 7, }, ]]
        window_close_confirmation = 'NeverPrompt',
        window_frame = {
            active_titlebar_bg = '#090909',
            -- font = fonts.font,
            -- font_size = fonts.font_size,
        },
        inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },

        wezterm.on("gui-startup", function(cmd)
            local screen = wezterm.gui.screens().active
            local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
            local gui = window:gui_window()
            local width = 0.75 * screen.width
            local height = 0.7 * screen.height
            gui:set_inner_size(width, height)
            -- gui:set_position((screen.width - width) / 2, (screen.height - height) / 2)
            gui:set_position((screen.width - width) / 2, (screen.height - height) / 4)
        end),

        wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
            local pane = tab.active_pane
            local title = pane.foreground_process_name
            return {
                {Text=" " .. title .. " "},
            }
        end),
    }
elseif colors == require('colors.catppucchin_mocha') then
    return {
        color_scheme = 'Catppuccin Mocha',

        animation_fps = 60,
        max_fps = 60,
        front_end = 'WebGpu',
        webgpu_power_preference = 'HighPerformance',

        background = {
            {
                -- img
                -- source = { File = { path = wezterm.config_dir .. '/backdrops/smoke.gif', speed = 0.2} },
                -- source = { File = { path = "C:/Users/ThinkPad/.config/wezterm/backdrops/smoke.gif",speed = 0.2} },
                -- source = { File = { path = "C:/Users/ThinkPad/.config/wezterm/backdrops/man.gif",speed = 0.2} },
                -- source = { File = { path = "C:/Users/ThinkPad/.config/wezterm/backdrops/nasa.gif",speed = 0.2} },
                -- source = { File = { path = wezterm.config_dir .. random_pic[pic] } },
                -- pure
                source = { Color = 'black' },
            },
            {
                source = { Color = colors.background },
                height = '100%',
                width = '100%',
                opacity = 0.90,
            },
        },

        --cursor color
        force_reverse_video_cursor = true,

        -- tab bar
        enable_tab_bar = true,
        hide_tab_bar_if_only_one_tab = false,
        use_fancy_tab_bar = false,
        tab_max_width = 25,
        show_tab_index_in_tab_bar = false,
        switch_to_last_active_tab_when_closing_tab = true,


        -- window
        window_decorations = "INTEGRATED_BUTTONS|RESIZE",
        integrated_title_button_alignment = "Right",
        integrated_title_button_color = "Auto",
        integrated_title_button_style = "Windows",
        integrated_title_buttons = { 'Hide', 'Maximize', 'Close' },
        adjust_window_size_when_changing_font_size = false,
        enable_scroll_bar = false,-- no scrollbar
        window_padding = { left = 2, right = 2, top = 2, bottom = 2, },
        --[[ enable_scroll_bar = true,-- scrollbar
   window_padding = { left = 5, right = 10, top = 12, bottom = 7, }, ]]
        window_close_confirmation = 'NeverPrompt',
        window_frame = {
            active_titlebar_bg = '#090909',
            -- font = fonts.font,
            -- font_size = fonts.font_size,
        },
        inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },

        wezterm.on("gui-startup", function(cmd)
            local screen = wezterm.gui.screens().active
            local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
            local gui = window:gui_window()
            local width = 0.75 * screen.width
            local height = 0.7 * screen.height
            gui:set_inner_size(width, height)
            -- gui:set_position((screen.width - width) / 2, (screen.height - height) / 2)
            gui:set_position((screen.width - width) / 2, (screen.height - height) / 4)
        end),

        wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
            local pane = tab.active_pane
            local title = pane.foreground_process_name
            return {
                {Text=" " .. title .. " "},
            }
        end),

    }
end


