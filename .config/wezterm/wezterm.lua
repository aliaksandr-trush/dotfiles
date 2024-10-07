local wezterm = require("wezterm")

local kanagawa_dark = {
  foreground = "#dcd7ba",
  background = "#1f1f28",

  cursor_bg = "#dcd7ba",
  cursor_fg = "#1f1f28",
  cursor_border = "#c8c093",

  selection_fg = "#c8c093",
  selection_bg = "#2d4f67",

  scrollbar_thumb = "#16161d",
  split = "#16161d",

  ansi = { "#16161D", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
  brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
  indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
}

local kanagawa_light = {
  background = "#f2ecbc",
  foreground = "#545464",

  selection_bg = "#c9cbd1",
  selection_fg = "#43436c",

  cursor_fg = "#f2ecbc",
  cursor_bg = "#43436c",
  cursor_border = "#dc8a78",

  scrollbar_thumb = "#b5b093",
  split = "#b5b093",

  ansi = { "#1F1F28", "#c84053", "#6f894e", "#77713f", "#4d699b", "#b35b79", "#597b75", "#545464" },
  brights = { "#8a8980", "#d7474b", "#6e915f", "#836f4a", "#6693bf", "#624c83", "#5e857a", "#43436c" },

  indexed = { [16] = "#cc6d00", [17] = "#e82424", },
}

local function colors_for_appearance(appearance)
  if appearance:find 'Dark' then
    return kanagawa_dark
  else
    return kanagawa_light
  end
end

wezterm.on('window-config-reloaded', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local appearance = window:get_appearance()
  local scheme = colors_for_appearance(appearance)
  if overrides.colors ~= scheme then
    overrides.colors = scheme
    window:set_config_overrides(overrides)
  end
end)

local config = wezterm.config_builder()
config.initial_cols = 140
config.initial_rows = 50

config.force_reverse_video_cursor = true

config.automatically_reload_config = true

config.enable_tab_bar = false

config.window_decorations = "NONE"
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

config.font = wezterm.font_with_fallback({
  "Hack",

  "JetBrains Mono",

  "Noto Color Emoji",

  "Symbols Nerd Font Mono",
})
config.font_size = 11
config.warn_about_missing_glyphs = false
return config
