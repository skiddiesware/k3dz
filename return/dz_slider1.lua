return {
    {
        TabKey      = "Main",
        Name        = "WalkSpeed",
        Title       = "WalkSpeed",
        Description = "Quick slider",
        Default     = 16,
        Min         = 0,
        Max         = 256,
        Rounding    = 1,
        Callback    = function(val)
            local P = game:GetService("Players").LocalPlayer
            local h = P.Character and P.Character:FindFirstChildWhichIsA("Humanoid")
            if h then h.WalkSpeed = val end
        end
    },
    -- more sliders…
}
