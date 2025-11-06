local spawn = game.ReplicatedStorage.Remotes.SpawnPart 
local x = 175
local y = 175
local z = 175

spawn.OnServerEvent:Connect(function(player)
	local spawnpar = Instance.new("Part")
	local position = Vector3.new(
		math.random(-x, x),
		y,
		math.random(-x, x)
	)
	spawnpar.Position = position
	spawnpar.Parent = workspace
	spawnpar.Size = Vector3.new(30, 30, 30)
	spawnpar.Color = Color3.fromRGB(182, 0, 0)
	spawnpar.Shape = Enum.PartType.Ball
	spawnpar.Anchored = false

	local fire = Instance.new("Fire")
	fire.Size = 444
	fire.Parent = spawnpar
	
end)