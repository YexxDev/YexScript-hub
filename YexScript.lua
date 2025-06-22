-- YexScript Pet Spawner for Grow a Garden 🐾
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "YexScript_PetSpawner"
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 160)
Frame.Position = UDim2.new(0.35, 0, 0.3, 0)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundTransparency = 1
Title.Text = "🐾 YexScript | Pet Spawner"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

local PetBox = Instance.new("TextBox", Frame)
PetBox.PlaceholderText = "Enter Pet Name (e.g. Raccoon)"
PetBox.Size = UDim2.new(0.9, 0, 0, 30)
PetBox.Position = UDim2.new(0.05, 0, 0.35, 0)
PetBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
PetBox.TextColor3 = Color3.new(1,1,1)
PetBox.Font = Enum.Font.Gotham
PetBox.TextSize = 14
PetBox.Text = ""

local SpawnButton = Instance.new("TextButton", Frame)
SpawnButton.Text = "Spawn Pet"
SpawnButton.Size = UDim2.new(0.9, 0, 0, 30)
SpawnButton.Position = UDim2.new(0.05, 0, 0.65, 0)
SpawnButton.BackgroundColor3 = Color3.fromRGB(60, 130, 250)
SpawnButton.TextColor3 = Color3.new(1,1,1)
SpawnButton.Font = Enum.Font.GothamBold
SpawnButton.TextSize = 16

-- Remote Finder Function
local function findRemote(nameContains)
	for _, v in pairs(game:GetDescendants()) do
		if v:IsA("RemoteEvent") and v.Name:lower():find(nameContains:lower()) then
			return v
		end
	end
end

-- Spawn Pet Function
local function spawnPet(petName)
	local remote = findRemote("Spawn") or findRemote("Give") or findRemote("Pet")
	if remote then
		-- Try sending argument in different formats
		pcall(function()
			remote:FireServer(petName) -- string
		end)
		pcall(function()
			remote:FireServer({petName}) -- table
		end)
	else
		warn("❌ Remote not found. Try using RemoteSpy or Synapse X to get the exact remote.")
	end
end

-- Button Connect
SpawnButton.MouseButton1Click:Connect(function()
	local name = PetBox.Text
	if name ~= "" then
		spawnPet(name)
	end
end)
