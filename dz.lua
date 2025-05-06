local Fluent           = loadstring(game:HttpGet("https://…/main.lua"))()
local SaveManager      = loadstring(game:HttpGet("https://…/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://…/InterfaceManager.lua"))()

-- modular
local buttonList = loadstring(game:HttpGet("https://raw.githubusercontent.com/skiddiesware/k3dz/refs/heads/main/return/dz_btn1.lua"))()
local tabDefs    = loadstring(game:HttpGet("https://raw.githubusercontent.com/skiddiesware/k3dz/refs/heads/main/return/dz_tab1.lua"))()
local toggles    = loadstring(game:HttpGet("https://raw.githubusercontent.com/skiddiesware/k3dz/refs/heads/main/return/dz_toggle1.lua"))()
local sliders    = loadstring(game:HttpGet("https://raw.githubusercontent.com/skiddiesware/k3dz/refs/heads/main/return/dz_slider1.lua"))()

local Window = Fluent:CreateWindow({
    Title      = "K3DZ - by skiddies",
    SubTitle   = tostring(identifyexecutor()) or "",
    TabWidth   = 160,
    Size       = UDim2.fromOffset(580,460),
    Acrylic    = false,
    Theme      = "Dark",
    MinimizeKey= Enum.KeyCode.LeftControl
})

-- tabs
local Tabs = {}
for key, params in pairs(tabDefs) do
    Tabs[key] = Window:AddTab({ Title = params.Title, Icon = params.Icon })
end

-- buttons
for _, btn in ipairs(buttonList) do
    Tabs[btn.TabKey]:AddButton({
        Title       = btn.Title,
        Description = btn.Description,
        Callback    = btn.Callback
    })
end

-- toggles
for _, tog in ipairs(toggles) do
    local widget = Tabs[tog.TabKey]:AddToggle(tog.Name, {
        Title   = tog.Title,
        Default = tog.Default
    })
    widget:OnChanged(tog.OnChanged)
end

-- sliders
for _, sld in ipairs(sliders) do
    Tabs[sld.TabKey]:AddSlider(sld.Name, {
        Title       = sld.Title,
        Description = sld.Description,
        Default     = sld.Default,
        Min         = sld.Min,
        Max         = sld.Max,
        Rounding    = sld.Rounding,
        Callback    = sld.Callback
    })
end

-- addons
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
InterfaceManager:SetFolder("K3DZ")
SaveManager:SetFolder("K3DZ")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)
SaveManager:LoadAutoloadConfig()
