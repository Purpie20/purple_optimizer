AddCSLuaFile()

local topLevel = "purple-scripts"

local SERVER = SERVER
local CLIENT = CLIENT

local function log(name)
    print("[CFC Gmod Scripts] Loading:", name)
end

local function realmInclude(path, isCL, isSV, isSH)
    if SERVER and (isCL or isSH) then
        AddCSLuaFile(path)
    end

    if CLIENT and (isCL or isSH) or SERVER and (isSV or isSH) then
        include(path)
    end
end

local _, dirs = file.Find(topLevel .. "/*", "LUA")

for _, dir in ipairs(dirs) do
    local files = file.Find(topLevel .. "/" .. dir .. "/*", "LUA")
    local isServer, isClient = false, false

    for _, fil in ipairs(files) do
        local prefix = string.sub(fil, 1, 3)
        local path = dir .. "/" .. fil

        local isCL, isSV, isSH = prefix == "cl_", prefix == "sv_", prefix == "sh_"

        isClient = isClient or (isCL or isSH)
        isServer = isServer or (isSV or isSH)

        realmInclude(path, isCL, isSV, isSH)
    end

    if CLIENT and isClient or SERVER and isServer then
        log(dir)
    end
end
