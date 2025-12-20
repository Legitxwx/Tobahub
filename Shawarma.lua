return function(version)
    local CURRENT = version
    if CURRENT ~= version then
        return false
    end
    return true
end

local v1 = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))():CreateWindow({
    Title = "Toba Hub",
    Icon = "monitor",
    Author = "Scary Shaw",
    OpenButton = {
        Title = "Open Menu",
        Icon = "door-open",
        CornerRadius = UDim.new(0, 16),
        StrokeThickness = 2,
        Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),
        OnlyMobile = false,
        Enabled = true,
        Draggable = true
    }
})
local vu2 = game:GetService("Players")
local vu3 = game:GetService("RunService")
local vu4 = game:GetService("Lighting")
local v5 = game:GetService("ProximityPromptService")
local v6 = game:GetService("UserInputService")
game:GetService("TweenService")
local vu7 = vu2.LocalPlayer
local vu8 = workspace.CurrentCamera
local vu9 = 70
local vu10 = false
local vu11 = false
local vu12 = false
local vu13 = false
local vu14 = false
local vu15 = false
local vu16 = false
local vu17 = false
local v18 = v1:Tab({
    Title = "Universal",
    Icon = "settings",
    Locked = false
})
v18:Select()
v18:Slider({
    Title = "FOV",
    Desc = "Field of View",
    Step = 1,
    Value = {
        Min = 70,
        Max = 120,
        Default = 70
    },
    Callback = function(p19)
        vu9 = p19
        vu8.FieldOfView = p19
    end
})
vu3.RenderStepped:Connect(function()
    if vu8 and vu8.FieldOfView ~= vu9 then
        vu8.FieldOfView = vu9
    end
end)
v18:Toggle({
    Title = "Anti AFK",
    Desc = "Prevents getting kicked for AFK",
    Icon = "user",
    Type = "Checkbox",
    Value = false,
    Callback = function(p20)
        vu10 = p20
        if p20 then
            vu7.Idled:Connect(function()
                game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                task.wait(1)
                game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end)
        end
    end
})
v18:Toggle({
    Title = "Third Person View",
    Desc = "Switch to third person camera",
    Icon = "video",
    Type = "Checkbox",
    Value = false,
    Callback = function(p21)
        vu16 = p21
        if p21 then
            vu7.CameraMode = Enum.CameraMode.Classic
            vu7.CameraMinZoomDistance = 8
            vu7.CameraMaxZoomDistance = 20
        else
            vu7.CameraMode = Enum.CameraMode.LockFirstPerson
            vu7.CameraMinZoomDistance = 0
            vu7.CameraMaxZoomDistance = 0
        end
    end
})
v18:Toggle({

v18:Toggle({
    Title = "Fullbright",
    Desc = "Makes everything bright",
    Icon = "sun",
    Type = "Checkbox",
    Value = false,
    Callback = function(p25)
        vu11 = p25
        if p25 then
            vu24()
            vu23 = vu4.LightingChanged:Connect(vu24)
        else
            if vu23 then
                vu23:Disconnect()
                vu23 = nil
            end
            vu4.Ambient = Color3.new(0.5, 0.5, 0.5)
            vu4.ColorShift_Top = Color3.new(0, 0, 0)
            vu4.ColorShift_Bottom = Color3.new(0, 0, 0)
        end
    end
})

    Title = "Unlock Max Zoom",
    Desc = "Removes camera zoom limit",
    Icon = "zoom-in",
    Type = "Checkbox",
    Value = false,
    Callback = function(p22)
        vu17 = p22
        if p22 then
            vu7.CameraMaxZoomDistance = 999999
        else
            vu7.CameraMaxZoomDistance = 0
        end
    end
})
local vu23 = nil
local function vu24()
    vu4.Ambient = Color3.new(1, 1, 1)
    vu4.ColorShift_Top = Color3.new(1, 1, 1)
    vu4.ColorShift_Bottom = Color3.new(1, 1, 1)
end
local vu26 = nil
local function vu32(p27)
    local v28, v29, v30 = ipairs(p27:GetDescendants())
    while true do
        local v31
        v30, v31 = v28(v29, v30)
        if v30 == nil then
            break
        end
        if v31:IsA("BasePart") then
            v31.CanCollide = false
        end
    end
