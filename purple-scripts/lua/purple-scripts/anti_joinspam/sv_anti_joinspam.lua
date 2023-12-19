local connections = {}
local banDuration = 3

hook.Add("CheckPassword", "GMS_AntiJoinSpam", function(steamid64, ip, _, _, name)
    connections[steamid64] = (connections[steamid64] or 0) + 1

    if connections[steamid64] >= 8 then
        local ip = string.match(ip, "([^:]+)")
        game.ConsoleCommand("addip " .. banDuration .. " " .. ip .. " writeip\n")

        local steamid = util.SteamIDFrom64(steamid64)
        print("Purple Warden: ", name .. " " .. steamid .. " tried to spam join the server.")

        return false, "Too many connection attempts"
    end
end)

timer.Create("GMS_AntiJoinSpam", 5, 0, function()
    for steamid64, count in pairs(connections) do
        connections[steamid64] = math.max(count - 1, 0)
        if connections[steamid64] == 0 then
            connections[steamid64] = nil
        end
    end
end)

