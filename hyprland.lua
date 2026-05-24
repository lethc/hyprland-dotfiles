local config = require("config.variable")

hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,
		-- gaps_in=8
		-- gaps_out=15
		border_size = 1,

		-- Dark theme
		col = {
			active_border = {
				colors = {
					"rgba(" .. config.color1 .. "FF)",
				},
				-- For gradient colours
				-- colors = {
				--     "rgba(" .. COLOR1 .. "ee)", "rgba(" .. COLOR2 .. "ee)"
				-- },
				-- angle = 45
			},
			inactive_border = {
				colors = {
					"rgba(" .. config.color2 .. "FF)",
				},
			},
			nogroup_border = {
				colors = {
					"rgba(" .. config.color3 .. "19)",
				},
			},
		},
		resize_on_border = true,
		hover_icon_on_border = false,
		no_focus_fallback = true, -- ?
		layout = "scrolling",
		-- layout = "dwindle",
		-- Snap Configuration for floating windows
		snap = {
			enabled = true,
			window_gap = 10,
			monitor_gap = 10,
			border_overlap = false,
			respect_gaps = false,
		},
	},
	input = {
		kb_layout = "es",
		kb_variant = "",
		kb_model = "",
		kb_options = "grp:alt_shift_toggle",
		kb_rules = "",
		follow_mouse = 2, -- default 1
		focus_on_close = 1,
		float_switch_override_focus = 0,
		mouse_refocus = false,
		-- infamous xset r rate 200 35; ?
		-- repeat_rate = 35,
		-- repeat_delay = 200,

		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
			scroll_factor = 1,
			tap_and_drag = true,
		},
	},
	cursor = {
		-- Not keep the cursor in the center of the screen
		no_warps = true,
		default_monitor = config.external_monitor,
	},
	gestures = {
		-- workspace_swipe = yes,
		-- workspace_swipe_fingers = 3,
		workspace_swipe_distance = 1200,
		workspace_swipe_cancel_ratio = 0.2,
		workspace_swipe_min_speed_to_force = 5,
		workspace_swipe_create_new = false,
		workspace_swipe_forever = false,
		workspace_swipe_invert = false,
		workspace_swipe_direction_lock = true,
	},
	decoration = {
		rounding = 20,
		rounding_power = 2,
		dim_inactive = false, -- Dim Inactive
		dim_strength = 0.3,
		dim_special = 0.2,
		dim_around = 0.4,

		shadow = {
			enabled = true,
			range = 40,
			render_power = 2,
			-- ignore_window = true,
			offset = { 0, 4 },
			-- colors = {
			-- 	"rgba(" .. "1a1a1a" .. "ee)",
			-- },
			color = 0x55000000,
			scale = 1.0,
		},

		blur = {
			enabled = true,
			size = 5,
			passes = 4,
			new_optimizations = false,
			noise = 0,
			popups = true,
			ignore_opacity = true,
		},
	},
	group = {
		auto_group = true,
		col = {
			border_active = 0xff434343,
			border_inactive = 0xff3F3F3F,
			border_locked_active = 0xffEBFF71,
			border_locked_inactive = 0xff00D787,
		},
		groupbar = {
			enabled = true,
			render_titles = false,
			height = 14,
			indicator_height = 2,
			priority = 3,
			font_size = 10,
			gradients = false,
			text_color = 0xffffffff,
			scrolling = true,
			col = {
				inactive = 0xff232A2E,
				active = 0xffF38BA8,
				locked_inactive = 0xff232A2E,
				locked_active = 0xffFF0033,
			},
			gaps_in = 1,
			gaps_out = 0,
		},
	},
	binds = {
		allow_workspace_cycles = true,
		drag_threshold = 10, -- Fire a drag event only after dragging for more than 10px
	},
	misc = {
		mouse_move_focuses_monitor = false,
		disable_hyprland_logo = true,
		animate_manual_resizes = true,
		enable_swallow = false,
		focus_on_activate = true,
	},
	dwindle = {
		force_split = 0,
		preserve_split = true,
		smart_split = false,
	},
	master = {
		new_status = "slave",
		new_on_top = true,
		mfact = 0.70,
		orientation = "left",
		smart_resizing = true,
		drop_at_cursor = false,
	},
	scrolling = {
		column_width = 0.9,
	},
	-- XWayland currently looks pixelated on HiDPI screens, due to Xorg’s inability to scale.
	-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/XWayland/#hidpi-xwayland
	xwayland = {
		force_zero_scaling = true,
	},
	ecosystem = {
		no_update_news = true,
	},
})

-- ENVIRONMENT VARIABLES
require("config.env")
-- MONITOR
require("config.monitor")
-- ANIMATIONS
require("config.animation")
-- AUTOSTART
require("config.autostart")
-- LAYER RULES
require("config.layer_rule")
-- WINDOW RULES
require("config.window_rule")
-- KEYBINDS
require("config.keybind")
-- WORKSPACES
require("config.workspace")
-- PLUGINS
require("config.plugin.bar")
