game.Players.PlayerAdded:Connect(function(playr)
local leaderstats = Instance.new("Folder", playr)
leaderstats.Name = "leaderstats"

local pesos = Instance.new("IntValue",  leaderstats)
pesos.Name = "Pesos"
pesos.Value = 1000
end)

local remotefunction2 = game.ReplicatedStorage.Remotes.GiveItem

remotefunction2.OnServerInvoke = function(playr, toolName, pricetool)
    local purchaseSuccess = false

local leaderstats = playr.leaderstats
local pesos = leaderstats.Pesos

if pesos.Value >= pricetool then
    pesos.Value -= pricetool
     
    local tools = game.ServerStorage.ToolStorage:FindFirstChild(toolName)
    if tools then
       local clonedTool = tools:Clone()
       clonedTool.Parent = playr.Backpack
    end

    purchaseSuccess = true
   end

   return purchaseSuccess
end
