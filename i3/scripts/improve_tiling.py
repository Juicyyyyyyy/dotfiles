#!/usr/bin/env python3

import i3ipc

def on_window_new(i3, event):
    # Get the currently focused window
    focused = i3.get_tree().find_focused()

    current_workspace = focused.workspace()
    windows = [leaf for leaf in current_workspace.leaves()]
 
    # Get the parent container of the focused window
    parent = focused.parent

    # Check the layout of the parent container
    if parent.layout == 'splitv':
        i3.command('split h')
    else:
        i3.command('split v')

    if len(windows) == 1:
        i3.command('split h')

if __name__ == "__main__":
    # Create a connection to the i3 IPC
    i3 = i3ipc.Connection()

    # Subscribe to the window::new event
    i3.on('window::new', on_window_new)

    # Start the main event loop
    i3.main()
