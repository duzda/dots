#!/usr/bin/env python3

OFFLINE_TEXT = "Offline"
ONLINE_TEXT = "Bangers are waiting!"

import sys
import gi

gi.require_version("Playerctl", "2.0")

from gi.repository import Playerctl, GLib

def show_text(text, **kwargs):
    print(text, **(kwargs or {}))
    sys.stdout.flush()

def show_metadata(artist, title, titlelen, artistlen):
    free_space_title = max(0, titlelen - len(artist))
    free_space_artist = max(0, artistlen - len(title))
    show_text('{} - {}'.format(truncate(title, artistlen + free_space_title),
                        truncate(artist, titlelen + free_space_artist)))

def truncate(string, width):
    if len(string) > width:
        string = string[:width-3] + '...'
    return string

def on_metadata(player, metadata, manager):
    keys = metadata.keys()
    if 'xesam:artist' in keys and 'xesam:title' in keys:
        show_metadata(metadata['xesam:artist'][0], metadata['xesam:title'], 20, 30)

def init_player(name):
    # choose if you want to manage the player based on the name
    if name.name in ['Deezer']:
        running = True
        player = Playerctl.Player.new_from_name(name)
        player.connect('metadata', on_metadata, manager)
        manager.manage_player(player)
        if player.get_title() == None:
            show_text(ONLINE_TEXT)
        else:
            show_metadata(player.get_artist(), player.get_title(), 20, 30)

def on_name_appeared(manager, name):
    init_player(name)

def on_player_vanished(manager, player):
    show_text(OFFLINE_TEXT)
    running = False

if __name__ == "__main__":
    manager = Playerctl.PlayerManager()
    running = False

    show_text(OFFLINE_TEXT)

    manager.connect('name-appeared', on_name_appeared)
    manager.connect('player-vanished', on_player_vanished)

    for name in manager.props.player_names:
        init_player(name)

    main = GLib.MainLoop()
    main.run()