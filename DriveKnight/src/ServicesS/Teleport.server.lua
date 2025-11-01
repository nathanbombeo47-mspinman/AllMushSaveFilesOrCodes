local touchedspawn = game.Workspace.TeleportPoint
local teleportpoint = game.Workspace.TeleportPart

touchedspawn.Touched:Connect(function(hit)
	local player = game.Players:GetPlayerFromCharacter(hit.Parent)
	if player then
		task.wait(.01)
		local humanoidpart = player.Character:WaitForChild("HumanoidRootPart")
		humanoidpart.Position = teleportpoint.Position + Vector3.new(0, 5, 0)
	end
end)
