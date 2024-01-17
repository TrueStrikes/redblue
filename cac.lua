-- Create a ScreenGui
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui

-- Create a Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.5, -75)
frame.BackgroundColor3 = Color3.new(1, 1, 1)
frame.Parent = gui

-- Create Group ID Label and TextBox
local groupIdLabel = Instance.new("TextLabel")
groupIdLabel.Text = "Group ID:"
groupIdLabel.Position = UDim2.new(0, 10, 0, 10)
groupIdLabel.Parent = frame

local groupIdTextBox = Instance.new("TextBox")
groupIdTextBox.Size = UDim2.new(0, 180, 0, 20)
groupIdTextBox.Position = UDim2.new(0, 10, 0, 30)
groupIdTextBox.Parent = frame

-- Create Code Label and TextBox
local codeLabel = Instance.new("TextLabel")
codeLabel.Text = "Code:"
codeLabel.Position = UDim2.new(0, 10, 0, 60)
codeLabel.Parent = frame

local codeTextBox = Instance.new("TextBox")
codeTextBox.Size = UDim2.new(0, 180, 0, 20)
codeTextBox.Position = UDim2.new(0, 10, 0, 80)
codeTextBox.Parent = frame

-- Create Redeem Button
local redeemButton = Instance.new("TextButton")
redeemButton.Text = "Redeem"
redeemButton.Size = UDim2.new(0, 180, 0, 30)
redeemButton.Position = UDim2.new(0, 10, 0, 110)
redeemButton.Parent = frame

-- Function to redeem the code
local function redeemCode()
    local groupId = tonumber(groupIdTextBox.Text)
    local code = codeTextBox.Text

    if groupId and code then
        local args = {
            [1] = {
                ["MyGroupIds"] = {
                    [1] = groupId
                },
                ["Action"] = "RedeemCode",
                ["Code"] = code
            }
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UGCCodesRemoteFunction"):InvokeServer(unpack(args))
    else
        print("Invalid input. Please enter valid Group ID and Code.")
    end
end

-- Connect redeemCode function to button click
redeemButton.MouseButton1Click:Connect(redeemCode)
