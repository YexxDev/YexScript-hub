-- 🐾 YexScript Visual Pet Spawner by Yex
local plr = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", plr:WaitForChild("PlayerGui"))
gui.Name = "YexScript_PetSpawnerUI"

-- Main Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 280, 0, 160)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "🧪 YexScript | Visual Pet Spawner"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 17

-- Input box
local input = Instance.new("TextBox", frame)
input.Size = UDim2.new(0.9, 0, 0, 30)
input.Position = UDim2.new(0.05, 0, 0.4, 0)
input.PlaceholderText = "Enter Pet Name (e.g. Raccoon)"
input.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
input.TextColor3 = Color3.new(1, 1, 1)
input.Font = Enum.Font.Gotham
input.TextSize = 14
input.Text = ""

-- Spawn button
local spawn = Instance.new("TextButton", frame)
spawn.Text = "VISUAL DUPLICATE"
spawn.Size = UDim2.new(0.9, 0, 0, 30)
spawn.Position = UDim2.new(0.05, 0, 0.7, 0)
spawn.BackgroundColor3 = Color3.fromRGB(90, 90, 200)
spawn.TextColor3 = Color3.new(1, 1, 1)
spawn.Font = Enum.Font.GothamBold
spawn.TextSize = 16

-- Fake Inventory (visual only)
local fakeInv = Instance.new("ScrollingFrame", gui)
fakeInv.Name = "YexInventory"
fakeInv.Size = UDim2.new(0, 300, 0, 200)
fakeInv.Position = UDim2.new(0.7, 0, 0.3, 0)
fakeInv.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
fakeInv.CanvasSize = UDim2.new(0, 0, 0, 0)
fakeInv.ScrollBarThickness = 6

local layout = Instance.new("UIListLayout", fakeInv)
layout.Padding = UDim.new(0, 5)
layout.SortOrder = Enum.SortOrder.LayoutOrder

-- Add pet button logic
spawn.MouseButton1Click:Connect(function()
	local petName = input.Text
	if petName and petName ~= "" then
		local pet = Instance.new("TextLabel")
		pet.Size = UDim2.new(1, -10, 0, 30)
		pet.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		pet.TextColor3 = Color3.new(1, 1, 1)
		pet.Text = "🐾 " .. petName .. "  [Age: 1 Day]  [Weight: 1.0kg]"
		pet.Font = Enum.Font.Gotham
		pet.TextSize = 14
		pet.Parent = fakeInv

		-- Auto-expand canvas
		task.wait(0.1)
		fakeInv.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
	end
end)
