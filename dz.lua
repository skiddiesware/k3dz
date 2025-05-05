local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local skidzVersion = "1.3"

local Window = Fluent:CreateWindow({
    Title = "K3DZ " .. skidzVersion,
    SubTitle = "by skiddies",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftAlt
})

local Tabs = {
    Main = Window:AddTab({ Title = "Universal", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

local function n(t, c, s, d)
    Fluent:Notify({
        Title = t,
        Content = c,
        SubContent = s,
        Duration = d
    })
end

-- Buttons
local buttonList = {
    {
        Title = "Infinite Yield",
        Description = "IY",
        URL = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"
    },
    {
        Title = "LALOL",
        Description = "BACKDOOR",
        URL = "https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script"
    },
    {
        Title = "MICRO",
        Description = "BACKDOOR",
        URL = "https://paste.ee/r/GipgWZb8"
    },
    {
        Title = "SolSpy",
        Description = "alternative of remoteSpy",
        URL = "https://gist.githubusercontent.com/Uylost/960b592d7fc7161c3e6de0047547d874/raw/cc0e9ca436afe2c3e253fdb357d1a61efd576098/gistfile1.txt"
    },
    {
        Title = "freaky R6 Animations",
        Description = "freak",
        URL = "https://raw.githubusercontent.com/ShutUpJamesTheLoser/freaky/refs/heads/main/fe"
    },
    {
        Title = "FE R6 Animations",
        Description = "this one focus more on gameplay",
        URL = "https://raw.githubusercontent.com/redxs-dosx/R6-Anim-Hub/refs/heads/main/Hub%20Script%20(.lua)"
    },
    {
        Title = "Aqua FE R6 Animations",
        Description = "this is the best animation script with a ton of animations",
        URL = "https://raw.githubusercontent.com/ExploitFin/AquaMatrix/refs/heads/AquaMatrix/AquaMatrix"
    }
}

for _, btn in pairs(buttonList) do
    Tabs.Main:AddButton({
        Title = btn.Title,
        Description = btn.Description,
        Callback = function()
            loadstring(game:HttpGet(btn.URL))()
        end
    })
end

-- Auto-Flashback Toggle
local P = game:GetService("Players").LocalPlayer
local lastC

local toggle = Tabs.Main:AddToggle("Auto-Flashback", {
    Title = "Auto-Flashback",
    Default = false
})

local function s(c)
    c:WaitForChild("Humanoid").Died:Connect(function()
        local r = c:FindFirstChild("HumanoidRootPart")
        if r then lastC = r.CFrame end
    end)
    task.spawn(function()
        c:WaitForChild("HumanoidRootPart")
        if lastC then c.HumanoidRootPart.CFrame = lastC end
    end)
end

toggle:OnChanged(function(v)
    if v then
        if P.Character then s(P.Character) end
        P.CharacterAdded:Connect(s)
    else
        lastC = nil
    end
end)

-- WalkSpeed Slider
Tabs.Main:AddSlider("Slider", {
    Title = "WalkSpeed",
    Description = "quick slider",
    Default = 16,
    Min = 0,
    Max = 256,
    Rounding = 1,
    Callback = function(Value)
        local humanoid = P.Character and P.Character:FindFirstChildWhichIsA("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = Value
        end
    end
})

-- Addons Setup
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("K3DZ")
SaveManager:SetFolder("K3DZ")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)
SaveManager:LoadAutoloadConfig()
