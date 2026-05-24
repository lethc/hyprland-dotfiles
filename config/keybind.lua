local config = require("config.variable")

-- Directories
-- Aplications
hl.bind(config.main_mod .. " + RETURN", hl.dsp.exec_cmd(config.terminal))
hl.bind(config.main_shift_mod .. " + RETURN", hl.dsp.exec_cmd(config.terminal .. " --title=Float"))
-- hl.bind(config.main_mod .. " + N", hl.dsp.exec_cmd("hyprlauncher"))
hl.bind(config.main_mod .. " + N", hl.dsp.exec_cmd("rofi -show drun -theme " .. config.launcher_theme))
-- hl.bind( config.main_mod .. " + N", hl.dsp.exec_cmd("vicinae toggle"))
hl.bind(config.main_mod .. " + code:61", hl.dsp.exec_cmd(config.emoji_picker))
hl.bind(config.alt_mod .. " + RETURN", hl.dsp.exec_cmd(config.terminal .. " --title=Float -e gtt"))
-- hl.bind(config.alt_mod .. " + RETURN", hl.dsp.exec_cmd(config.terminal .. " --title=Float -e --hold gtt"))
hl.bind(config.main_shift_mod .. " + I", hl.dsp.exec_cmd(config.terminal .. " --title=Float -e btop"))
hl.bind(config.main_shift_mod .. " + Y", hl.dsp.exec_cmd(config.terminal .. " --title=Float -e yazi"))
hl.bind(config.main_mod .. " + V", hl.dsp.exec_cmd("clipse-gui"))
hl.bind("XF86Calculator", hl.dsp.exec_cmd("qalculate-gtk"))

-- scripts
hl.bind(
	config.main_shift_mod .. " + N",
	hl.dsp.exec_cmd('rofi -theme-str "window { width: 50%; }" -theme ' .. config.launcher_theme .. " -show window")
)
hl.bind(
	config.main_mod .. " + B",
	hl.dsp.exec_cmd(
		config.scripts
			.. 'rofi/bookmenu -p "Select a bookmark" -b '
			.. config.personal_files
			.. "my_bookmarks -co "
			.. config.browser
	)
)
hl.bind(
	config.main_shift_mod .. " + O",
	hl.dsp.exec_cmd(
		config.scripts
			.. 'rofi/bookmenu -p "Select a config" -b '
			.. config.dots
			.. "bookmenu/configs -co "
			.. '"'
			.. config.terminal
			.. " --title=MyConfigs -e nvim"
			.. '"'
	)
)
-- Notes
hl.bind(config.main_mod .. " + C", hl.dsp.exec_cmd(config.personal_files .. "Rofi/tv-lovely"))
hl.bind(config.main_shift_mod .. " + C", hl.dsp.exec_cmd(config.personal_files .. "Rofi/tv-g"))
-- Websearch
hl.bind(config.main_shift_mod .. " + M", hl.dsp.exec_cmd(config.scripts .. "rofi/websearch"))
hl.bind(config.main_mod .. " + M", hl.dsp.exec_cmd(config.scripts .. "rofi/simple-websearch google"))
hl.bind(config.main_mod .. " + Y", hl.dsp.exec_cmd(config.scripts .. "rofi/simple-websearch yandex"))
hl.bind(config.main_mod .. " + U", hl.dsp.exec_cmd(config.scripts .. "rofi/simple-websearch bing"))
hl.bind(config.main_shift_mod .. " + U", hl.dsp.exec_cmd(config.scripts .. "rofi/simple-websearch brave"))
-- tmux session
hl.bind(config.main_mod .. " + I", hl.dsp.exec_cmd(config.scripts .. "rofi/tmux_session"))
-- Open directory from...
hl.bind(config.main_shift_mod .. " + P", hl.dsp.exec_cmd(config.scripts .. "rofi/placesmenu open_with_filemager"))
-- hl.bind(config.main_shift_mod .. " + P", hl.dsp.exec_cmd(config.scripts .. "rofi/placesmenu open_with_terminal"))
-- Change Wallpaper
hl.bind(config.main_ctrl_mod .. " + P", hl.dsp.exec_cmd(config.scripts .. "rofi/wallpaper_picker"))
hl.bind(config.main_mod .. " + Z", hl.dsp.exec_cmd(config.scripts .. "utils/wallpaper/random_wall all"))
-- Restart Waybar
hl.bind(config.main_shift_mod .. " + B", hl.dsp.exec_cmd(config.hypr_scripts .. "restartWaybar"))
-- Color Picker
hl.bind(config.main_shift_mod .. " + X", hl.dsp.exec_cmd(config.scripts .. "utils/colorpicker"))
-- Display time and battery status in notification pop-up
hl.bind(config.main_ctrl_mod .. " + C", hl.dsp.exec_cmd(config.scripts .. "utils/notifySend date"))
hl.bind(config.main_ctrl_mod .. " + B", hl.dsp.exec_cmd(config.scripts .. "utils/notifySend battery"))
-- OCR Tools
hl.bind(config.ctrl_alt_mod .. " + S", hl.dsp.exec_cmd(config.scripts .. "utils/screenshot ocrScreenshot"))
hl.bind(config.ctrl_alt_mod .. " + D", hl.dsp.exec_cmd(config.scripts .. "utils/screenshot esOcrScreenshot"))
hl.bind(config.ctrl_alt_mod .. " + I", hl.dsp.exec_cmd(config.scripts .. "utils/screenshot korOcrScreenshot"))
-- screenshot Tools
hl.bind(config.main_ctrl_mod .. " + A", hl.dsp.exec_cmd(config.scripts .. "utils/screenshot saveScreenshot"))
hl.bind(config.ctrl_alt_mod .. " + A", hl.dsp.exec_cmd(config.scripts .. "utils/screenshot screenshot"))

