-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")

--Properties:

ScreenGui.Name = ""
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.5, 0)
Frame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, 0, 0, 0)
Frame.Size = UDim2.new(0.25, 0, 0.100000001, 0)
Frame.ZIndex = 2

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Size = UDim2.new(1, 0, 1.5, 0)
TextButton.ZIndex = 3
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Execute"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextTransparency = 1.000
TextButton.TextWrapped = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.ZIndex = 2
TextLabel.Font = Enum.Font.Arcade
TextLabel.Text = "SKIDDIES CLIENT B00M3R"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextStrokeColor3 = Color3.fromRGB(182, 182, 182)
TextLabel.TextTransparency = 0
TextLabel.TextWrapped = true

ImageLabel.Parent = Frame
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Size = UDim2.new(1, 0, 1, 0)
ImageLabel.Image = "rbxassetid://79689613388371"
ImageLabel.ScaleType = Enum.ScaleType.Fit


local chats = {
	"no way",
	"dude im getting hacked rn",
	"fuck!",
	"skiddies is so fucking cool!",
	"guys check out skiddies script",
	"holy fuck!",
	"holy shit!",
	"bastard!",
	"skiddies hacked us!",
	"!!",
	"who's c00lkidd?",
	"we are better!",
	"who's 1x1x1x1?",
	"you must burn in hell!",
	"im a big fart horse",
	"im a sucker",
	"i hate mayonnaise",
	"fuck all of you!",
	"shit in my mouth",
	"fuck OFF!"
}

local labels = {
	"oh noes!",
	"pwned?",
	"cooked?",
	"pwned by skiddies",
	"lol",
	"noob",
	"loser",
	"idiot",
	"SKIDDER",
	"skiddies",
	"you are an idiot!",
	"best skidder script!!",
	"best client exploit script!",
	tostring(math.random(1,1000))
}

