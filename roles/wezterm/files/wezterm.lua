local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action

config.set_environment_variables = {
	PATH = "/opt/homebrew/bin:" .. os.getenv("PATH"),
}

local function apply_current_tinty_theme()
	local default = "Catppuccin Macchiato"
	local homedir = os.getenv("HOME")
	local filename = homedir .. "/.config/tinted-theming/theme_name"

	local file = io.open(filename, "r") -- Open the file in read mode ("r")

	if file then
		local content = file:read("*all") -- Read the entire file content into a string
		io.close(file) -- Close the file after reading
		config.color_scheme = content:gsub("%s+", "")
		-- return content:gsub("%s+", "") -- Remove any trailing newline or whitespace
	else
		wezterm.log_error("Could not open file " .. filename)
		config.color_scheme = default
		-- return default
	end
end
apply_current_tinty_theme()

config.font = wezterm.font({
	family = "JetBrainsMono Nerd Font Mono",
	weight = "Medium",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})
config.font_size = 14.0
config.line_height = 1.0
config.bold_brightens_ansi_colors = true
config.window_decorations = "RESIZE|INTEGRATED_BUTTONS"
config.window_padding = { left = "0.5cell", right = "0.5cell", top = "0.5cell", bottom = "0.5cell" }
config.window_background_opacity = 1.0
config.macos_window_background_blur = 20
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 500
-- no fading cursor
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_ease_in = "Constant"

-- https://github.com/wez/wezterm/issues/3299#issuecomment-2145712082
-- maximize the window on startup to fill the screen it's launched on
wezterm.on("gui-startup", function(cmd)
	local active = wezterm.gui.screens().active
	local _, _, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():set_position(active.x, active.y)
	window:gui_window():set_inner_size(active.width, active.height)
end)

config.audible_bell = "Disabled"
config.visual_bell = {
	fade_in_function = "EaseIn",
	fade_in_duration_ms = 100,
	fade_out_function = "EaseOut",
	fade_out_duration_ms = 100,
}
config.colors = {
	visual_bell = "#505050",
}

-- no skip close confirmation for any process
config.skip_close_confirmation_for_processes_named = {}
config.window_close_confirmation = "AlwaysPrompt"
config.keys = {
	{ key = "d", mods = "CMD|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "CMD", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "k", mods = "CMD", action = wezterm.action.ClearScrollback("ScrollbackAndViewport") },
	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	{ key = "w", mods = "CMD|SHIFT", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
	{ key = "p", mods = "CMD|SHIFT", action = wezterm.action.ActivateCommandPalette },
	{
		key = ",",
		mods = "CMD",
		action = wezterm.action.SpawnCommandInNewTab({ cwd = wezterm.home_dir, args = { "nvim", wezterm.config_file } }),
	},
}

return config