-- Media
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind(config.main_mod .. " + F9", hl.dsp.exec_cmd("pw-volume change -5%; pkill -RTMIN+8 waybar"))
hl.bind(config.main_mod .. " + F10", hl.dsp.exec_cmd("pw-volume change +5%; pkill -RTMIN+8 waybar"))
-- Requires playerctl
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(config.scripts .. "utils/brightness up"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(config.scripts .. "utils/brightness down"), { repeating = true })

-- Move focus with mainMod + arrow keys
local directions = {
	left = { arrow = "left", vim = "H" },
	right = { arrow = "right", vim = "L" },
	up = { arrow = "up", vim = "K" },
	down = { arrow = "down", vim = "J" },
}
for direction, keys in pairs(directions) do
	-- Arrow keys
	hl.bind(config.main_mod .. " + " .. keys.arrow, hl.dsp.focus({ direction = direction }))
	-- Vim keys
	hl.bind(config.main_mod .. " + " .. keys.vim, hl.dsp.focus({ direction = direction }))
	-- Arrow keys
	hl.bind(config.main_mod .. " + SHIFT + " .. keys.arrow, hl.dsp.window.swap({ direction = direction }))
	-- Vim keys
	hl.bind(config.main_mod .. " + SHIFT + " .. keys.vim, hl.dsp.window.swap({ direction = direction }))
end

-- Windows
-- mouse binds
hl.bind(config.main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(config.main_ctrl_mod .. " + mouse:272", hl.dsp.window.resize(), { mouse = true })
-- hl.bind(config.main_mod .. " + W", hl.dsp.exec_cmd(config.hypr_scripts .. "auto_switch_workspace two"))
-- hl.bind(config.main_mod .. " + Q", hl.dsp.exec_cmd(config.hypr_scripts .. "auto_switch_workspace one"))
-- Useful to fullscreen multiple instances from apps like firefox in a single workspace
-- hl.bind( "CTRL ALT + T", hl.dsp.fullscreen_state({ internal = 0, client = 3, action = "toggle", }))

-- Keys to 1-9 workspaces
local workspace_keys = {
	"Q",
	"W",
	"E",
	"R",
	"A",
	"S",
	"D",
	"9",
	"0",
}
for i, key in pairs(workspace_keys) do
	-- hl.bind(config.main_mod .. " + " .. key, hl.dsp.focus({ workspace = i, on_current_monitor = true }))
	hl.bind(config.main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, on_current_monitor = true }))