end
v18:Toggle({
    Title = "Noclip",
    Desc = "Walk through walls",
    Icon = "git-merge",
    Type = "Checkbox",
    Value = false,
    Callback = function(p33)
        vu12 = p33
        if p33 then
            vu26 = vu3.Stepped:Connect(function()
                if vu7.Character then
                    vu32(vu7.Character)
                end
            end)
        elseif vu26 then
            vu26:Disconnect()
            vu26 = nil
        end
    end
})
v18:Toggle({
    Title = "Infinite Jump",
    Desc = "Jump infinitely in air",
    Icon = "move",
    Type = "Checkbox",
    Value = false,
    Callback = function(p34)
        vu13 = p34
    end
})
v6.JumpRequest:Connect(function()
    if vu13 then
        local v35 = vu7.Character
        local v36 = v35 and v35:FindFirstChildOfClass("Humanoid")
        if v36 then
            v36:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)
v18:Toggle({
    Title = "Fast Interact",
    Desc = "Instant button presses",
    Icon = "zap",
    Type = "Checkbox",
    Value = false,
    Callback = function(p37)
        vu14 = p37
    end
})
v5.PromptButtonHoldBegan:Connect(function(p38)
    if vu14 then
        fireproximityprompt(p38)
    end
end)
v18:Toggle({
    Title = "Auto Interact",
    Desc = "Automatically interact with prompts",
    Icon = "repeat",
    Type = "Checkbox",
    Value = false,
    Callback = function(p39)
        vu15 = p39
    end
})
v5.PromptShown:Connect(function(pu40)
    if vu15 then
        task.wait(0.05)
        pcall(function()
            fireproximityprompt(pu40)
        end)
    end
end)
local v41 = v1:Tab({
    Title = "Movement",
    Icon = "move",
    Locked = false
})
v41:Button({
    Title = "Discord",
    Desc = "discord.gg/SYX99GChEE",
    Icon = "users",
    Callback = function()
        print("Discord: discord.gg/SYX99GChEE")
    end
})
v41:Slider({
    Title = "WalkSpeed",
    Desc = "Adjust walking speed",
    Step = 1,
    Value = {
        Min = 1,
        Max = 500,
        Default = 16
    },
    Callback = function(p42)
        local v43 = vu7.Character and vu7.Character:FindFirstChild("Humanoid")
        if v43 then
            v43.WalkSpeed = p42
        end
    end
})
v41:Slider({
    Title = "JumpPower",
    Desc = "Adjust jump power",
    Step = 1,
    Value = {
        Min = 1,
        Max = 500,
        Default = 50
    },
    Callback = function(p44)
        local v45 = vu7.Character and vu7.Character:FindFirstChild("Humanoid")
        if v45 then
            v45.JumpPower = p44
        end
    end
})
v41:Input({
    Title = "Set WalkSpeed",
    Desc = "Enter a value (1-1000)",
    Placeholder = "Enter speed value",
    Callback = function(p46)
        local v47 = tonumber(p46)
        local v48 = v47 and vu7.Character and vu7.Character:FindFirstChild("Humanoid")
        if v48 then
            v48.WalkSpeed = math.clamp(v47, 1, 1000)
        end
    end
})
local v49 = v1:Tab({
    Title = "ESP",
    Icon = "eye",
    Locked = false
})
local vu50 = false
local vu51 = false
local vu52 = false
local vu53 = false
local vu54 = {}
local vu55 = {}
v49:Toggle({
    Title = "Highlight 1 (Green)",
    Desc = "Green highlight on players",
    Icon = "circle",
    Type = "Checkbox",
    Value = false,
    Callback = function(p56)
        vu50 = p56
        if p56 then
            local v57 = vu2
            local v58, v59, v60 = ipairs(v57:GetPlayers())
            while true do
                local v61
                v60, v61 = v58(v59, v60)
                if v60 == nil then
                    break
                end
                if v61 ~= vu7 and v61.Character then
                    local v62 = Instance.new("Highlight")
                    v62.Name = "HL1"
                    v62.FillColor = Color3.fromRGB(0, 255, 0)
                    v62.OutlineColor = Color3.fromRGB(255, 255, 255)
                    v62.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    v62.Parent = v61.Character
                end
            end
        else
            local v63 = vu2
            local v64, v65, v66 = ipairs(v63:GetPlayers())
            while true do
                local v67
                v66, v67 = v64(v65, v66)
                if v66 == nil then
                    break
                end
                if v67.Character then
                    local v68 = v67.Character:FindFirstChild("HL1")
                    if v68 then
                        v68:Destroy()
                    end
                end
            end
        end
    end
})
local function vu70()
    local v69 = Drawing.new("Line")
    v69.Color = Color3.fromRGB(0, 255, 0)
    v69.Thickness = 2
    v69.Transparency = 1
    return v69
