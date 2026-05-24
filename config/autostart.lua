local config = require("config.variable")

-- AUTOSTART
hl.on("hyprland.start", function()
	hl.exec_cmd("~/.config/hypr/dots/.scripts/utils/wallpaper/wallpaper")
	-- hl.exec_cmd("~/.config/hypr/dots/.scripts/utils/dynamic-wallpaper.sh")
	hl.exec_cmd("hyprpm reload -n") -- Reload hyprland plugins
	hl.exec_cmd("fcitx5 --replace -d") -- Launch fcitx5
	-- Core components (authentication, lock screen, notification daemon)
	hl.exec_cmd("dbus-update-activation-environment --all")
	hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
	hl.exec_cmd("kwalletd6")
	hl.exec_cmd("hypridle") -- detect idle time and lock screen
	-- hl.exec_cmd("waybar & hyprpaper & firefox") -- Execute waybar, hyprpaper, firefox
	-- Launch script to detect battery status
	hl.exec_cmd("~/.config/hypr/dots/.scripts/utils/notifyBatteryStatus")
	hl.exec_cmd("wl-clip-persist --clipboard regular")
	hl.exec_cmd("wl-paste --watch cliphist store")
	hl.exec_cmd("clipse -listen")
	-- hl.exec_cmd("vicinae server")
	hl.exec_cmd("sleep 1 && dbus-update-activation-environment --all")
	hl.exec_cmd("input-remapper-control --command autoload &")
	hl.exec_cmd(config.personal_files .. "automation/autostart")    
	-- GTK Theme
	hl.exec_cmd([[gsettings set org.gnome.desktop.interface cursor-theme "breeze_cursors"]])
	hl.exec_cmd([[gsettings set org.gnome.desktop.interface cursor-size "24"]])
	hl.exec_cmd([[gsettings set org.gnome.desktop.interface font-name 'Lexend Deca Regular 11']])

	hl.exec_cmd([[gsettings set org.gnome.desktop.interface gtk-theme "MacTahoe-Dark"]])
	hl.exec_cmd([[gsettings set org.gnome.desktop.interface icon-theme "SeviDDE-blue-dark"]])
	hl.exec_cmd([[(waybar &) && sleep 1 && pkill waybar && waybar &]])
	hl.exec_cmd([[tmux new -Ads main]])
end)
