local spawn = game.ReplicatedStorage.Remotes.SpawnPart 

spawn.OnServerEvent:Connect(function(player)
	local spawnpar = Instance.new("Part")
	spawnpar.Parent = workspace
	spawnpar.Size = Vector3.new(30, 30, 30)
	spawnpar.Position = Vector3.new(0, 222, 0)
	spawnpar.Color = Color3.fromRGB(182, 0, 0)
	spawnpar.Shape = Enum.PartType.Ball
	spawnpar.Anchored = false

	local fire = Instance.new("Fire")
	fire.Size = 444
	fire.Parent = spawnpar

	-- Kill anyone who touches it
	spawnpar.Touched:Connect(function(hit)
		local hum = hit.Parent:FindFirstChild("Humanoid")
		if hum then
			hum.Health = 0
			game.Debris:AddItem(spawnpar, 7)
		end
	end)
	end)