local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TeleportService = game:GetService("TeleportService")
local RunService = game:GetService("RunService")

local ScriptUpdated = true

local WhitelistedGames = {
    ["Spelling Bee"] = true,
    ["Fisch Fishing"] = true,
    ["Scary Shawarma Kiosk"] = true,
    ["Obby Challenge"] = true
}

local Games = {
    {
        Name = "Spelling Bee",
        ID = 12345678,
        Thumbnail = "https://www.roblox.com/Thumbs/SpellingBee.png",
        Description = "Test your spelling skills!",
        Loadstring = "loadstring(game:HttpGet('https://pastebin.com/raw/SpellingBeeScript'))()"
    },
    {
        Name = "Fisch Fishing",
        ID = 87654321,
        Thumbnail = "https://www.roblox.com/Thumbs/FischFishing.png",
        Description = "Relax and fish for rare monsters.",
        Loadstring = "loadstring(game:HttpGet('https://pastebin.com/raw/FischFishingScript'))()"
    },
    {
        Name = "Scary Shawarma Kiosk",
        ID = 11223344,
        Thumbnail = "https://www.roblox.com/Thumbs/ShawarmaKiosk.png",
        Description = "Manage your kiosk and survive scary customers!",
        Loadstring = "loadstring(game:HttpGet('https://pastebin.com/raw/ShawarmaScript'))()"
    },
    {
        Name = "Obby Challenge",
        ID = 44332211,
        Thumbnail = "https://www.roblox.com/Thumbs/ObbyChallenge.png",
        Description = "Complete tricky obstacle courses!",
        Loadstring = "loadstring(game:HttpGet('https://pastebin.com/raw/ObbyScript'))()"
    }
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UltimateGameHub"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.AnchorPoint = Vector2.new(0.5,0.5)
MainFrame.Size = UDim2.new(0.85,0,0.7,0)
MainFrame.Position = UDim2.new(0.5,0,0.5,0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local LeftFrame = Instance.new("Frame")
LeftFrame.Size = UDim2.new(0, 250, 1, 0)
LeftFrame.BackgroundColor3 = Color3.fromRGB(45,45,45)
LeftFrame.Parent = MainFrame

local UIScroll = Instance.new("ScrollingFrame")
UIScroll.Size = UDim2.new(1,0,1,0)
UIScroll.BackgroundTransparency = 1
UIScroll.ScrollBarThickness = 8
UIScroll.CanvasSize = UDim2.new(0,0,0,0)
UIScroll.Parent = LeftFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0,5)
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.Parent = UIScroll

local RightFrame = Instance.new("Frame")
RightFrame.Size = UDim2.new(1,-250,1,0)
RightFrame.Position = UDim2.new(0,250,0,0)
RightFrame.BackgroundColor3 = Color3.fromRGB(50,50,50)
RightFrame.Parent = MainFrame

local GameThumbnail = Instance.new("ImageLabel")
GameThumbnail.Size = UDim2.new(0, 300, 0, 160)
GameThumbnail.Position = UDim2.new(0.5,-150,0,20)
GameThumbnail.BackgroundTransparency = 1
GameThumbnail.ImageTransparency = 1
GameThumbnail.Parent = RightFrame

local GameTitle = Instance.new("TextLabel")
GameTitle.Size = UDim2.new(1,-40,0,35)
GameTitle.Position = UDim2.new(0,20,0,190)
GameTitle.BackgroundTransparency = 1
GameTitle.TextColor3 = Color3.fromRGB(255,255,255)
GameTitle.Font = Enum.Font.GothamBold
GameTitle.TextSize = 26
GameTitle.TextXAlignment = Enum.TextXAlignment.Left
GameTitle.TextTransparency = 1
GameTitle.Parent = RightFrame

local GameDesc = Instance.new("TextLabel")
GameDesc.Size = UDim2.new(1,-40,0,130)
GameDesc.Position = UDim2.new(0,20,0,230)
GameDesc.BackgroundTransparency = 1
GameDesc.TextColor3 = Color3.fromRGB(220,220,220)
GameDesc.Font = Enum.Font.Gotham
GameDesc.TextSize = 18
GameDesc.TextWrapped = true
GameDesc.TextXAlignment = Enum.TextXAlignment.Left
GameDesc.TextYAlignment = Enum.TextYAlignment.Top
GameDesc.TextTransparency = 1
GameDesc.Parent = RightFrame

local ExecuteButton = Instance.new("TextButton")
ExecuteButton.Size = UDim2.new(0,200,0,45)
ExecuteButton.Position = UDim2.new(0.5,-100,1,-50)
ExecuteButton.BackgroundColor3 = Color3.fromRGB(80,170,255)
ExecuteButton.TextColor3 = Color3.fromRGB(255,255,255)
ExecuteButton.Font = Enum.Font.GothamBold
ExecuteButton.TextSize = 20
ExecuteButton.Text = "Execute"
ExecuteButton.Parent = RightFrame

local selectedGame = nil

for _, game in pairs(Games) do
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1,-10,0,70)
    Button.BackgroundColor3 = Color3.fromRGB(70,70,70)
    Button.TextColor3 = Color3.fromRGB(255,255,255)
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 22
    Button.Text = game.Name
    Button.Parent = UIScroll

    local Thumb = Instance.new("ImageLabel")
    Thumb.Size = UDim2.new(0,60,0,60)
    Thumb.Position = UDim2.new(0,5,0,5)
    Thumb.BackgroundTransparency = 1
    Thumb.Image = game.Thumbnail
    Thumb.Parent = Button

    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        UIScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize + 10)
    end)

    Button.MouseEnter:Connect(function()
        Button:TweenSize(UDim2.new(1,-10,0,80),"Out","Quad",0.2,true)
        Button.BackgroundColor3 = Color3.fromRGB(85,85,85)
    end)
    Button.MouseLeave:Connect(function()
        Button:TweenSize(UDim2.new(1,-10,0,70),"Out","Quad",0.2,true)
        Button.BackgroundColor3 = Color3.fromRGB(70,70,70)
    end)

    Button.MouseButton1Click:Connect(function()
        selectedGame = game
        GameThumbnail.Image = game.Thumbnail
        GameThumbnail.ImageTransparency = 0
        GameTitle.Text = game.Name
        GameTitle.TextTransparency = 0
        GameDesc.Text = game.Description
        GameDesc.TextTransparency = 0
    end)
end

ExecuteButton.MouseButton1Click:Connect(function()
    if not selectedGame then return end
    if not WhitelistedGames[selectedGame.Name] then
        LocalPlayer:Kick("Failed To Execute On Wrong Game. Please Play In The Right Game!")
        return
    end
    if not ScriptUpdated then
        LocalPlayer:Kick("Script outdated")
        return
    else
        LocalPlayer:Kick("Script Updated")
        return
    end
    if selectedGame.Loadstring then
        local success, err = pcall(function()
            loadstring(selectedGame.Loadstring)()
        end)
        if not success then warn(err) end
    end
    ScreenGui:Destroy()
    local success, err = pcall(function()
        TeleportService:Teleport(selectedGame.ID, LocalPlayer)
    end)
    if not success then warn(err) end
end)
