-- LAYER RULES
hl.layer_rule({
	match = { namespace = "vicinae" },
	blur = true,
	ignore_alpha = 0,
})
hl.layer_rule({
	match = { namespace = "gtk-layer-shell" },
	blur = true,
	no_anim = true,
})
hl.layer_rule({
	blur = true,
	match = { namespace = "rofi" },
	ignore_alpha = 0.2,
	no_anim = true,
})
hl.layer_rule({
	match = { namespace = "swaync" },
	blur = true,
})
hl.layer_rule({
	match = { namespace = "swaync-control-center" },
	blur = true,
	no_anim = true,
	ignore_alpha = 0.5,
})
hl.layer_rule({
	match = { namespace = "swaync-notification-window" },
	blur = true,
	no_anim = true,
	ignore_alpha = 0.5,
})
hl.layer_rule({
	match = { namespace = "waybar" },
	blur = true,
    blur_popups = true,
	no_anim = true,
	ignore_alpha = 0.2,
})

-- noctalia shell
hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "noctalia-background-.*$",
	},
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})
