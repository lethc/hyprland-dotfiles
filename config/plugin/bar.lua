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
			bar_height = 31,
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
			icon_on_hover = true,
		},
	},
})

hl.plugin.hyprbars.add_button({
	bg_color = "rgb(" .. config.hyprbar_color1 .. ")",
	fg_color = "rgb(" .. config.hyprbar_color1 .. ")",
	size = 13,
	icon = "",
	action = "hyprctl dispatch 'hl.dsp.window.close()'",
})

hl.plugin.hyprbars.add_button({
	bg_color = "rgb(" .. config.hyprbar_color2 .. ")",
	fg_color = "rgb(" .. config.hyprbar_color2 .. ")",
	size = 13,
	icon = "",
	action = "hyprctl dispatch 'hl.dsp.window.float({ action = \"toggle\" })'",
})

hl.plugin.hyprbars.add_button({
	bg_color = "rgb(" .. config.hyprbar_color3 .. ")",
	fg_color = "rgb(" .. config.hyprbar_color3 .. ")",
	size = 13,
	icon = "",
	action = 'hyprctl dispatch \'hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" })\'',
})

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
