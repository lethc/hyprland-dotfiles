local config = require("config.variable")

-- PLUGINS
hl.config({
	--  plugin = {
	--    hyprbars = {
	--        bar_color = "rgba(42455cdd)",
	--
	--        ["col.text"] = "rgb(cfb4d1)",
	--
	-- bar_height = 40,
	-- bar_padding = 14,
	-- bar_precedence_over_border = true,
	--
	--        bar_text_size = 16,
	--        bar_text_font = "JetBrainsMonoNerdFont",
	--
	-- bar_buttons_alignment = "left",
	-- bar_button_padding = 10
	--    }
	--  }

	plugin = {
		hyprbars = {
			bar_height = 40,
			bar_text_size = 0,
			bar_text_font = "Maple Mono NF CN",
			bar_button_padding = 12,
			bar_padding = 10,
			bar_part_of_window = true,
			bar_precedence_over_border = true,
			bar_buttons_alignment = "Maple Mono NF CN",

			bar_color = "rgb(" .. config.hyprbar_color .. ")",
			-- bar_blur = false,
			col = {
				text = "rgb(d0cdc8)",
			},
			icon_on_hover = false,
		},
	},
})

if hl.plugin and hl.plugin.hyprbars then
	hl.plugin.hyprbars.add_button({
		bg_color = "rgb(" .. config.focused_hyprbar_color .. ")",
		fg_color = "rgb(" .. config.hyprbar_color1 .. ")",
		size = 28,
		icon = "󱎘",
		action = "hyprctl dispatch 'hl.dsp.window.close()'",
	})

	hl.plugin.hyprbars.add_button({
		bg_color = "rgb(" .. config.focused_hyprbar_color .. ")",
		fg_color = "rgb(" .. config.hyprbar_color2 .. ")",
		size = 28,
		icon = "󰹟",
		action = "hyprctl dispatch 'hl.dsp.window.float({ action = \"toggle\" })'",
	})

	hl.plugin.hyprbars.add_button({
		bg_color = "rgb(" .. config.focused_hyprbar_color .. ")",
		fg_color = "rgb(" .. config.hyprbar_color3 .. ")",
		size = 28,
		icon = "─",
		-- action = 'hyprctl dispatch \'hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" })\'',
		action = 'hyprctl dispatch \'hl.dsp.window.pin()\'',

	})
end

-- Disable bar on Tiled
hl.window_rule({
	match = { float = false },
	["hyprbars:no_bar"] = true,
})

-- Change focused Bar Color
hl.window_rule({
	match = { focus = true },
	-- ["hyprbars:bar_color"] = "rgba(" .. focused_HYPRBAR_COLOR .. "dd)",
	["hyprbars:bar_color"] = "rgb(" .. config.focused_hyprbar_color .. ")",
})
-- Show bars in dolphin despite being tiled
hl.window_rule({
	match = {
		class = "^(org.kde.dolphin)$",
	},
	["hyprbars:no_bar"] = false,
})

hl.window_rule({
	match = {
		title = [[^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$]],
	},
	["hyprbars:no_bar"] = true,
})

-- Disable hypr in GTK apps

hl.window_rule({
	match = {
		class = "^(com.vixalien.sticky)$",
	},
	["hyprbars:no_bar"] = true,
})

hl.window_rule({
	match = {
		class = "^(com.vixalien.sticky|net.nokyan.Resources|ca.desrt.dconf-editor|io.github.seadve.Kooha|com.github.phase1geo.minder)$",
	},
	["hyprbars:no_bar"] = true,
})

hl.window_rule({
	match = {
		class = "^(org.gnome.*)$",
	},
	["hyprbars:no_bar"] = true,
})

hl.window_rule({
	match = {
		class = "^(ticktick|jetbrains-studio|discord|dev.zed.Zed|blueberry.py|mpv|md.obsidian.Obsidian|zennotes|Xmind|code|it.mijorus.smile|zen)$",
	},
	["hyprbars:no_bar"] = true,
})

hl.window_rule({
	match = {
		class = "^(Opera GX|vivaldi-stable|google-chrome|brave-origin)$",
	},
	["hyprbars:no_bar"] = true,
})
