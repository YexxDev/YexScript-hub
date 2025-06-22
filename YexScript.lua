-- Pet Spawner GUI for Grow a Garden
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- GUI Creation
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "PetSpawnerUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "🐾 Pet Spawner"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20

local TextBox = Instance.new("TextBox", Frame)
TextBox.PlaceholderText = "Pet Name (e.g. Raccoon)"
TextBox.Size = UDim2.new(0.9, 0, 0, 30)
TextBox.Position = UDim2.new(0.05, 0, 0.4, 0)
TextBox.Text = ""
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.TextColor3 = Color3.new(1,1,1)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 14

local SpawnBtn = Instance.new("TextButton", Frame)
SpawnBtn.Text = "Spawn"
SpawnBtn.Size = UDim2.new(0.9, 0, 0, 30)
SpawnBtn.Position = UDim2.new(0.05, 0, 0.7, 0)
SpawnBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
SpawnBtn.TextColor3 = Color3.new(1,1,1)
SpawnBtn.Font = Enum.Font.GothamBold
SpawnBtn.TextSize = 16

-- Function to spawn pet
function spawnPet(petName)
    -- Server must support remote creation; this only works if exploitable
    local args = {
        [1] = petName -- example: "Raccoon"
    }

    -- Replace below with actual remote path (if known)
    local remote = nil
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") and v.Name:lower():find("spawn") then
            remote = v
            break
        end
    end

    if remote then
        remote:FireServer(unpack(args))
    else
        warn("Spawn remote not found.")
    end
end

-- Button click
SpawnBtn.MouseButton1Click:Connect(function()
    local name = TextBox.Text
    if name ~= "" then
        spawnPet(name)
    end
end)
