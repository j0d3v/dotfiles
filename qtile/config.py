from libqtile import bar, layout, hook, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
import subprocess
import os

mod = "mod4"
terminal = "kitty"


@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser("~")
    subprocess.call([home + "/.config/qtile/autostart.sh"])


def load_wal_colors(cache_path="~/.cache/wal/colors"):
    cache = os.path.expanduser(cache_path)
    default_colors = [
        "#282828",  # bg
        "#cc241d",  # red
        "#98971a",  # green
        "#d79921",  # yellow
        "#458588",  # blue
        "#b16286",  # magenta
        "#689d6a",  # cyan
        "#a89984",  # fg
        "#ffffff",  # white fallback
    ]

    colors = []
    try:
        with open(cache, "r") as file:
            for _ in range(8):
                colors.append(file.readline().strip())
        colors.append("#ffffff")
    except FileNotFoundError:
        colors = default_colors

    return {
        "bg": colors[0],
        "fg": colors[7],
        "sel_bg": colors[1],
        "sel_fg": colors[5],
        "urgent_bg": colors[3],
        "urgent_fg": colors[5],
        "border_focus": colors[6],
        "border_normal": colors[0],
    }


colors = load_wal_colors()

keys = [
    Key([mod], "left", lazy.layout.left()),
    Key([mod], "right", lazy.layout.right()),
    Key([mod], "down", lazy.layout.down()),
    Key([mod], "up", lazy.layout.up()),
    Key([mod], "space", lazy.layout.next()),
    Key([mod, "shift"], "left", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "right", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "down", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "up", lazy.layout.shuffle_up()),
    Key([mod, "control"], "left", lazy.layout.grow_left()),
    Key([mod, "control"], "right", lazy.layout.grow_right()),
    Key([mod, "control"], "down", lazy.layout.grow_down()),
    Key([mod, "control"], "up", lazy.layout.grow_up()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "c", lazy.window.kill()),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "z", lazy.window.toggle_floating()),
    Key([mod, "shift"], "r", lazy.reload_config()),
    Key([mod, "shift"], "q", lazy.shutdown()),
    Key([mod], "r", lazy.spawn("rofi -show drun")),
    Key([mod], "s", lazy.spawn("rofi -show window")),
    Key([mod], "d", lazy.spawn("pcmanfm")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer -i 1")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer -d 1")),
    Key([], "XF86AudioMute", lazy.spawn("pamixer -t")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 2%-")),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set 2%+")),
]

group_data = [
    ("ampersand", ""),
    ("eacute", ""),
    ("quotedbl", ""),
    ("apostrophe", ""),
    ("parenleft", ""),
    ("minus", ""),
    ("egrave", ""),
    ("underscore", ""),
    ("ccedilla", ""),
    ("agrave", ""),
]

groups = [Group(name, layout="monadtall", label=label)
          for name, label in group_data]
for g in groups:
    keys += [
        Key([mod], g.name, lazy.group[g.name].toscreen()),
        Key([mod, "shift"], g.name, lazy.window.togroup(g.name)),
    ]

layout_theme = {
    "border_width": 3,
    "margin": 4,
    "border_focus": colors["border_focus"],
    "border_normal": colors["border_normal"],
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Tile(**layout_theme),
    layout.Max(**layout_theme),
]

widget_defaults = dict(
    font="JetBrainsMono Nerd Fonts",
    fontsize=12,
    padding=6,
    background=colors["bg"],
    foreground=colors["fg"],
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper="~/.config/qtile/wallpapers/sunset_mountain.jpg",
        wallpaper_mode="fill",
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(scale=0.7),
                widget.Sep(
                    linewidth=1,
                    padding=10,
                    foreground=colors["sel_bg"],
                ),
                widget.GroupBox(
                    fontsize=14,
                    margin_y=3,
                    margin_x=5,
                    padding_y=5,
                    padding_x=8,
                    borderwidth=2,
                    active=colors["fg"],
                    inactive=colors["sel_bg"],
                    this_current_screen_border=colors["sel_fg"],
                    highlight_method="line",
                    rounded=False,
                ),
                widget.WindowName(max_chars=30, **widget_defaults),
                widget.Systray(background=colors["bg"], padding=5),
                widget.Sep(
                    linewidth=1,
                    padding=10,
                    foreground=colors["sel_bg"],
                ),
                widget.ThermalSensor(
                    foreground=colors["sel_bg"],
                ),
                widget.Sep(
                    linewidth=1,
                    padding=10,
                    foreground=colors["sel_bg"],
                ),
                widget.Battery(
                    foreground=colors["fg"],
                    full_char="󱟢",
                    charge_char="󰂊",
                    discharge_char="󱟞 ",
                    empty_char="󰂃 ",
                    format="{char} {percent:2.0%}",
                    padding=8,
                ),
                widget.Sep(
                    linewidth=1,
                    padding=10,
                    foreground=colors["sel_bg"],
                ),
                widget.Volume(
                    foreground=colors["fg"],
                    padding=8,
                    get_volume_command="pamixer --get-volume-human",
                    check_mute_command="pamixer --get-mute",
                    check_mute_string="true",
                    volume_down_command="pamixer -d 1",
                    volume_up_command="pamixer -i 1",
                    mute_command="pamixer -t",
                    fmt='  {}',
                ),
                widget.Sep(
                    linewidth=1,
                    padding=10,
                    foreground=colors["sel_bg"],
                ),
                widget.Clock(format="%Y-%m-%d [%H:%M]", **widget_defaults),
                widget.Sep(
                    linewidth=1,
                    padding=10,
                    foreground=colors["sel_bg"],
                ),
                widget.QuickExit(
                    default_text="⏻",
                    countdown_format="{}",
                    background=colors["urgent_bg"],
                    foreground=colors["urgent_fg"],
                    padding=5,
                ),
            ],
            28,
            border_width=[0, 0, 2, 0],
            border_color=[colors["border_normal"]] *
            3 + [colors["border_focus"]],
        ),
    ),
]

mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
    ]
)

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wl_xcursor_theme = "bloom"
wl_xcursor_size = 24
wmname = "LG3D"
