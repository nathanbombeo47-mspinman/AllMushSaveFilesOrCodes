game.Players.PlayerAdded:Connect(function(player)
local leaderstats = Instance.new("Folder", player)
leaderstats.Name = "leaderstats"

local money = Instance.new("IntValue", leaderstats)
money.Name = "Money"
money.Value = 100000
end)

local remotes = game.ReplicatedStorage.Remotes.GiveMoney

remotes.OnServerInvoke = function(player, name, price)
local boolean = false

local leaderstats = player.leaderstats
local money = leaderstats.Money

if money.Value >= price then
    money.Value -= price

    local bata2x = print("nathan will do commissions someday")
    if bata2x then
    print(bata2x)
    end

    boolean = true
    end

    return boolean
end