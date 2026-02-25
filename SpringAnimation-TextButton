local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local Ripple = require(ReplicatedStorage.Packages.Ripple)

local e = React.createElement
local event = React.Event

local ripple = {}

function ripple.init()
	local function Button()
		-- Changed starting value from 0 to 1 so it's visible by default
		local spring = Ripple.createSpring(1, {
			tension = 170,
			friction = 10,
			start = true,
		})

		-- Create a binding for the spring value
		local scale, setScale = React.useBinding(spring:getPosition())

		React.useEffect(function()
			local disconnect = spring:onChange(function(value)
				setScale(value)
			end)
			return disconnect
		end, { spring })

		return e(React.Fragment, nil, {
			e("TextButton", {
				Position = UDim2.fromScale(0.96, 0.3),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.fromScale(0.05, 0.05),
				Text = "Shop",
				BackgroundColor3 = Color3.fromRGB(255, 251, 0),

				[event.MouseEnter] = function()
					spring:setGoal(1.2)
				end,
				[event.MouseLeave] = function()
					spring:setGoal(1)
				end,
			}, {
				e("UIStroke", {
					Color = Color3.fromRGB(30, 255, 0),
					Thickness = 3,
				}),

				e("UICorner", {
					CornerRadius = UDim.new(0, 11),
				}),

				e("UIScale", {
					Scale = scale,
				}),
			}),
		})
	end

	local container = Instance.new("ScreenGui")
	container.Name = "Ripple"
	container.Parent = Players.LocalPlayer.PlayerGui

	local root = ReactRoblox.createRoot(container)
	root:render(e(Button))
end

return ripple
