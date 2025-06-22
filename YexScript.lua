-- ⚠️ YexScript | Visual Pet Spawner (Client-Side Only)
local plr = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", plr:WaitForChild("PlayerGui"))
gui.Name = "YexScript_VisualPetSpawner"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 160)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "🐾 YexScript | Visual Pet Spawner"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 17

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.9, 0, 0, 30)
box.Position = UDim2.new(0.05, 0, 0.4, 0)
box.PlaceholderText = "Enter Pet Name (e.g. Raccoon)"
box.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
box.TextColor3 = Color3.new(1, 1, 1)
box.Text = ""
box.Font = Enum.Font.Gotham
box.TextSize = 14

local spawn = Instance.new("TextButton", frame)
spawn.Text = "Add Visual Pet"
spawn.Size = UDim2.new(0.9, 0, 0, 30)
spawn.Position = UDim2.new(0.05, 0, 0.7, 0)
spawn.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
spawn.TextColor3 = Color3.new(1, 1, 1)
spawn.Font = Enum.Font.GothamBold
spawn.TextSize = 16

-- Client-side Pet Fake/Dupe Function
spawn.MouseButton1Click:Connect(function()
    local name = box.Text
    if name and name ~= "" then
        local fakePet = Instance.new("TextLabel")
        fakePet.Size = UDim2.new(0, 100, 0, 25)
        fakePet.Position = UDim2.new(0, #gui:GetChildren() * 105 % 600, 0, 180 + math.random(-10, 10))
        fakePet.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        fakePet.Text = name .. " [1 KG] [Age 1]"
        fakePet.TextColor3 = Color3.new(1, 1, 1)
        fakePet.Font = Enum.Font.Gotham
        fakePet.TextSize = 14
        fakePet.Parent = gui
    end
end)
