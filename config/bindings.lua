local wezterm = require('wezterm')
local platform = require('utils.platform')()
local act = wezterm.action

local mod = {}
mod.CA = 'CTRL|ALT'
mod.CS = 'CTRL|SHIFT'

local smart_split = wezterm.action_callback(function(window, pane)
  local dim = pane:get_dimensions()
  if dim.pixel_height > dim.pixel_width then
    window:perform_action(act.SplitVertical({ domain = "CurrentPaneDomain" }), pane)
  else
    window:perform_action(act.SplitHorizontal({ domain = "CurrentPaneDomain" }), pane)
  end
end)

local keys = {
   -- <C-Space>
   { key = ' ', mods = 'CTRL', action = act.SendKey({ key = ' ', mods = 'CTRL' }) },

   -- <C-Enter>
   { key = 'Enter', mods = 'CTRL', action = act.SendKey({ key = 'Enter', mods = 'CTRL' }) },

   -- fullScreen
   { key = 'Enter', mods = 'ALT', action = act.ToggleFullScreen },

   -- copy/paste
   { key = 'c', mods = mod.CS, action = act.CopyTo('Clipboard') },
   { key = 'p', mods = mod.CS, action = act.PasteFrom('Clipboard') },

   -- fontsize
   { key = "=", mods = "ALT", action = act.IncreaseFontSize },
   { key = "-", mods = "ALT", action = act.DecreaseFontSize },
   { key = 'Backspace', mods = "ALT", action = act.ResetFontSize },

   -- scroll (mod.CA和PowerToys冲突)
   --[[ { key = "k", mods = mod.CA, action = act.ScrollByPage(-0.5) },
   { key = "j", mods = mod.CA, action = act.ScrollByPage(0.5) }, ]]
   { key = "PageUp", mods = mod.CS, action = act.ScrollByPage(-0.5) },
   { key = "PageDown", mods = mod.CS, action = act.ScrollByPage(0.5) },

   -- creat tab
   { key="t", mods=mod.CS, action=wezterm.action{SpawnTab="CurrentPaneDomain"}},

   -- search
   { key = "f", mods = mod.CS , action = act.Search("CurrentSelectionOrEmptyString") },

   -- switch tab
   { key = "1", mods = "ALT", action = act({ ActivateTab = 0 }) },
   { key = "2", mods = "ALT", action = act({ ActivateTab = 1 }) },
   { key = "3", mods = "ALT", action = act({ ActivateTab = 2 }) },
   { key = "4", mods = "ALT", action = act({ ActivateTab = 3 }) },
   { key = "5", mods = "ALT", action = act({ ActivateTab = 4 }) },
   { key = "6", mods = "ALT", action = act({ ActivateTab = 5 }) },
   { key = "7", mods = "ALT", action = act({ ActivateTab = 6 }) },
   { key = "8", mods = "ALT", action = act({ ActivateTab = 7 }) },
   { key = "9", mods = "ALT", action = act({ ActivateTab = 8 }) },

   -- panes: split
   { key = [[\]], mods = "ALT", action = smart_split },
   -- { key = [[\]], mods = 'SHIFT', action = act.SplitHorizontal({domain = 'CurrentPaneDomain'}) },
   -- { key = [[\]], mods = 'ALT', action = act.SplitVertical({domain = 'CurrentPaneDomain'}) },

   -- panes: navigation
   { key = 'k', mods = mod.CS, action = act.ActivatePaneDirection('Up') },
   { key = 'j', mods = mod.CS, action = act.ActivatePaneDirection('Down') },
   { key = 'h', mods = mod.CS, action = act.ActivatePaneDirection('Left') },
   { key = 'l', mods = mod.CS, action = act.ActivatePaneDirection('Right') },

   { key = "R", mods = mod.CS, action = wezterm.action.RotatePanes("Clockwise") },

   -- panes: size
   { key = 'LeftArrow', mods = mod.CS, action = act.AdjustPaneSize { 'Left', 3 }, },
   { key = 'DownArrow', mods = mod.CS, action = act.AdjustPaneSize { 'Down', 3 }, },
   { key = 'UpArrow', mods = mod.CS, action = act.AdjustPaneSize { 'Up', 3 } },
   { key = 'RightArrow', mods = mod.CS, action = act.AdjustPaneSize { 'Right', 3 }, },
}

local mouse_bindings = {
   -- Ctrl-click will open the link under the mouse cursor
   {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.OpenLinkAtMouseCursor,
   },
   -- no copy
   {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'NONE',
      action = act.ExtendSelectionToMouseCursor("Cell"),
   },
   {
      event = { Down = { streak = 1, button = 'Left' } },
      mods = 'NONE',
      action = act.ExtendSelectionToMouseCursor("Cell"),
   },
   {
      event = { Drag = { streak = 1, button = 'Left' } },
      mods = 'NONE',
      action = act.ExtendSelectionToMouseCursor("Cell"),
   },
   -- 2 kick chose word
   {
      event = { Up = { streak = 2, button = 'Left' } },
      mods = 'NONE',
      action = 	act.SelectTextAtMouseCursor("Word"),
   },
   {
      event = { Down = { streak = 2, button = 'Left' } },
      mods = 'NONE',
      action = 	act.SelectTextAtMouseCursor("Word"),
   },
   -- 3 kick chose line
   {
      event = { Up = { streak = 3, button = 'Left' } },
      mods = 'NONE',
      action = 	act.SelectTextAtMouseCursor("Line"),
   },
   {
      event = { Down = { streak = 3, button = 'Left' } },
      mods = 'NONE',
      action = 	act.SelectTextAtMouseCursor("Line"),
   },
   -- paste
   {
      event = { Down = { streak = 1, button = 'Right' } },
      mods = 'NONE',
      action = 	act.PasteFrom("Clipboard"),
   },

}

return {
   disable_default_key_bindings = true,
   disable_default_mouse_bindings = true,
   keys = keys,
   mouse_bindings = mouse_bindings,
}