local function materials(ins)
	if not ins:IsA("BasePart") then return end
	local mate = {
		Enum.Material.Ice,
		Enum.Material.Mud,
		Enum.Material.Neon,
		Enum.Material.SmoothPlastic,
		Enum.Material.Wood,
		Enum.Material.WoodPlanks,
		Enum.Material.Rock,
		Enum.Material.Sand,
		Enum.Material.Grass,
		Enum.Material.Brick,
		Enum.Material.Metal,
		Enum.Material.Slate,
		Enum.Material.Glass
	}
	
	ins.Material = mate[math.random(1,#mate)]
end

local function decal(ins)
	if not ins:IsA("BasePart") then return end
	local normal = {
		Enum.NormalId.Front,
		Enum.NormalId.Top,
		Enum.NormalId.Back,
		Enum.NormalId.Left,
		Enum.NormalId.Right,
		Enum.NormalId.Bottom
	}
	for i = 1,6 do
		local d = Instance.new("Decal")
		d.Face = normal[i] -- Set the Face property
		d.Parent = ins
		d.Texture = "rbxassetid://642982718"
	end
end

local function typewritter(h,to)
	local len = string.len(to)
	for i = 1,len do
		local sub = string.sub(to,1,i)
		h.Text = sub
		task.wait(.1)
	end
end

local tee = TextButton
tee.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
	local col = Instance.new("ColorCorrectionEffect")
	col.Parent = game.Lighting
	col.TintColor = Color3.new(1,1,1)
	
	local hint = Instance.new("Hint")
	hint.Parent = game.Workspace
	hint.Text = ""
	typewritter(hint,"Hello, can i (SKIDDER V1) join???")
	
	local t = game:GetService("Players"):GetPlayers()
	for i, v in pairs(t) do
		local g = v.PlayerGui
		local k = Instance.new("ScreenGui")
		k.Name = "KIDDIES"
		k.IgnoreGuiInset = true
		k.Parent = g
	end
	local snd = Instance.new("Sound")
	snd.Parent = game.SoundService
	snd.SoundId = "rbxassetid://119396360218015"
	snd.Volume = 1
	while not snd.IsLoaded and task.wait() do task.wait() end
	snd:Play()
	for i = 1, 100 do
		local team = game:GetService("Teams")
		local te = Instance.new("Team")
		te.Parent = team
		te.TeamColor = BrickColor.random()
		te.Name = "SKIDDIES V"..tostring(#team:GetChildren()).."_"..labels[math.random(1,#labels)]
	end
	for i = 1,20 do

		
		for i, v in pairs(t) do
			local x = math.random()
			local y = math.random()
			local r = math.random(-15,15)
			local t = Instance.new("TextLabel")
			t.Parent = v.PlayerGui:FindFirstChild("KIDDIES")
			t.Name = "SKIDDIES"
			t.Size = UDim2.new(0.2,0,0.2,0)
			t.Position = UDim2.new(x,0,y,0)
			t.BackgroundTransparency = 1
			t.TextScaled = true
			t.Text = labels[math.random(1,#labels)]
			t.Rotation = r
			t.TextColor3 = Color3.fromHSV(math.random(),1,1)
			t.AnchorPoint = Vector2.new(0.5,0.5)
		end
		task.wait(.2)
	end
	
	typewritter(hint,"Thanks!!")
	task.delay(5, function()
		typewritter(hint, ">:)))))))))))))))")
	end)
	for i, v in pairs(game.Workspace:GetDescendants()) do
		if v:IsA("BasePart") then
			materials(v)
			decal(v)
		end
	end
	
	snd:Stop()
	snd.SoundId = "rbxassetid://72089843969979"
	snd.Volume = 0
	snd.PlaybackSpeed = 0.2
	snd.Looped = true
	while not snd.IsLoaded and task.wait() do task.wait() end
	snd:Play()
	game:GetService("TweenService"):Create(snd,TweenInfo.new(2,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{Volume = 0.5}):Play()
	for i, v in pairs(t) do
		local o = v.PlayerGui:FindFirstChild("KIDDIES")
		if o then o:Destroy() end
	end
	


	game:GetService("TweenService"):Create(col,TweenInfo.new(2,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{TintColor = Color3.fromRGB(255,0,0)}):Play()
	game:GetService("RunService").Heartbeat:Connect(function()
		local loud = snd.PlaybackLoudness*0.001
		col.Brightness = math.clamp(loud,0,10)
		col.Contrast = math.clamp(loud,0,10)
		col.Saturation = math.clamp(loud,0,10)
	end)
	
	while task.wait(.1) do
		t = game.Players:GetPlayers()
		local m = math.random(1,#t)
		local p = t[m]
		local rng = math.random(1,30)
		if rng == 10 then
			local z = math.random(1,#chats)
			game:GetService("Chat"):Chat(p.Character:FindFirstChild("Head"),chats[z])
			end
		if rng == 20 then
			local part = Instance.new("Part")
			part.Parent = workspace
			part.Shape = Enum.PartType.Ball
			part.Size = Vector3.new(100,100,100)
			part.Position = Vector3.new(math.random(-256,256),512,math.random(-256,256))
			part.Anchored = false
			part.CanCollide = false
				materials(part)
				end
		if rng == 30 then
			col.TintColor = Color3.fromHSV(math.random(),1,1)
		end
		if rng == 1 then
			for i, v in pairs(game.Workspace:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Orientation = v.Orientation + Vector3.new(math.random(-1,1),math.random(-1,1),math.random(-1,1))
					v.BrickColor = BrickColor.random()
				end
			end
		end
		if rng == 15 then
			local sub = math.random(1,10)
			if sub == 1 then
			local snd = Instance.new("Sound")
			snd.Parent = game.SoundService
			snd.SoundId = "rbxassetid://82347871291422"
			snd.Volume = 1
			snd:Play()
			local con
			con = snd.Ended:Connect(function()
				snd:Destroy()
				con:Disconnect()
				end)
			elseif sub == 2 then
				local snd = Instance.new("Sound")
				snd.Parent = game.SoundService
				snd.SoundId = "rbxassetid://99111746256045"
				snd.Volume = 1
				snd:Play()
				local con
				con = snd.Ended:Connect(function()
					snd:Destroy()
					con:Disconnect()
				end)
			elseif sub == 3 then
				local snd = Instance.new("Sound")
				snd.Parent = game.SoundService
				snd.SoundId = "rbxassetid://126083075694948"
				snd.Volume = 1
				snd:Play()
				local con
				con = snd.Ended:Connect(function()
					snd:Destroy()
					con:Disconnect()
				end)
			elseif sub == 4 then
				local snd = Instance.new("Sound")
				snd.Parent = game.SoundService
				snd.SoundId = "rbxassetid://85476550721789"
				snd.Volume = 1
				snd:Play()
				local con
				con = snd.Ended:Connect(function()
					snd:Destroy()
					con:Disconnect()
				end)
			elseif sub >= 5 then
				game.Lighting.ClockTime = math.random(0,24)
				end
		end
		game.Lighting.GeographicLatitude = math.random(0,360)
		p.Character:FindFirstChildWhichIsA("Humanoid").Health = math.random(1,p.Character:FindFirstChildWhichIsA("Humanoid").MaxHealth)
		p.Character:FindFirstChildWhichIsA("Humanoid").DisplayName = "SKIDDIES V1" 
		local hmd = p.Character:FindFirstChildWhichIsA("Humanoid")
		hmd.WalkSpeed = math.random(16,160)
		hmd.WalkToPoint = Vector3.new(math.random(-1,1),0,math.random(-1,1))
		p.Team = game.Teams:GetChildren()[math.random(1,#game.Teams:GetChildren())]
	end
end)
