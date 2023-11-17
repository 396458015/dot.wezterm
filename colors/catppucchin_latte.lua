-- A slightly altered version of catppucchin latte
local latte = {
    rosewater = "#dc8a78",
    flamingo = "#dd7878",
    pink = "#ea76cb",
    mauve = "#8839ef",
    red = "#d20f39",
    maroon = "#e64553",
    peach = "#fe640b",
    yellow = "#df8e1d",
    green = "#40a02b",
    teal = "#179299",
    sky = "#04a5e5",
    sapphire = "#209fb5",
    blue = "#1e66f5",
    lavender = "#7287fd",
    text = "#4c4f69",
    subtext1 = "#5c5f77",
    subtext0 = "#6c6f85",
    overlay2 = "#7c7f93",
    overlay1 = "#8c8fa1",
    overlay0 = "#9ca0b0",
    surface2 = "#acb0be",
    surface1 = "#bcc0cc",
    surface0 = "#ccd0da",
    crust = "#dce0e8",
    mantle = "#e6e9ef",
    base = "#eff1f5",
}

local colorscheme = {
   foreground = latte.text,
   background = latte.base,
   cursor_bg = latte.rosewater,
   cursor_border = latte.rosewater,
   cursor_fg = latte.crust,
   selection_bg = latte.surface2,
   selection_fg = latte.text,
   ansi = {
      "#0C0C0C", -- black
      "#C50F1F", -- red
      "#13A10E", -- green
      "#C19C00", -- yellow
      "#0037DA", -- blue
      "#881798", -- magenta/purple
      "#3A96DD", -- cyan
      "#CCCCCC", -- white
   },
   brights = {
      "#767676", -- black
      "#E74856", -- red
      "#16C60C", -- green
      "#F9F1A5", -- yellow
      "#3B78FF", -- blue
      "#B4009E", -- magenta/purple
      "#61D6D6", -- cyan
      "#F2F2F2", -- white
   },
   tab_bar = {
      background = "#000000",
      active_tab = {
         bg_color = latte.surface2,
         fg_color = latte.text,
      },
      inactive_tab = {
         bg_color = latte.surface0,
         fg_color = latte.subtext1,
      },
      inactive_tab_hover = {
         bg_color = latte.surface0,
         fg_color = latte.text,
      },
      new_tab = {
         bg_color = latte.base,
         fg_color = latte.text,
      },
      new_tab_hover = {
         bg_color = latte.mantle,
         fg_color = latte.text,
         italic = true,
      },
   },
   visual_bell = latte.surface0,
   indexed = {
      [16] = latte.peach,
      [17] = latte.rosewater,
   },
   scrollbar_thumb = latte.surface2,
   split = latte.overlay0,
   compose_cursor = latte.flamingo, -- nightbuild only
}

return colorscheme
