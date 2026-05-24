local config = {}

config.color1 = "5F5F5F"
config.color2 = "151515"
config.color3 = "ff0E15"

-- Hyprbar Colors
config.hyprbar_color = "242424"
config.focused_hyprbar_color = "1E1A1A"
config.hyprbar_color1 = "b54752"
config.hyprbar_color2 = "c4a368"
config.hyprbar_color3 = "6bc76b"

-- Hyprland border colors
config.external_monitor = "HDMI-A-1"
config.laptop_monitor = "eDP-1"
config.special_workspace1 = "notes"
config.special_workspace2 = "todos"

-- Workspaces
config.workspace1 = 1
config.workspace2 = 2
config.workspace3 = 3
config.workspace4 = 4
config.workspace5 = 5
config.workspace6 = 6
config.workspace7 = 7
config.workspace8 = 8
config.workspace9 = 9

-- Directories
config.dots = "~/.config/hypr/dots/"
config.scripts = config.dots .. ".scripts/"
config.personal_files = "~/Home/Scripts/"
config.hypr_scripts = config.scripts .. "Hyprland/"

-- Keybinds
config.main_mod = "SUPER"
config.alt_mod = "ALT"
config.main_ctrl_mod = "SUPER + CTRL"
config.main_shift_mod = "SUPER + SHIFT"
config.ctrl_alt_mod = "CTRL + ALT"
config.ctrl_shift_mod = "CTRL + SHIFT"

-- Default Applications
config.launcher_theme = "spotlight-dark"
config.terminal = "kitty"
config.browser = "zen-browser"
config.emoji_picker = "smile"

return config
