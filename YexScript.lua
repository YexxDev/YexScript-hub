-- 🧠 YexScript Troll Script: Fake Ban + Error Message
local plr = game.Players.LocalPlayer

-- Step 1: Fake error first
local msg = Instance.new("Message", workspace)
msg.Text = "⚠️ Error Code: 267 | Unexpected behavior detected..."
wait(2)
msg.Text = "Verifying account integrity..."
wait(2)
msg.Text = "Failed to validate user session."
wait(2)
msg:Destroy()

-- Step 2: Ban screen overlay
local gui = Instance.new("ScreenGui", plr:WaitForChild("PlayerGui"))
gui.Name = "YexScript_BanTroll"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BackgroundTransparency = 0.2

local label = Instance.new("TextLabel", frame)
label.Size = UDim2.new(0.8, 0, 0.3, 0)
label.Position = UDim2.new(0.1, 0, 0.35, 0)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.fromRGB(255, 50, 50)
label.Font = Enum.Font.GothamBlack
label.TextSize = 30
label.TextWrapped = true
label.Text = [[
🚫 Your account has been permanently banned
Reason: Using unauthorized scripts and exploits
Ban Code: YEX-403
Appeals are not allowed.
]]

-- Optional fake kick
wait(5)
game:GetService("Players").LocalPlayer:Kick("⚠️ Account permanently banned by server.")
