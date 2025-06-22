-- 🧪 YexScript | REAL Visual Dupe (Injects to real inventory)

local plr = game.Players.LocalPlayer
local gui = plr:WaitForChild("PlayerGui")

-- Step 1: Try to find real pet inventory frame
local petInvFrame = nil
for _,v in pairs(gui:GetDescendants()) do
    if v:IsA("Frame") and tostring(v):lower():find("pet") and v:FindFirstChildWhichIsA("UIGridLayout") then
        petInvFrame = v
        break
    end
end

if not petInvFrame then
    warn("❌ Could not find real pet inventory frame. Open your pet inventory first.")
    return
end

-- Step 2: Create GUI for dupe input
local screenGui = Instance.new("ScreenGui", gui)
screenGui.Name = "YexScript_DuperUI"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 250, 0, 150)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "🧬 YexScript | Real Visual Dupe"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 16

local input = Instance.new("TextBox", frame)
input.Size = UDim2.new(0.9, 0, 0, 30)
input.Position = UDim2.new(0.05, 0, 0.4, 0)
input.PlaceholderText = "Enter Pet Name"
input.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
input.TextColor3 = Color3.new(1, 1, 1)
input.Font = Enum.Font.Gotham
input.TextSize = 14
input.Text = ""

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(0.9, 0, 0, 30)
btn.Position = UDim2.new(0.05, 0, 0.7, 0)
btn.Text = "VISUAL DUPLICATE"
btn.BackgroundColor3 = Color3.fromRGB(80, 100, 255)
btn.TextColor3 = Color3.new(1, 1, 1)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 14

-- Step 3: Duplicate into inventory
btn.MouseButton1Click:Connect(function()
	local name = input.Text
	if name ~= "" then
		local petClone = Instance.new("TextLabel")
		petClone.Size = UDim2.new(0, 100, 0, 100)
		petClone.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		petClone.TextColor3 = Color3.new(1, 1, 1)
		petClone.Text = "🐾 " .. name
		petClone.Font = Enum.Font.GothamBold
		petClone.TextSize = 14
		petClone.Name = name
		petClone.Parent = petInvFrame
	end
end)
