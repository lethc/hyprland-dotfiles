import { opt, mkOptions } from 'lib/option'
import { distro } from 'lib/variables'
import { icon } from 'lib/utils'
import icons from 'lib/icons'

const options = mkOptions(OPTIONS, {
    autotheme: opt(true),

    wallpaper: {
        resolution: opt<import('service/wallpaper').Resolution>(1920),
        market: opt<import('service/wallpaper').Market>('random'),
    },

    theme: {
        dark: {
            primary: {
                bg: opt('#AFAFAF'),
                fg: opt('#171717'),
            },
            error: {
                bg: opt('#b46958'),
                fg: opt('#171717'),
            },
            bg: opt('#171717'),
            fg: opt('#cac9dd'),
            widget: opt('#cac9dd'),
            border: opt('#cac9dd'),
        },
        light: {
            primary: {
                bg: opt('#f4b358'),
                fg: opt('#EFF1F3'),
            },
            error: {
                bg: opt('#F89A9C'),
                fg: opt('#EFF1F3'),
            },
            bg: opt('#FFEBD2'),
            fg: opt('#515152'),
            widget: opt('#515152'),
            border: opt('#515152'),
        },

        blur: opt(0),
        scheme: opt<'dark' | 'light'>('dark'),
        widget: { opacity: opt(94) },
        border: {
            width: opt(1),
            opacity: opt(96),
        },

        shadows: opt(true),
        padding: opt(7),
        spacing: opt(5),
        radius: opt(15),
    },

    transition: opt(200),

    font: {
        size: opt(12),
        name: opt('Noto Sans Regular'),
    },

    bar: {
        flatButtons: opt(true),
        position: opt<'top' | 'bottom'>('bottom'),
        corners: opt(50),
        transparent: opt(false),
        layout: {
            start: opt<Array<import('widget/bar/Bar').BarWidget>>([
                'launcher',
                 "taskbar",
                'expander',
                'media',
            ]),
            center: opt<Array<import('widget/bar/Bar').BarWidget>>([
                'workspaces',
            ]),
            end: opt<Array<import('widget/bar/Bar').BarWidget>>([
                'messages',
                'expander',
                'systray',
                'battery',
                // "colorpicker",
                'screenrecord',
                'system',
                'date',
                'powermenu',
            ]),
        },
        launcher: {
            icon: {
                colored: opt(true),
                icon: opt(icon(icons.ui.search, distro.logo)),
            },
            label: {
                colored: opt(false),
                label: opt('  Applications'),
            },
            action: opt(() => App.toggleWindow('launcher')),
        },
        date: {
            format: opt('%a %d %b - %H:%M:%S'),
            action: opt(() => App.toggleWindow('datemenu')),
        },
        battery: {
            bar: opt<'hidden' | 'regular' | 'whole'>('hidden'),
            charging: opt('#cac9dd'),
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
            exclusive: opt(false),
        },
        messages: {
            action: opt(() => App.toggleWindow('datemenu')),
        },
        systray: {
            ignore: opt(['KDE Connect Indicator', 'spotify-client']),
        },
        media: {
            monochrome: opt(true),
            preferred: opt('spotify'),
            direction: opt<'left' | 'right'>('left'),
            format: opt('{artists} - {title}'),
            length: opt(40),
        },
        powermenu: {
            monochrome: opt(true),
            action: opt(() => App.toggleWindow('powermenu')),
        },
    },

    launcher: {
        width: opt(0),
        margin: opt(80),
        nix: {
            pkgs: opt('nixpkgs/nixos-unstable'),
            max: opt(8),
        },
        sh: {
            max: opt(16),
        },
        apps: {
            iconSize: opt(55),
            max: opt(6),
            favorites: opt([
                [
                    'firefox',
                    'calibre-gui',
                    'naver-whale',
                    'org.kde.dolphin',
                    'obsidian',
                    'com.github.xournalpp.xournalpp',
                    'zen',
                    'superProductivity',
                ],
            ]),
        },
    },

    overview: {
        scale: opt(6),
        workspaces: opt(10),
        monochromeIcon: opt(false),
    },

    powermenu: {
        sleep: opt('systemctl suspend'),
        reboot: opt('systemctl reboot'),
        logout: opt('pkill Hyprland'),
        shutdown: opt('shutdown now'),
        layout: opt<'line' | 'box'>('line'),
        labels: opt(true),
    },

    quicksettings: {
        avatar: {
            image: opt(`/var/lib/AccountsService/icons/${Utils.USER}`),
            size: opt(70),
        },
        width: opt(380),
        position: opt<'left' | 'center' | 'right'>('right'),
        networkSettings: opt('gtk-launch gnome-control-center'),
        media: {
            monochromeIcon: opt(true),
            coverSize: opt(100),
        },
    },

    datemenu: {
        position: opt<'left' | 'center' | 'right'>('center'),
        weather: {
            interval: opt(60_000),
            unit: opt<'metric' | 'imperial' | 'standard'>('metric'),
            key: opt<string>(
                JSON.parse(Utils.readFile(`${App.configDir}/.weather`) || '{}')
                    ?.key || '',
            ),
            cities: opt<Array<number>>(
                JSON.parse(Utils.readFile(`${App.configDir}/.weather`) || '{}')
                    ?.cities || [],
            ),
        },
    },

    osd: {
        progress: {
            vertical: opt(true),
            pack: {
                h: opt<'start' | 'center' | 'end'>('end'),
                v: opt<'start' | 'center' | 'end'>('center'),
            },
        },
        microphone: {
            pack: {
                h: opt<'start' | 'center' | 'end'>('center'),
                v: opt<'start' | 'center' | 'end'>('end'),
            },
        },
    },

    notifications: {
        position: opt<Array<'top' | 'bottom' | 'left' | 'right'>>([
            'top',
            'right',
        ]),
        blacklist: opt(['Spotify']),
        width: opt(440),
    },

    hyprland: {
        gaps: opt(2.4),
        inactiveBorder: opt("333333ff"),
        gapsWhenOnly: opt(true),
    },
})

globalThis['options'] = options
export default options
