#!/usr/bin/env python3

import i3ipc

def renumber_workspaces(i3):
    workspaces = i3.get_workspaces()
    
    # Sort workspaces by their current number 
    sorted_workspaces = sorted(workspaces, key=lambda ws: ws.num)
    
    # Renumber workspaces sequentially
    for i, ws in enumerate(sorted_workspaces, start=1):
        if ws.name != str(i):
            print(f"Renaming workspace {ws.name} to {i}")
            i3.command(f'rename workspace "{ws.name}" to "{i}"')

def adjust_layout(i3, event):
    renumber_workspaces(i3)

    tree = i3.get_tree()
    
    if tree.find_focused().workspace().num == 1:
        return
   
    workspaces = sorted(tree.workspaces(), key=lambda ws: ws.num)
    for ws in workspaces[1:]:  # Start after first workspace
        if not ws.leaves:
            print(f"Removing workspace {ws.name}")
            i3.command(f'workspace "{ws.name}"; move workspace to output null')
        
if __name__ == "__main__":
    i3 = i3ipc.Connection()
    print(i3.get_tree().find_focused().workspace().name)
    
    i3.on("workspace::focus", adjust_layout)
    i3.on("window::close", adjust_layout)
    i3.on("workspace::empty", adjust_layout)

    i3.main()
