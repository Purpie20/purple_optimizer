-- Check if widgets table exists, create it if not
if not widgets then
    widgets = {}
end

-- Disable widgets and optimize server performance
local function DisableWidgetsAndOptimize()
    MsgN("Purple Warden: Disabling widgets and optimizing server performance...")

    game.SetTimeScale(1)

    -- Check and remove the HUDShouldDraw hook directly
    if hook.GetTable()["HUDShouldDraw"] then
        hook.Remove("HUDShouldDraw", "DisableWidgets")
    end

    -- Call widgets.PlayerTick() function directly if it's defined and a function
    if type(widgets.PlayerTick) == "function" then
        widgets.PlayerTick()
    else
        print("Error: widgets.PlayerTick() function is not defined or not a function.")
    end

    -- Remove Think hook
    hook.Remove("Think", "DisableWidgetsAndOptimize")
end

-- Call the function directly instead of using a hook
DisableWidgetsAndOptimize()