end

local workspace_keys2 = {
	one = { key = "Q", name = "one" },
	two = { key = "W", name = "two" },
	three = { key = "E", name = "three" },
	four = { key = "R", name = "four" },
	five = { key = "A", name = "five" },
	six = { key = "S", name = "six" },
	seven = { key = "D", name = "seven" },
	eight = { key = "9", name = "eight" },
	nine = { key = "0", name = "nine" },
}
for i, keys in pairs(workspace_keys2) do
	hl.bind(
		config.main_mod .. " + " .. keys.key,
		hl.dsp.exec_cmd("~/.config/hypr/dots/.scripts/Hyprland/auto_switch_workspace " .. keys.name)
	)
end

-- hyprctl dispatch 'hl.dsp.focus({ workspace = "name:K:extra" })'
hl.bind(config.main_mod .. " + 3", hl.dsp.focus({ workspace = "name:K:extra" }))
hl.bind(config.main_shift_mod .. " + 3", hl.dsp.window.move({ workspace = "name:K:extra" }))
hl.bind(config.main_mod .. " + 4", hl.dsp.focus({ workspace = "name:L:extraOne" }))
hl.bind(config.main_shift_mod .. " + 4", hl.dsp.window.move({ workspace = "name:L:extraOne" }))
hl.bind(config.main_mod .. " + 5", hl.dsp.focus({ workspace = "name:M:extraTwo" }))
hl.bind(config.main_shift_mod .. " + 5", hl.dsp.window.move({ workspace = "name:M:extraTwo" }))

-- INCOMPLETE: It has to switch to the last window ONLY in current monitor
hl.bind(
	config.main_mod .. " + TAB",
	hl.dsp.exec_cmd("~/.config/hypr/dots/.scripts/Hyprland/switchLastWindow lastmonitor")
)
hl.bind(
	config.alt_mod .. " + TAB",
	hl.dsp.exec_cmd("~/.config/hypr/dots/.scripts/Hyprland/switchLastWindow lastwindow")
)
-- hl.bind(config.alt_mod .. " + TAB", hl.dsp.focus({ workspace = "previous" }))
-- hl.bind(config.main_mod .. " + TAB", function()
-- 	-- hl.dispatch(hl.dsp.focus({ workspace = i, on_current_monitor = true }))
-- 	hl.dispatch(hl.dsp.focus({ monitor = "-1" }))
-- 	hl.dispatch(hl.dsp.cursor.move_to_corner({ corner = 2 }))
-- end)

-- Toggle Special Workspaces
hl.bind(config.main_mod .. " + 1", hl.dsp.workspace.toggle_special("notes"))
hl.bind(config.main_shift_mod .. " + 1", hl.dsp.window.move({ workspace = "special:notes" }))
hl.bind(config.main_mod .. " + 2", hl.dsp.workspace.toggle_special("todos"))
hl.bind(config.main_shift_mod .. " + 2", hl.dsp.window.move({ workspace = "special:todos" }))
-- Move cursor to the right corner
hl.bind(config.alt_mod .. " + U", hl.dsp.cursor.move_to_corner({ corner = 2 }))
hl.bind(config.ctrl_alt_mod .. " + G", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(config.ctrl_alt_mod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(config.ctrl_alt_mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(config.main_mod .. " + P", hl.dsp.window.pin())
hl.bind(config.alt_mod .. " + F4", hl.dsp.window.close())

-- Center Window
hl.bind(config.ctrl_shift_mod .. " + F", function()
	-- hl.dispatch(hl.dsp.window.float({ action = "set" }))
	hl.dispatch(hl.dsp.window.resize({ x = 900, y = 600 }))
	hl.dispatch(hl.dsp.window.center())
end)

-- Group windows
hl.bind(config.main_mod .. "+ G", hl.dsp.group.toggle())
hl.bind(config.main_mod .. "+ SPACE", hl.dsp.group.next())
hl.bind(config.main_shift_mod .. "+ SPACE", hl.dsp.group.prev())
hl.bind(config.main_mod .. "+ T", hl.dsp.group.lock_active())
