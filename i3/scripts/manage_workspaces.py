#!/usr/bin/env python3

import i3ipc

def adjust_layout(i3, event):
    tree = i3.get_tree()
    
    if tree.find_focused().workspace().num == 1:
        return
   
    workspaces = sorted(tree.workspaces(), key=lambda ws: ws.num)
    for i in range(1, len(workspaces)): # start at 1 to exclude workspace 1
        if not workspaces[i].leaves:
            i3.command(f"workspace {i}.name; move workspace to output null")
        
if __name__ == "__main__":
    i3 = i3ipc.Connection()
    print(i3.get_tree().workspace())
    # only call the function when just moved from an empty desktop to avoid autoclosing a just opened workspace
    i3.on("workspace::focus", adjust_layout)
