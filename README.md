local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local GITHUB_URL = "https://raw.githubusercontent.com/badscarz/testringoscriptlavaforkyesoal/refs/heads/main/database/lua/readme.md/database.lua"

local Data = {}
local success, result = pcall(function()
    return loadstring(game:HttpGet(GITHUB_URL))()
end)

if success and type(result) == "table" then
    Data = result
else
    Data = {Main = {{name = "FETCH ERROR", scriptUrl = "", icon = "❌"}}, Sub = {}}
end

local sg = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
sg.Name = "KryptonV7_h1iy"
sg.ResetOnSpawn = false

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 330, 0, 350)
main.Position = UDim2.new(0, 50, 0.5, -175)
main.BackgroundColor3, main.BackgroundTransparency, main.BorderSizePixel = Color3.new(0, 0, 0), 0.15, 0

local header = Instance.new("Frame", main)
header.Size, header.BackgroundColor3 = UDim2.new(1, 0, 0, 80), Color3.new(0, 0, 0)

local title = Instance.new("TextLabel", header)
title.Size, title.Text, title.Font, title.TextColor3, title.TextSize, title.BackgroundTransparency = UDim2.new(1, 0, 1, 0), "KRYPTON EXPLORER V7", Enum.Font.GothamBold, Color3.new(1, 1, 1), 18, 1

local subGui = Instance.new("Frame", sg)
subGui.Size, subGui.Position, subGui.BackgroundColor3, subGui.BorderSizePixel, subGui.BorderColor3, subGui.Visible = UDim2.new(0, 300, 0, 400), UDim2.new(0.5, -150, 0.5, -200), Color3.fromRGB(10, 10, 10), 2, Color3.fromRGB(255, 0, 0), false

local subHeader = Instance.new("Frame", subGui)
subHeader.Size, subHeader.BackgroundColor3 = UDim2.new(1, 0, 0, 35), Color3.fromRGB(40, 0, 0)

local subTitle = Instance.new("TextLabel", subHeader)
subTitle.Size, subTitle.Position, subTitle.Text, subTitle.Font, subTitle.TextColor3, subTitle.TextSize, subTitle.TextXAlignment, subTitle.BackgroundTransparency = UDim2.new(1, -40, 1, 0), UDim2.new(0, 10, 0, 0), "INTERNAL HUB", Enum.Font.GothamBold, Color3.new(1, 1, 1), 14, Enum.TextXAlignment.Left, 1

local closeBtn = Instance.new("TextButton", subHeader)
closeBtn.Size, closeBtn.Position, closeBtn.Text, closeBtn.TextColor3, closeBtn.BackgroundColor3, closeBtn.BorderSizePixel = UDim2.new(0, 35, 0, 35), UDim2.new(1, -35, 0, 0), "X", Color3.new(1, 1, 1), Color3.fromRGB(180, 0, 0), 0

local subScroll = Instance.new("ScrollingFrame", subGui)
subScroll.Size, subScroll.Position, subScroll.BackgroundTransparency, subScroll.ScrollBarThickness, subScroll.ScrollBarImageColor3 = UDim2.new(1, -10, 1, -45), UDim2.new(0, 5, 0, 40), 1, 2, Color3.new(1, 0, 0)

local subLayout = Instance.new("UIListLayout", subScroll)
subLayout.Padding = UDim.new(0, 5)

local menuType, mainIndex, subIndex = "MAIN", 1, 1
local mainSlots, subSlots = {}, {}

-- Build Main
for i, d in ipairs(Data.Main) do
    local slot = Instance.new("Frame", main)
    slot.Size, slot.Position, slot.BackgroundColor3, slot.BackgroundTransparency, slot.BorderSizePixel = UDim2.new(1, 0, 0, 45), UDim2.new(0, 0, 0, 80 + ((i-1) * 46)), Color3.new(0,0,0), 0.5, 0
    local lbl = Instance.new("TextLabel", slot)
    lbl.Size, lbl.Position, lbl.Text, lbl.Font, lbl.TextColor3, lbl.TextSize, lbl.TextXAlignment, lbl.BackgroundTransparency = UDim2.new(1, -20, 1, 0), UDim2.new(0, 15, 0, 0), (d.icon or "•") .. " " .. d.name:upper(), Enum.Font.Gotham, Color3.new(1,1,1), 12, Enum.TextXAlignment.Left, 1
    mainSlots[i] = {Frame = slot, Label = lbl, URL = d.scriptUrl}
