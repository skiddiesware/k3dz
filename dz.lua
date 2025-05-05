local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local skidzVersion = "1.3"

local Window = Fluent:CreateWindow({
    Title = "K3DZ " .. skidzVersion,
    SubTitle = "by skiddies",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftAlt -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Universal", Icon = "" }),

    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

local function n(t,c,s,d)
   Fluent:Notify({
      Title = t,
      Content = c,
      SubContent = s,
      Duration = d
  })
end

do

    Tabs.Main:AddButton({
        Title = "Infinite Yield",
        Description = "IY",
        Callback = function()
         loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        end
    })

        Tabs.Main:AddButton({
        Title = "LALOL",
        Description = "BACKDOOR",
        Callback = function()
         loadstring(game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script'))()
        end
    })

    Tabs.Main:AddButton({
      Title = "MICRO",
      Description = "BACKDOOR",
      Callback = function()
         loadstring(game:HttpGet("https://paste.ee/r/GipgWZb8"))()
      end
  })

  Tabs.Main:AddButton({
   Title = "SolSpy",
   Description = "alternative of remoteSpy",
   Callback = function()
      loadstring(game:HttpGet("https://gist.githubusercontent.com/Uylost/960b592d7fc7161c3e6de0047547d874/raw/cc0e9ca436afe2c3e253fdb357d1a61efd576098/gistfile1.txt"))()
   end
})

Tabs.Main:AddButton({
   Title = "freaky R6 Animations",
   Description = "freak",
   Callback = function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/ShutUpJamesTheLoser/freaky/refs/heads/main/fe", true))()
   end
})
    
Tabs.Main:AddButton({
   Title = "FE R6 Animations",
   Description = "this one focus more on gameplay",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/redxs-dosx/R6-Anim-Hub/refs/heads/main/Hub%20Script%20(.lua)'))()
   end
})

Tabs.Main:AddButton({
   Title = "Aqua FE R6 Animations",
   Description = "this is the best animation script with a ton of animations",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploitFin/AquaMatrix/refs/heads/AquaMatrix/AquaMatrix"))()
   end
})

local P = game:GetService"Players".LocalPlayer
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
    spawn(function()
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

    local Slider = Tabs.Main:AddSlider("Slider", {
        Title = "WalkSpeed",
        Description = "quick slider",
        Default = 16,
        Min = 0,
        Max = 256,
        Rounding = 1,
        Callback = function(Value)
            game:GetService("Players").LocalPlayer["Character"]:FindFirstChildWhichIsA("Humanoid").WalkSpeed = Value
        end
    })


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("K3DZ")
SaveManager:SetFolder("K3DZ")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)


-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
