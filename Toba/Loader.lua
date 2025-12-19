local Players = game:GetService("Players")
local _player

local SCRIPTS = {
    [123456789] = {
        version = "1.3.0",
        url = "https://raw.githubusercontent.com/scripts/./game.lua"
    },
    [987654321] = {
        version = "1.3.0",
        url = "https://raw.githubusercontent.com/scripts/./place.lua"
    }
}

local function waitForPlayer()
    repeat
        _player = Players.LocalPlayer
        task.wait()
    until _player
end

local function resolve()
    return SCRIPTS[game.GameId] or SCRIPTS[game.PlaceId]
end

local function fetch(url)
    return loadstring(game:HttpGet(url))
end

local function execute()
    waitForPlayer()

    local data = resolve()
    if not data then
        return false
    end

    local chunk = fetch(data.url)
    if type(chunk) ~= "function" then
        return false
    end

    local ok, status = pcall(chunk, data.version)
    if not ok or status ~= true then
        local retry = fetch(data.url)
        if type(retry) ~= "function" then
            return false
        end

        local ok2, status2 = pcall(retry, data.version)
        if not ok2 or status2 ~= true then
            return false
        end
    end

    return true
end

local ok, result = pcall(execute)
if not ok or result ~= true then
    if _player then
        _player:Kick("Update required.")
    end
end