end

-- Build Sub
for i, d in ipairs(Data.Sub) do
    local slot = Instance.new("Frame", subScroll)
    slot.Size, slot.BackgroundColor3, slot.BorderSizePixel = UDim2.new(1, -5, 0, 35), Color3.fromRGB(30, 30, 30), 0
    local lbl = Instance.new("TextLabel", slot)
    lbl.Size, lbl.Position, lbl.Text, lbl.Font, lbl.TextColor3, lbl.TextSize, lbl.TextXAlignment, lbl.BackgroundTransparency = UDim2.new(1, -10, 1, 0), UDim2.new(0, 10, 0, 0), d.name:upper(), Enum.Font.Gotham, Color3.new(0.8, 0.8, 0.8), 11, Enum.TextXAlignment.Left, 1
    subSlots[i] = {Frame = slot, Label = lbl, Load = d.load}
end
subScroll.CanvasSize = UDim2.new(0,0,0, #subSlots * 40)

local function update()
    for i, s in pairs(mainSlots) do
        local sel = (menuType == "MAIN" and i == mainIndex)
        s.Frame.BackgroundColor3, s.Frame.BackgroundTransparency, s.Label.TextColor3 = sel and Color3.new(1,1,1) or Color3.new(0,0,0), sel and 0 or 0.5, sel and Color3.new(0,0,0) or Color3.new(1,1,1)
    end
    for i, s in pairs(subSlots) do
        local sel = (menuType == "SUB" and i == subIndex)
        s.Frame.BackgroundColor3, s.Label.TextColor3 = sel and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(30, 30, 30), sel and Color3.new(1,1,1) or Color3.new(0.8, 0.8, 0.8)
        if sel then subScroll.CanvasPosition = Vector2.new(0, math.max(0, (i-5) * 40)) end
    end
end

closeBtn.MouseButton1Click:Connect(function() subGui.Visible = false menuType = "MAIN" update() end)

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe and input.KeyCode ~= Enum.KeyCode.Return then return end
    if input.KeyCode == Enum.KeyCode.Zero then main.Visible = not main.Visible subGui.Visible = false menuType = "MAIN" end
    if not main.Visible then return end
    if input.KeyCode == Enum.KeyCode.Down then
        if menuType == "MAIN" then mainIndex = mainIndex >= #mainSlots and 1 or mainIndex + 1 else subIndex = subIndex >= #subSlots and 1 or subIndex + 1 end
    elseif input.KeyCode == Enum.KeyCode.Up then
        if menuType == "MAIN" then mainIndex = mainIndex <= 1 and #mainSlots or mainIndex - 1 else subIndex = subIndex <= 1 and #subSlots or subIndex - 1 end
    elseif input.KeyCode == Enum.KeyCode.Return then
        if menuType == "MAIN" then
            local t = mainSlots[mainIndex]
            if t.URL == "OPEN_SUB_GUI" then subGui.Visible = true menuType = "SUB"
            elseif t.URL == "ACTION_TERMINATE" then
                for _, v in pairs(LocalPlayer.PlayerGui:GetChildren()) do if v:IsA("ScreenGui") and v.Name ~= sg.Name then v:Destroy() end end
            elseif t.URL ~= "" then loadstring(game:HttpGet(t.URL))() end
        else
            local t = subSlots[subIndex]
            if t.Load ~= "" then loadstring(t.Load)() end
        end
    elseif input.KeyCode == Enum.KeyCode.Backspace and menuType == "SUB" then subGui.Visible = false menuType = "MAIN" end
    update()
end)

local d, ds, sp
header.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then d = true ds = i.Position sp = main.Position end end)
UserInputService.InputChanged:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseMovement and d then local delta = i.Position - ds main.Position = UDim2.new(sp.X.Scale, sp.X.Offset + delta.X, sp.Y.Scale, sp.Y.Offset + delta.Y) end end)
UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then d = false end end)
update()
