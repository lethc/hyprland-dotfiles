import { type BarWidget } from "widget/bar/Bar"
import { opt, mkOptions } from "lib/option"
import { distro } from "lib/variables"
import { icon } from "lib/utils"
import icons from "lib/icons"

const options = mkOptions(OPTIONS, {
    autotheme: opt(false),

    wallpaper: opt(`/home/${USER}/.config/background`, { persistent: true }),

    theme: {
        dark: {
            primary: {
                bg: opt("#F4BF75"),
                fg: opt("#171717"),
            },
            error: {
                bg: opt("#b46958"),
                fg: opt("#171717"),
            },
            bg: opt("#171717"),
            fg: opt("#E1E1E1"),
            widget: opt("#E1E1E1"),
            border: opt("#E1E1E1"),
        },
        light: {
            primary: {
                bg: opt("#f4b358"),
                fg: opt("#EFF1F3"),
            },
            error: {
                bg: opt("#F89A9C"),
                fg: opt("#EFF1F3"),
            },
            bg: opt("#FFEBD2"),
            fg: opt("#515152"),
            widget: opt("#515152"),
            border: opt("#515152"),
        },

        blur: opt(0),
        scheme: opt<"dark" | "light">("dark"),
        widget: { opacity: opt(94) },
        border: {
            width: opt(1),
            opacity: opt(96),
        },

        shadows: opt(true),
        padding: opt(7),
        spacing: opt(6),
        radius: opt(11),
    },

    transition: opt(200),

    font: {
        size: opt(12),
        name: opt("Ubuntu Nerd Font"),
    },

    bar: {
        flatButtons: opt(true),
        position: opt<"top" | "bottom">("top"),
        corners: opt(true),
        layout: {
            start: opt<BarWidget[]>([
                "launcher",
                // "taskbar",
                "expander",
                "media",
            ]),
            center: opt<BarWidget[]>([
                "workspaces",
            ]),
            end: opt<BarWidget[]>([
                "messages",
                "expander",
                "systray",
                "battery",
                // "colorpicker",
                "screenrecord",
                "system",
                "date",
                "powermenu",
            ]),
        },
        launcher: {
            icon: {
                colored: opt(true),
                icon: opt(icon(distro, icons.ui.search)),
            },
            label: {
                colored: opt(false),
                label: opt("  Applications"),
            },
            action: opt(() => App.toggleWindow("applauncher")),
        },
        date: {
            format: opt("%a %d %b - %H:%M"),
            action: opt(() => App.toggleWindow("datemenu")),
        },
        battery: {
            bar: opt<"hidden" | "regular" | "whole">("hidden"),
            charging: opt("#F4BF75"),
            percentage: opt(true),
            blocks: opt(7),
            width: opt(50),
            low: opt(30),
        },
        workspaces: {
            workspaces: opt(10),
        },
        taskbar: {
            iconSize: opt(0),
            monochrome: opt(false),
            exclusive: opt(true),
        },
        messages: {
            action: opt(() => App.toggleWindow("datemenu")),
        },
        systray: {
            ignore: opt([
                "KDE Connect Indicator",
                "spotify-client",
            ]),
        },
        media: {
            monochrome: opt(true),
            preferred: opt("spotify"),
            direction: opt<"left" | "right">("left"),
            length: opt(40),
        },
        powermenu: {
            monochrome: opt(false),
            action: opt(() => App.toggleWindow("powermenu")),
        },
    },

    applauncher: {
        iconSize: opt(55),
        width: opt(0),
        margin: opt(80),
        maxItem: opt(6),
        favorites: opt([
            [
                "firefox",
                "naver-whale",
                "org.gnome.Nautilus",
                "obsidian",
                "com.github.xournalpp.xournalpp",
            ],
        ]),
    },

    overview: {
        scale: opt(7),
        workspaces: opt(7),
        monochromeIcon: opt(false),
    },

    powermenu: {
        sleep: opt("systemctl suspend"),
        reboot: opt("systemctl reboot"),
        logout: opt("pkill Hyprland"),
        shutdown: opt("shutdown now"),
        layout: opt<"line" | "box">("line"),
        labels: opt(true),
    },

    quicksettings: {
        avatar: {
            image: opt(`/var/lib/AccountsService/icons/${Utils.USER}`),
            size: opt(70),
        },
        width: opt(380),
        position: opt<"left" | "center" | "right">("right"),
        networkSettings: opt("gtk-launch gnome-control-center"),
        media: {
            monochromeIcon: opt(true),
            coverSize: opt(100),
        },
    },

    datemenu: {
        position: opt<"left" | "center" | "right">("center"),
    },

    osd: {
        progress: {
            vertical: opt(true),
            pack: {
                h: opt<"start" | "center" | "end">("end"),
                v: opt<"start" | "center" | "end">("center"),
            },
        },
        microphone: {
            pack: {
                h: opt<"start" | "center" | "end">("center"),
                v: opt<"start" | "center" | "end">("end"),
            },
        },
    },

    notifications: {
        position: opt<Array<"top" | "bottom" | "left" | "right">>(["top", "right"]),
        blacklist: opt(["Spotify"]),
        width: opt(440),
    },

    hyprland: {
        gaps: opt(2.4),
        inactiveBorder: opt("333333ff"),
    },
})

globalThis["options"] = options
export default options