end
v49:Toggle({
    Title = "Tracer 1",
    Desc = "Line from bottom to players",
    Icon = "arrow-down",
    Type = "Checkbox",
    Value = false,
    Callback = function(p71)
        vu53 = p71
        if not p71 then
            local v72, v73, v74 = pairs(vu55)
            while true do
                local v75, v76 = v72(v73, v74)
                if v75 == nil then
                    break
                end
                local v77, v78, v79 = pairs(v76)
                v74 = v75
                while true do
                    local v80
                    v79, v80 = v77(v78, v79)
                    if v79 == nil then
                        break
                    end
                    v80:Remove()
                end
                vu55[v75] = nil
            end
        end
    end
})
vu3.RenderStepped:Connect(function()
    if vu53 then
        local v81 = vu2
        local v82, v83, v84 = ipairs(v81:GetPlayers())
        while true do
            local v85
            v84, v85 = v82(v83, v84)
            if v84 == nil then
                break
            end
            if v85 ~= vu7 and v85.Character then
                if not vu55[v85] then
                    vu55[v85] = {
                        vu70()
                    }
                end
                local v86 = v85.Character:FindFirstChild("HumanoidRootPart")
                if v86 then
                    local v87, v88 = vu8:WorldToViewportPoint(v86.Position)
                    local v89 = vu55[v85][1]
                    v89.Visible = v88
                    v89.From = Vector2.new(vu8.ViewportSize.X / 2, vu8.ViewportSize.Y)
                    v89.To = Vector2.new(v87.X, v87.Y)
                end
            end
        end
    end
end)
v49:Toggle({
    Title = "Highlight 2 (Yellow)",
    Desc = "Yellow highlight with red outline",
    Icon = "circle",
    Type = "Checkbox",
    Value = false,
    Callback = function(p90)
        vu51 = p90
        local v91 = vu2
        local v92, v93, v94 = ipairs(v91:GetPlayers())
        while true do
            local v95
            v94, v95 = v92(v93, v94)
            if v94 == nil then
                break
            end
            if v95.Character then
                local v96 = v95.Character:FindFirstChild("HL2")
                if p90 then
                    if not v96 then
                        local v97 = Instance.new("Highlight")
                        v97.Name = "HL2"
                        v97.FillColor = Color3.fromRGB(255, 255, 0)
                        v97.OutlineColor = Color3.fromRGB(255, 0, 0)
                        v97.Parent = v95.Character
                    end
                elseif v96 then
                    v96:Destroy()
                end
            end
        end
    end
})
local function vu99()
    local v98 = Drawing.new("Line")
    v98.Color = Color3.fromRGB(0, 170, 255)
    v98.Thickness = 2
    v98.Transparency = 1
    return v98
end
v49:Toggle({
    Title = "Tracer 2",
    Desc = "Line from you to players",
    Icon = "arrow-right",
    Type = "Checkbox",
    Value = false,
    Callback = function(p100)
        vu52 = p100
        if not p100 then
            local v101, v102, v103 = pairs(vu54)
            while true do
                local v104
                v103, v104 = v101(v102, v103)
                if v103 == nil then
                    break
                end
                v104:Remove()
            end
            vu54 = {}
        end
    end
})
vu3.RenderStepped:Connect(function()
    if vu52 then
        local v105 = vu7.Character
        if v105 then
            local v106 = v105:FindFirstChild("HumanoidRootPart")
            if v106 then
                local v107 = vu8:WorldToViewportPoint(v106.Position)
                local v108 = vu2
                local v109, v110, v111 = ipairs(v108:GetPlayers())
                while true do
                    local v112
                    v111, v112 = v109(v110, v111)
                    if v111 == nil then
                        break
                    end
                    if v112 ~= vu7 and v112.Character then
                        local v113 = v112.Character:FindFirstChild("HumanoidRootPart")
                        if v113 then
                            if not vu54[v112] then
                                vu54[v112] = vu99()
                            end
                            local v114, v115 = vu8:WorldToViewportPoint(v113.Position)
                            vu54[v112].Visible = v115
                            vu54[v112].From = Vector2.new(v107.X, v107.Y)
                            vu54[v112].To = Vector2.new(v114.X, v114.Y)
                        end
                    end
                end
            end
        else
            return
        end
    else
        return
    end
end)
local v116, v117, v118 = ipairs({
    137826330724902,
    128001665358186
})
local vu119 = vu7
local v120 = vu3
local v121 = false
while true do
    local v122
    v118, v122 = v116(v117, v118)
    if v118 == nil then
        break
    end
    if game.PlaceId == v122 then
        v121 = true
        break
    end
