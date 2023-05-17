from typing import List  # noqa: F401
import os, subprocess
from libqtile import hook
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, EzKey as EK
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile import qtile

mod = "mod4"
browser = "brave"
browser_private = "brave --incognito"
browser_tor = "brave --tor"
file_manager = "alacritty -e lf"
wallpaper_manager = "kitty -e ranger"
terminal = "alacritty"
terminal2 = "alacritty --config-file=/home/kshitij/.config/alacritty/alacritty-nontmux.yml"
monitor = "alacritty -e bpytop"
notetaker = "/home/kshitij/.scripts/note-taker"
notetopdf = "/home/kshitij/.scripts/note-to-pdf"

@hook.subscribe.startup_once
def autostart():
	home = os.path.expanduser("~/.scripts/autostart")
	subprocess.call([home])

keys = [
    # Switch between windows
    EK("M-h", lazy.layout.left(), desc="Move focus to left"),
    EK("M-l", lazy.layout.right(), desc="Move focus to right"),
    EK("M-j", lazy.layout.down(), desc="Move focus down"),
    EK("M-k", lazy.layout.up(), desc="Move focus up"),
    EK("M-<Tab>", lazy.layout.next(), desc="Move window focus to other window"),
    EK("M-z", lazy.window.toggle_fullscreen(), desc="Toggle Fullscreen"),
    
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    EK("M-S-h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    EK("M-S-l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    EK("M-S-j", lazy.layout.shuffle_down(), desc="Move window down"),
    EK("M-S-k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    EK("M-C-h", lazy.layout.grow_left(), desc="Grow window to the left"),
    EK("M-C-l", lazy.layout.grow_right(), desc="Grow window to the right"),
    EK("M-C-j", lazy.layout.grow_down(), desc="Grow window down"),
    EK("M-C-k", lazy.layout.grow_up(), desc="Grow window up"),
    EK("M-n", lazy.layout.normalize(), desc="Reset all window sizes"),
    EK("M-t", lazy.window.toggle_floating(), desc="Toggle Floating State"),

    # Terminal
    EK("M-<Return>", lazy.spawn(terminal), desc="Launch terminal"),
    EK("M-S-<Return>", lazy.spawn(terminal2), desc="Launch terminal"),

    # Placement and stuff
    EK("M-<space>", lazy.next_layout(), desc="Toggle between layouts"),
    EK("M-n", lazy.spawn(notetaker), desc="Note Taker"),
    EK("M-S-n", lazy.spawn(notetopdf), desc="Note Taker to pdf"),

    # Window Management
    EK("M-q", lazy.window.kill(), desc="Kill focused window"),
    EK("M-<F5>", lazy.restart(), desc="Restart Qtile"),
    EK("M-S-q", lazy.shutdown(), desc="Shutdown Qtile"),
    EK("M-r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    # my shortcuts
    EK("M-w", lazy.spawn(wallpaper_manager)),
    EK("M-e", lazy.spawn(file_manager)),
    EK("M-f", lazy.spawn(browser)),
    EK("M-b", lazy.spawn("blender")),
    EK("M-S-f", lazy.spawn(browser_private)),
    EK("M-d", lazy.spawn("telegram-desktop")),
    EK("M-C-S-f", lazy.spawn(browser_tor)),
    EK("M-s", lazy.spawn("scripter")),
    EK("M-h", lazy.spawn(monitor)),
    EK("M-i", lazy.spawn("alacritty -e /home/kshitij/.scripts/cht.sh")),

    # Music Shortcuts MPD
    # EK("M-S-m", lazy.spawn("mpc toggle")),
    # EK("M-<period>", lazy.spawn("mpc next")),
    # EK("M-<comma>", lazy.spawn("mpc prev")),
    # EK("M-S-<period>", lazy.spawn("mpc seek +5")),
    # EK("M-S-<comma>", lazy.spawn("mpc seek -5")),

    # Music Shortcuts for Spotify/Youtube
    EK("M-S-m", lazy.spawn("playerctl play-pause")),
    EK("M-<period>", lazy.spawn("playerctl next")),
    EK("M-<comma>", lazy.spawn("playerctl previous")),
    EK("M-S-<period>", lazy.spawn("playerctl position 5+")),
    EK("M-S-<comma>", lazy.spawn("playerctl position 5-")),
    EK("M-<Right>", lazy.spawn("playerctl volume 0.05%+")),
    EK("M-<Left>", lazy.spawn("playerctl volume 0.05%-")),

    # powershortcuts
    EK("M-S-x", lazy.spawn("systemctl poweroff")),
    EK("M-S-z", lazy.spawn("systemctl reboot")),
    EK("M-S-s", lazy.spawn("systemctl suspend")),
    EK("M-r", lazy.spawn("redshift -O 5000")),
    EK("M-S-r", lazy.spawn("redshift -x")),

    # rofi launcher
    EK("C-<space>",  lazy.spawn("rofi -show-icons -show drun -display-drun \"\" -font \"FiraCode Nerd Font 12\"")),
    EK("M-S-p",  lazy.spawn("rofi-pass --last-used")),
    
    # Screenshot
    EK("<Print>", lazy.spawn("flameshot full")),
    EK("S-<Print>", lazy.spawn("flameshot gui")),
    EK("M-S-t", lazy.spawn("ocr")),
    EK("M-c", lazy.spawn("convert-to-qr")),

    # audio and brightness
    EK("M-S-<Right>", lazy.spawn("amixer set Master 2%+ unmute")),
    EK("M-S-<Left>", lazy.spawn("amixer set Master 2%- unmute")),
    EK("M-S-<Up>", lazy.spawn("lux -a 5%")),
    EK("M-S-<Down>", lazy.spawn("lux -s 5%")),

    # Function keys
    EK("<F3>", lazy.spawn("systemctl suspend")),
    EK("<F6>", lazy.spawn("amixer set Master 5%- unmute")),
    EK("<F7>", lazy.spawn("amixer set Master 5%+ unmute")),
    # EK("<F9>", lazy.spawn("lux -s 5%")),
    # EK("<F10>", lazy.spawn("lux -a 5%")),
]

# Dont care for icons no more :)
groups = [
    Group("1", matches=[Match(wm_class=["brave-browser", "Brave-browser"])]),
    Group("2", matches=[Match(wm_class=["Alacritty", "Alacritty"])]),
    Group("3"),
    Group("4"),
    Group("5"),
    Group("6", matches=[Match(wm_class=["spotify", "Spotify"])]),
    Group("7"),
    Group("8"),
    Group("9"),
]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])

layouts = [
    layout.MonadTall(
        fontsize = 10,
        margin = 8,
        border_width = 1,
        name = 'Xmonad Tall',
        border_focus = 'C74045',
        single_border_width = 0,
    ),
    # layout.MonadWide(
    #   fontsize = 10,
    #   margin = 8,
    #     name = 'Xmonad Wide'
    # ),
    layout.Bsp(
        active_bg = 'b00000',
        margin = 8,
        fontsize = 14,
        name = 'Bsp',
        font = 'monospace',
    ),
    layout.TreeTab(
        active_bg = 'b00000',
        margin = 8,
        fontsize = 14,
        name = 'TreeTab',
        sections = ['FIRST'],
        panel_width = 150,
        place_right = True,
        bg_color = '000000aa',
        font = 'monospace',
        padding_left = 0,
    ),
    # layout.Floating(border_normal='C74045',
        # single_border_width = 0,
    # ),
    layout.RatioTile(),
]

screens = []

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(
    border_width=0,
    border_focus="#C74045",
    border_normal="#000000",
    float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='yad'),  # gitk
    Match(wm_class='executor-vim'),  # gitk
    Match(wm_class='chtsh'),  # gitk
    Match(wm_class='notes'),  # gitk
    Match(wm_class='chwall'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(wm_class='scrcpy'),  # GPG key password entry
    Match(wm_class='Godot'),  # Godot window floating
    Match(wm_class='RayTracing'),  # Any Window with RayTracing as title
    Match(wm_class="GLFW-Application"),  # Any Window with RayTracing as title
    Match(wm_class="python3.10"),  # Any Window with RayTracing as title
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "mutter"
