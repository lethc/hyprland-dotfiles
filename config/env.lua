-- ENVIRONMENT VARIABLES
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
hl.env("WINE_VK_VULKAN_ONLY", "1")
hl.env("EDITOR", "nvim")

hl.env("GKT_THEME", "MacTahoe-Dark")
hl.env("XCURSOR_THEME", "breeze_cursors")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "breeze_cursors")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("TERMINAL", "kitty")
hl.env("EDITOR", "nvim")

-- To use dolphin file-picker in most apps by default
hl.env("GTK_USE_PORTAL", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("FZF_DEFAULT_OPTS", "--bind alt-j:down,alt-k:up,ctrl-u:preview-up,ctrl-d:preview-down")
hl.env("HYPRSHOT_DIR", "~/Pictures/Screenshots/")
hl.env("_JAVA_OPTIONS", "'-Dawt.useSystemAAFontSettings=gasp'")

-- Force all Apps to use Wayland
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("OZONE_PLATFORM", "wayland")
hl.env("XDG_SESSION_TYPE", "wayland")

-- fcitx
hl.env("XMODIFIERS", "fcitx5")
hl.env("GTK_IM_MODULE", "fcitx5")
hl.env("QT_IM_MODULE", "fcitx5")
