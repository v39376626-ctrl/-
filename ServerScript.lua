-- ServerScript (наприклад, в ServerScriptService)
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        local rootPart = character:WaitForChild("HumanoidRootPart")
        local auraRange = 10
        local knockbackForce = 6000
        
        local function knockback(otherRoot)
            local direction = (otherRoot.Position - rootPart.Position).Unit
            otherRoot.Velocity = direction * knockbackForce
        end
        
        while true do
            task.wait(0.1)
            if not rootPart.Parent then break end
            for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
                if otherPlayer ~= player then
                    local otherChar = otherPlayer.Character
                    if otherChar then
                        local otherRoot = otherChar:FindFirstChild("HumanoidRootPart")
                        if otherRoot and (otherRoot.Position - rootPart.Position).Magnitude <= auraRange then
                            knockback(otherRoot)
                        end
                    end
                end
            end
        end
    end)
end)
