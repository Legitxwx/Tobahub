-- Toba Hub Loader Lua SUE - Support Under Exploit
local Games = {
    [7383] = "f24283b49f862335", -- Bypass Script
    [3837] = "slug" -- 
}

-- Whitelist A Player So They Unable To Use This Script
local WHITELIST = {
    [1] = true,
    [2] = true,
    [3] = true
}
-- HWID Per Player / This Is Generated Using UUID - You Can Get More UUID
local HWIDS = {
    ["a9cfbafd-75ae-4725-870e-2be5d2d9409d"] = true,
    ["87fc6282-496f-416b-bb9d-d271da595809"] = true,
    ["0884c3e8-adfe-42a8-88f5-cb296455f50b"] = true,
    ["65700f51-2ad5-4bdd-9825-f7e244964163"] = true,
    ["4934a7d5-d73e-4094-bcbd-fc12acfdb97a"] = true,
    ["e442bdbd-c4c3-4236-a61b-a6884a133368"] = true,
    ["f07ba887-7ac0-4555-8605-ca609cd73a56"] = true,
    ["1740087f-5e88-49f4-8423-05b821128e6f"] = true,
    ["5f6ce1cd-7fa7-4ad2-b682-468fe947f082"] = true,
    ["8bec66ad-05f1-46c8-a3dd-a619d6753c80"] = true,
    ["b916a6de-9d54-424d-9c93-e3a87c1143c9"] = true,
    ["504aef40-5545-49f1-a7c1-95a39d4cf02c"] = true,
    ["9a3687c4-0db1-4249-b661-11ee6f4f176c"] = true,
    ["993a2eb7-ce98-4428-a75e-021d060e5b7c"] = true,
    ["a3c605e9-1066-4977-bf29-d70ef7fbc0fa"] = true,
    ["8055f582-97e6-4285-aa9b-d8d0d1d96fc3"] = true,
    ["57a3d006-4541-4356-9416-6a01f2a45fe8"] = true,
    ["bbed3971-6e05-4c66-9589-939f365a0a41"] = true,
    ["641cd78d-2307-438d-bea2-b2b0aa1ecb6c"] = true,
    ["9a245275-bbc6-4341-a8eb-28bbd4cd5ee4"] = true,
    ["ebafede8-17aa-4525-b00c-e0e1b24d828f"] = true,
    ["1db111ec-3969-461d-b043-02b93a700f25"] = true,
    ["718880cb-e60d-4fba-a533-fdc92e240c12"] = true,
    ["d764d142-7ecb-40d5-8e6f-25ad0b8d83e3"] = true,
    ["a8ce7f48-cd1d-4f5e-86c3-c362a9e2aa5e"] = true,
    ["9c2373a2-8040-4214-a47c-26001f18a327"] = true,
    ["046faae7-a043-4834-9ffd-bb38eddef6b6"] = true
}

local player = game.Players.LocalPlayer
if not WHITELIST[player.UserId] then return end

local hwid = "a9cfbafd-75ae-4725-870e-2be5d2d9409d"
if not HWIDS[hwid] then return end

local slug = Games[game.PlaceId]
if not slug then return end

local success, source = pcall(function()
    return game:HttpGet("https://pandadevelopment.net/virtual/file/" .. slug)
end)

if success then
    local fn, err = loadstring(source)
    if fn then pcall(fn) end
end
