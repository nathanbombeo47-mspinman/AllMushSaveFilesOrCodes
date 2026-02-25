local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local e = React.createElement
local state = React.useState
local effect = React.useEffect

return function()
	local function ui()
		local char = Player.Character or Player.CharacterAdded:Wait()
		local humanoid = char:FindFirstChild("Humanoid")
		local HpVal, setVal = state(100)

		effect(function()
			local connection = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
				setVal(humanoid.Health)
			end)

			return function()
				connection:Disconnect()
			end
		end, { char })

		return e(React.Fragment, nil, {
			e("Frame", {
				Position = UDim2.fromScale(0.01, 0.955),
				Size = UDim2.fromScale(0.12, 0.05),
				BackgroundColor3 = Color3.fromRGB(61, 61, 61),
			}, {
				e("UICorner", {
					CornerRadius = UDim.new(0, 30),
				}),
				e("UIStroke", {
					Thickness = 1.5,
					Color = Color3.fromRGB(255, 255, 255),
				}),

				e("Frame", {
					Size = UDim2.fromScale(HpVal / 100, 1),
					BackgroundColor3 = Color3.fromRGB(9, 255, 0),
				}, {
					e("TextLabel", {
						Text = tostring(HpVal),
						Size = UDim2.fromScale(1, 0.8),
						TextColor3 = Color3.fromRGB(0, 0, 0),
						BackgroundTransparency = 1,
						TextScaled = true,
						Font = Enum.Font.FredokaOne,
					}),
				}),
			}),
		})
	end

	Player.CharacterAdded:Connect(function()
		local container = Instance.new("ScreenGui")
		container.Parent = Player.PlayerGui
		container.Name = "Hi bob"

		local root = ReactRoblox.createRoot(container)
		root:render(e(ui))
	end)
end
