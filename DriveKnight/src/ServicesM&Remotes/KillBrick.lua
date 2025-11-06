local bata2x = {}

function bata2x.toucher(part)
    part.Touched:Connect(function(human)
        local humanoid = human.Parent
        local life = humanoid:FindFirstChild("Humanoid")

        if life then
            life.Health = 0
        end
    end)
end

return bata2x