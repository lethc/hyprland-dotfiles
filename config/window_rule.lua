local config = require("config.variable")

-- GENERAL
-- Change the border color of semi-fullscreen windows
hl.window_rule({
	match = {
		fullscreen = true,
	},
	border_color = "rgb(FF0000) rgb(880808)",
})
-- Disable rounded corners in tiling windows, # Disable shadows in tiling windows
hl.window_rule({
	match = {
		float = false,
	},
	rounding = 0,
	no_shadow = true,
})
-- Workspaces modifications
hl.window_rule({
	match = {
		workspace = "special:notes",
	},
	rounding = 20,
})
-- Float all windows in workspace 4
-- hl.window_rule({
-- 	match = {
--         workspace = "4",
-- 	},
--     float = true,
-- })

-- Prevent idle state in fullscreen windows like video players (Youtube, etc)
hl.window_rule({
	match = {
		class = "^(.*)$",
	},
	idle_inhibit = "fullscreen",
})
hl.window_rule({
	match = {
		class = "^(zen)$",
		title = "^(.*YouTube.*)$",
	},
	idle_inhibit = "focus",
})
hl.window_rule({
	match = {
		-- Any application whose window class ends with exe. This primarily targets Wine or Proton games and Windows applications running on Linux
		class = "^(mpv|.+exe|celluloid)$",
	},
	idle_inhibit = "focus",
})
hl.window_rule({
	name = "idle-inhibit-music",
	match = { class = ".*Lollypop.*" },
	idle_inhibit = "focus",
})
hl.window_rule({
	-- name = "apply-something",
	-- border_size = 10,
	match = {
		class = "(Alacritty|kitty|foot)",
	},
	scroll_touchpad = 1.5,
	scroll_mouse = 3.0,
})
hl.window_rule({
	-- name = "apply-something",
	-- border_size = 10,
	match = {
		class = "(kitty)",
	},
    no_blur = true,
})
-- Fix Jetbrain IDEs focus/rerendering problem
hl.window_rule({
	match = {
		class = "^jetbrains-.*$",
		float = true,
		title = [[^$|^\s$|^win\d+$]],
	},
	no_initial_focus = true,
})
-- Zathura
hl.window_rule({
	match = {
		class = "^(org.pwmt.zathura)$",
	},
	opacity = "0.80 0.70",
})
-- FLOATING WINDOWS

-- size (width) (height)
-- move from (0.00, right -> 0.90, left) (0.00 down -> 0.90 top)
-- BIGGER WINDOWS
-- windowrule = match:title ^(Zen Browser.*|.*Mozilla Firefox)$, \
--                 size (monitor_w*0.9) (monitor_h*0.9), \
--                 move (monitor_w-window_w-(monitor_w*0.05)) (monitor_h-window_h-(monitor_h*0.03))

-- Floating by Title
hl.window_rule({
	match = {
		title = "^(Float|Float 2|Fella|todo|countdown)$",
	},
	float = true,
	animation = "popin",
	size = { "(monitor_w*0.6)", "(monitor_h*0.6)" },
	move = { "(monitor_w*0.20)", "(monitor_h*0.18)" },
})
hl.window_rule({
	match = {
		title = "^(Meeting Chat|fzf)$",
	},
	float = true,
})
hl.window_rule({
	match = {
		title = "^(MEGAsync)$",
	},
	float = true,
	size = { "(monitor_w*0.2)", "(monitor_h*0.5)" },
	move = { "(monitor_w*0.75)", "(monitor_h*0.42)" },
})
hl.window_rule({
	match = {
		title = [[^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$]],
	},
	float = true,
	pin = true,
	no_dim = true,
	suppress_event = "activatefocus",
	no_initial_focus = true,
	size = { "(monitor_w*0.30)", "(monitor_h*0.30)" },
	move = { "(monitor_w*0.69)", "(monitor_h*0.65)" },
})
-- hl.window_rule({ -- Also affects some dolphin pop-ups, inconvenient
-- 	match = {
-- 		title = [[^(Open.*File?|Save.*Files?|All Files|Save|File Upload|Library|Open Folder|Choose wallpaper|Choose Files|Select files|Preview|Pick a Font)(.*)$]],
-- 	},
-- 	float = true,
-- 	size = { "(monitor_w*0.6)", "(monitor_h*0.6)" },
-- 	move = { "(monitor_w*0.20)", "(monitor_h*0.15)" },
-- })

-- Floating by Class
hl.window_rule({
	match = {
		class = "^(hyprland-share-picker|org.kde.kdeconnect.daemon|nl.hjdskes.gcolor3|Waydroid|waydroid.com.metrolist.music|org.kde.keditfiletype|org.kde.gwenview|org.gnome.Loupe|org.kde.polkit-kde-authentication-agent-1)$",
	},
	float = true,
})
hl.window_rule({
	match = {
		class = "^(clipse-gui)$",
	},
	float = true,
	no_dim = true,
	animation = "popin",
	size = { "(monitor_w*0.3)", "(monitor_h*0.6)" },
	move = { "(monitor_w*0.35)", "(monitor_h*0.18)" },
})
hl.window_rule({
	match = {
		class = "^(org.pulseaudio.pavucontrol|pavucontrol-qt|nvim-wl-anywhere|deepin-editor|editor)$",
	},
	float = true,
	animation = "popin",
	size = { "(monitor_w*0.6)", "(monitor_h*0.6)" },
	move = { "(monitor_w*0.20)", "(monitor_h*0.15)" },
})
hl.window_rule({
	match = {
		class = "^(nm-connection-editor|it.mijorus.smile)$",
	},
	float = true,
	animation = "popin",
	size = { "(monitor_w*0.3)", "(monitor_h*0.3)" },
	move = { "(monitor_w*0.30)", "(monitor_h*0.30)" },
})
hl.window_rule({
	match = {
		class = "^google-chrome.$",
	},
	float = true,
	pin = true,
	no_dim = true,
	suppress_event = "activatefocus",
	no_initial_focus = true,
	animation = "popin",
	move = { "(monitor_w*0.69)", "(monitor_h*0.65)" },
})

-- DEFAULT WORKSPACE

-- Workspace by Title
-- hl.window_rule({
-- 	match = {
-- 		title = "^(?!.*(gtt|Float)).*$",
-- 	},
-- 	workspace = config.workspace3,
-- })
hl.window_rule({
	match = {
		title = "^(Video|Music)$",
	},
	workspace = config.workspace6,
})

-- Workspace by Class
hl.window_rule({
	match = {
		class = "^(Morgen)$",
	},
	workspace = "special:notes",
})
hl.window_rule({
	match = {
		class = "^(sioyek|calibre-gui)$",
	},
	workspace = config.workspace5,
})
hl.window_rule({
	match = {
		class = "^(io.bassi.Amberol|vlc|FreeTube|Waydroid|waydroid.com.metrolist.music|zoom|krita|blender|org.inkscape.Inkscape|org.kde.kdenlive)$",
	},
	workspace = config.workspace6,
})
hl.window_rule({
	match = {
		class = "^(qt6ct|qt5ct|net.nokyan.Resources|org.gnome.Solanum)$",
	},
	workspace = config.workspace7,
})
hl.window_rule({
	match = {
		class = "^(Mailspring)$",
	},
	workspace = config.workspace8,
})
hl.window_rule({
	match = {
		class = "^(org.telegram.desktop)$",
	},
	workspace = config.workspace9,
})
