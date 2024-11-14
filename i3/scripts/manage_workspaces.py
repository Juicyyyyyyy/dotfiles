import i3ipc

def adjust_layout(i3, event):
    tree = i3.get_tree()
    
    if tree.find_focused().workspace().num == 1:
        return
   
    workspaces = sorted(tree.workspaces(), key=lambda ws: ws.num)
    for i in range(1, len(workspaces)): # start at 1 to exclude workspace 1
        if not workspaces[i].leaves:
            for j in range(i+1, len(workspaces)):
                i3.command(f"workspace {j}.name; move workspace to workspace {j-1}.name")
        
if __name__ == "__main__":
    i3 = i3ipc.Connection()
    # only call the function when just moved from an empty desktop to avoid autoclosing a just opened workspace
    i3.on("workspace::focus", adjust_layout)