end
if v121 then
    local v123 = v1:Tab({
        Title = "Scary Shawarma",
        Icon = "coffee",
        Locked = false
    })
    local vu124 = false
    local vu125 = Color3.fromRGB(0, 255, 0)
    local vu126 = Color3.fromRGB(255, 0, 0)
    local vu127 = Color3.fromRGB(0, 170, 255)
    local function vu132()
        local v128, v129, v130 = ipairs(workspace:GetDescendants())
        while true do
            local v131
            v130, v131 = v128(v129, v130)
            if v130 == nil then
                break
            end
            if v131:IsA("Highlight") and v131.Name == "HL" then
                v131:Destroy()
            end
            if v131:IsA("BoolValue") and v131.Name == "ESP_HL" then
                v131:Destroy()
            end
        end
    end
    local function vu137(p133, p134)
        if p133 and not p133:FindFirstChild("ESP_HL") then
            local v135 = Instance.new("BoolValue")
            v135.Name = "ESP_HL"
            v135.Parent = p133
            local v136 = Instance.new("Highlight")
            v136.Name = "HL"
            v136.FillColor = p134
            v136.OutlineColor = p134
            v136.FillTransparency = 0.4
            v136.OutlineTransparency = 0
            v136.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            v136.Parent = p133
        end
    end
    v123:Toggle({
        Title = "ESP Entities",
        Desc = "Highlight game entities",
        Icon = "ghost",
        Type = "Checkbox",
        Value = false,
        Callback = function(p138)
            vu124 = p138
            if not p138 then
                vu132()
            end
        end
    })
    v120.Heartbeat:Connect(function()
        if vu124 then
            local v139 = workspace:FindFirstChild("Hum")
            if v139 then
                for v140 = 1, 24 do
                    local v141 = v139:FindFirstChild("Man" .. v140)
                    if v141 then
                        if v141:FindFirstChild("Man1") then
                            vu137(v141.Man1, vu125)
                        end
                    end
                end
                local v142 = v139:FindFirstChild("Man25santa")
                if v142 and v142:FindFirstChild("Man1") then
                    vu137(v142.Man1, vu125)
                end
                local v143 = v139:FindFirstChild("Cat")
                if v143 and v143:FindFirstChild("Man1") then
                    vu137(v143.Man1, vu125)
                end
                local v144 = v139:FindFirstChild("ManAN2")
                if v144 and v144:FindFirstChild("Man1") then
                    vu137(v144.Man1, vu125)
                end
                local v145 = v139:FindFirstChild("ManAN1")
                if v145 and v145:FindFirstChild("Man1") then
                    vu137(v145.Man1, vu127)
                end
                local v146, v147, v148 = ipairs({
                    "Internte",
                    "Mike"
                })
                while true do
                    local v149
                    v148, v149 = v146(v147, v148)
                    if v148 == nil then
                        break
                    end
                    local v150 = v139:FindFirstChild(v149)
                    if v150 and v150:FindFirstChild("Man1") then
                        vu137(v150.Man1, vu126)
                    end
                end
                for v151 = 1, 13 do
                    local v152 = v139:FindFirstChild("Anom" .. v151)
                    if v152 then
                        if v152:FindFirstChild("Man1") then
                            vu137(v152.Man1, vu126)
                        end
                    end
                end
                for v153 = 1, 13 do
                    local v154 = v139:FindFirstChild("Scream" .. v153)
                    if v154 then
                        vu137(v154, vu126)
                    end
                end
                local v155 = v139:FindFirstChild("Scream18")
                if v155 then
                    vu137(v155, vu126)
                end
                local v156 = workspace:FindFirstChild("Fail")
                if v156 then
                    vu137(v156, vu126)
                end
            end
        else
            return
        end
    end)
    v123:Button({
        Title = "TP to End (Die)",
        Desc = "Teleport to black box area",
        Icon = "skull",
        Callback = function()
            local v157 = vu119.Character
            if v157 then
                local v158 = v157:FindFirstChild("HumanoidRootPart")
                if v158 then
                    local v159 = workspace:FindFirstChild("BlackBox")
                    if v159 then
                        local v160 = v159:GetChildren()
                        if # v160 >= 10 then
                            local v161 = v160[10]
                            if v161:IsA("BasePart") then
                                v158.CFrame = v161.CFrame + Vector3.new(0, 4, 0)
                            else
                                local v162 = v161:IsA("Model") and v161:FindFirstChildWhichIsA("BasePart", true)
                                if v162 then
                                    v158.CFrame = v162.CFrame + Vector3.new(0, 4, 0)
                                end
                            end
                        end
                    end
                end
            else
                return
            end
        end
    })
    v123:Button({
        Title = "Make Shawarma",
        Desc = "Automatically make shawarma",
        Icon = "utensils",
        Callback = function()
            local v170 = {
                workspace.Kit.Salad.Button.ProximityPrompt,
                workspace.Kit.Lavash.Button.ProximityPrompt,
                workspace.Kit.Cheese.Button.ProximityPrompt,
                workspace.Kebab.kebabmyaso["Kebab.040"].ProximityPrompt,
                workspace.Kit.Fry.Button.ProximityPrompt,
                workspace.Kit.Sauce.Button.ProximityPrompt,
                workspace.Kit.Board.ProximityPrompt,
                workspace.Kit.popcan.ProximityPrompt,
                workspace.Kit.Done.Lavash.ProximityPrompt
            }
            local v171 = workspace.Cans.Prompts
            if v171 then
                for v172 = 28, 22, - 1 do
                    local v173 = v171:GetChildren()[v172]
                    if v173 then
                        if v173:IsA("ProximityPrompt") then
                            table.insert(v170, v173)
                        end
                    end
                end
                for v174 = 7, 5, - 1 do
                    local v175 = v171:GetChildren()[v174]
                    if v175 then
                        if v175:IsA("ProximityPrompt") then
                            table.insert(v170, v175)
                        end
                    end
                end
                local v176, v177, v178 = ipairs({
                    "popcan",
                    "popcan2",
                    "popcan3",
                    "popcan4"
                })
                while true do
                    local v179, v180 = v176(v177, v178)
                    if v179 == nil then
                        break
                    end
                    v178 = v179
                    local v181 = v171:FindFirstChild(v180)
                    if v181 and v181:IsA("ProximityPrompt") then
                        table.insert(v170, v181)
                    end
                end
            end
            local v182, v183, v184 = ipairs(v170)
            while true do
                local vu185
                v184, vu185 = v182(v183, v184)
                if v184 == nil then
                    break
                end
                if vu185 and vu185:IsA("ProximityPrompt") then
                    vu185.HoldDuration = 0
                    vu185.MaxActivationDistance = 30
                    vu185.RequiresLineOfSight = false
                    pcall(function()
                        fireproximityprompt(vu185)
                    end)
                    task.wait(0.25)
                end
            end
        end
    })
    v123:Button({
        Title = "TP Home",
        Desc = "Teleport to door base",
        Icon = "home",
        Callback = function()
            local v163 = vu119.Character
            if v163 then
                local v164 = v163:FindFirstChild("HumanoidRootPart")
                if v164 then
                    local v165 = workspace:WaitForChild("Door"):WaitForChild("Base")
                    if v165 then
                        v164.CFrame = v165.CFrame + Vector3.new(0, 3, 0)
                    end
                end
            else
                return
            end
        end
    })
    v123:Button({
        Title = "TP to Trash",
        Desc = "Stop the bus",
        Icon = "trash-2",
        Callback = function()
            local v166 = vu119.Character
            if v166 then
                local v167 = v166:FindFirstChild("HumanoidRootPart")
                if v167 then
                    local v168 = workspace:WaitForChild("Street"):WaitForChild("tr")
                    if v168 then
                        if v168:IsA("BasePart") then
                            v167.CFrame = v168.CFrame + Vector3.new(0, 3, 0)
                        else
                            local v169 = v168:IsA("Model") and (v168.PrimaryPart or v168:FindFirstChildWhichIsA("BasePart", true))
                            if v169 then
                                v167.CFrame = v169.CFrame + Vector3.new(0, 3, 0)
                            end
                        end
                    end
                end
            else
                return
            end
        end
    })
else
    v1:Tab({
        Title = "Game Features",
        Icon = "alert-circle",
        Locked = false
    }):Label({
        Title = "Game Not Supported",
        Desc = "This game is not currently supported",
        Center = true
    })
end
