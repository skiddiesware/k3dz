
return {
    {
        TabKey  = "Main",
        Name    = "AutoFlashback",    -- internal ID
        Title   = "Auto-Flashback",
        Default = false,
        OnChanged = function(enabled)
            local Players = game:GetService("Players")
            local P = Players.LocalPlayer
            local lastCFrame

            -- Helper: store last CFrame on death
            local function track(character)
                character:WaitForChild("Humanoid").Died:Connect(function()
                    local root = character:FindFirstChild("HumanoidRootPart")
                    if root then
                        lastCFrame = root.CFrame
                    end
                end)
            end

            -- When respawning, teleport back
            local function flashback(character)
                character:WaitForChild("HumanoidRootPart")
                if lastCFrame then
                    character.HumanoidRootPart.CFrame = lastCFrame
                    Fluent:Notify({
                        Title      = "Flashback",
                        Content    = tostring(lastCFrame),
                        SubContent = "",
                        Duration   = 2
                    })
                end
            end

            if enabled then
                -- If already alive, start tracking
                if P.Character then
                    track(P.Character)
                end
                -- Hook future spawns
                P.CharacterAdded:Connect(function(char)
                    track(char)
                    flashback(char)
                end)
            else
                -- Clear stored position and connections
                lastCFrame = nil
                -- (You may want to disconnect listeners here if you stored them.)
            end
        end
    },
    -- you can add more toggles here…
}
