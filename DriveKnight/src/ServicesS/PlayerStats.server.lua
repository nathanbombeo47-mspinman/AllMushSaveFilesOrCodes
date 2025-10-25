game.Players.PlayerAdded:Connect(function(plr)
	local playerstats = Instance.new("Folder")
	playerstats.Parent = plr
	playerstats.Name = "leaderstats"
	
	local count = Instance.new("IntValue")
	count.Parent = playerstats
	count.Name = "Pesos"
	count.Value = 10
end)