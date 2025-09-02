local wezterm = require("wezterm")
-- local sessionizer = require("lua.sessionizer")
local config = wezterm.config_builder()

-- doesn't work on wayland, have to fallback to x11
config.enable_wayland = false

config.bidi_enabled = true
-- config.bidi_direction = "LeftToRight"

-- appearance
config.window_background_opacity = 0.8
config.font = wezterm.font("GeistMono Nerd Font Mono", { weight = "Medium" })
config.font_size = 16
config.color_scheme = "carbonfox"
config.colors = {
	background = "black",
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- config.window_padding = {
-- 	left = 18,
-- 	right = 15,
-- 	top = 20,
-- 	bottom = 5,
-- }

config.max_fps = 120
config.animation_fps = 120
config.front_end = "WebGpu"
config.prefer_egl = true

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.automatically_reload_config = true
config.audible_bell = "Disabled"
config.adjust_window_size_when_changing_font_size = false
config.harfbuzz_features = { "calt=0" }

-- mapping ctrl a to leader similar to tmux prefix
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- {
	--     key = "f",
	--     mods = "CTRL",
	--     action = wezterm.action_callback(sessionizer.toggle)
	-- },
	-- Key bindings delete word
	{
		key = "LeftArrow",
		mods = "OPT",
		action = wezterm.action({ SendString = "\x1bb" }),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = wezterm.action({ SendString = "\x1bf" }),
	},
	-- programming workspace with leader v
	{
		key = "v",
		mods = "LEADER",
		action = wezterm.action.SwitchToWorkspace({
			name = "main-cs",
			spawn = {
				cwd = "~/Desktop/main-cs",
				args = {
					"/opt/homebrew/bin/nvim",
					"~/Desktop/main-cs",
					"-c",
					'lua vim.api.nvim_set_current_dir("~/Desktop/main-cs")',
				},
			},
		}),
	},
}

return config
