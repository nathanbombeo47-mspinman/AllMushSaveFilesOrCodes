local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local Ripple = require(ReplicatedStorage.Packages.Ripple)
local createSpring = Ripple.createSpring
local createTween = Ripple.createTween
local e = React.createElement
local event2 = React.Event
local event = React.Event
local sou = ReplicatedStorage.Sound["pop!"]

local mo = {}

function mo.init()
	local NUM = 1

	local val, set = React.useBinding(NUM)
	local pos, setPos = React.useState(-1)

	local spring = React.useMemo(function()
		return createSpring(1, {
			tension = 3,
			friction = 1,
			frequency = 3,
			start = true,
		})
	end)

	local tween = React.useMemo(function()
		return createTween(pos, {
			easing = "linear",
			duration = 0.4,
			start = true,
		})
	end)

	tween:onChange(function(value)
		setPos(value)
	end)

	spring:onChange(function(self)
		set(self)
	end)

	local rawVal, setVal = React.useState(false)

	React.useEffect(function()
		if rawVal == true then
			tween:setGoal(0.5)
		else
			tween:setGoal(-2)
		end
	end, { rawVal })

	return e(React.Fragment, nil, {
		e("Frame", {
			Size = UDim2.fromScale(0.5, 0.5),
			Position = UDim2.fromScale(0.5, pos),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.1,
			Visible = true,
		}, {
			e("TextLabel", {
				Text = "Shop",
				TextScaled = true,
				Size = UDim2.fromOffset(100, 30),
				Position = UDim2.fromScale(0.5, 0.05),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 0.5,
				TextColor3 = Color3.fromRGB(0, 0, 0),
			}, {
				e("UICorner", {
					CornerRadius = UDim.new(0, 50),
				}),
			}),

			e("UICorner", {
				CornerRadius = UDim.new(0, 6),
			}),

			e("UIStroke", {
				Thickness = 10,
				Color = Color3.fromRGB(255, 0, 43),
			}),
		}),

		e("ImageButton", {
			Size = UDim2.fromScale(0.05, 0.09),
			Position = UDim2.fromScale(0.005, 0.55),
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundTransparency = 0.5,
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			Image = "rbxassetid://122026226288611",
			[event2.MouseButton1Click] = function()
				setVal(not rawVal)
				sou:Play()
				task.wait(0.25)
				sou:Stop()
			end,
			[event.MouseEnter] = function()
				spring:setGoal(1.3)
			end,
			[event.MouseLeave] = function()
				spring:setGoal(1.01)
			end,
		}, {
			e("UIScale", {
				Scale = val,
			}),

			e("UICorner", {
				CornerRadius = UDim.new(0, 5),
			}),

			e("UIStroke", {
				Thickness = 0.9,
			}),
		}),
	})
end

return mo
