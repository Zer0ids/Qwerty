setclipboard(tostring("tag69"))

local rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local window = rayfield:CreateWindow({
	Name="Untitled Tag UI",
	LoadingTitle="TAG GAME SCRIPT",
	LoadingSubtitle="New script utility!",
	ConfigurationSaving={
		Enabled=true,
		FolderName=nil,
		FileName="tag-src-v5"
	},
	Discord={
		Enabled=false,
		Invite=".gg",
		RememberJoins=false
	},
	KeySystem=true,
	KeySettings={
		Title="Authentication!",
		Subtitle="key authentication system",
		Note="Key: On clipboard! (tag69)",
		FileName="key0696",
		SaveKey=true,
		GrabKeyFromSite=false,
		Key="tag69"
	}
})
---
local tags = window:CreateTab("Tag Cheats",11470498652)

local size = 2
tags:CreateParagraph({
	Title="NOTICE!",
	Content="Notice any bugs expected in this script! This script is still in development! A new save file will be used if updates happen!"
})
tags:CreateToggle({
	Name="Toggle Hitboxes",
	CurrentValue=false,
	Flag="Toggle-Hitboxes",
	Callback=function(Bool)
		local hbe = nil
		if Bool == true then
			hbe = game:GetService("RunService").RenderStepped:Connect(function()
				for _,v in pairs(game.Players:GetPlayers()) do
					if v ~= game.Players.LocalPlayer and v.Name ~= game.Players.LocalPlayer.Name then
						v.Character:FindFirstChild("HumanoidRootPart").Size = Vector3.new(size,size,size)
						v.Character:FindFirstChild("HumanoidRootPart").Transparency = 0.6
					end
				end
			end)
		elseif Bool == false then
			hbe:Disconnect()
			for _,v in pairs(game.Players:GetPlayers()) do
				if v ~= game.Players.LocalPlayer and v.Name ~= game.Players.LocalPlayer.Name then
					v.Character:FindFirstChild("HumanoidRootPart").Size = Vector3.new(2,2,1)
					v.Character:FindFirstChild("HumanoidRootPart").Transparency = 1
				end
			end
		end
	end
})
tags:CreateSlider({
	Name="Hitbox Size",
	Range={1,30},
	Increment=1,
	Suffix="Size",
	CurrentValue=2,
	Flag="Hitbox-Size",
	Callback=function(Num)
		size=Num
	end
})
---
local loplr = window:CreateTab("Client Cheats",11470602303)
local ws = 30
local jp = 32
local hh = 0
loplr:CreateParagraph({
	Title="NOTICE!",
	Content="Notice any bugs expected in this script! This script is still in development! A new save file will be used if updates happen!"
})
loplr:CreateToggle({
	Name="Spoof Walkspeed",
	CurrentValue=false,
	Flag="Spoof-Walkspeed",
	Callback=function(Bool)
		local wsen = nil
		if Bool == true then
			wsen = game:GetService("RunService").RenderStepped:Connect(function()
				game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = ws
			end)
		elseif Bool == false then
			wsen:Disconnect()
		end
	end
})
loplr:CreateSlider({
	Name="Walkspeed",
	Range={24,100},
	Increment=1,
	Suffix="Speed",
	CurrentValue=30,
	Flag="Modify-Walkspeed",
	Callback=function(Num)
		ws=Num
	end
})
loplr:CreateToggle({
	Name="Spoof Jump Power",
	CurrentValue=false,
	Flag="Spoof-Jump-Power",
	Callback=function(Bool)
		local jpen = nil
		if Bool == true then
			jpen = game:GetService("RunService").RenderStepped:Connect(function()
				game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = jp
			end)
		elseif Bool == false then
			jpen:Disconnect()
		end
	end
})
loplr:CreateSlider({
	Name="Jump Power",
	Range={24,150},
	Increment=2,
	Suffix="Power",
	CurrentValue=32,
	Flag="Modify-Jump-Power",
	Callback=function(Num)
		jp=Num
	end
})
loplr:CreateToggle({
	Name="Spoof Hip Height",
	CurrentValue=false,
	Flag="Spoof-Hip-Height",
	Callback=function(Bool)
		local hhen = nil
		if Bool == true then
			hhen = game:GetService("RunService").RenderStepped:Connect(function()
				game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").HipHeight = hh
			end)
		elseif Bool == false then
			hhen:Disconnect()
			game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").HipHeight = 0
		end
	end
})
loplr:CreateSlider({
	Name="Hip Height",
	Range={0,75},
	Increment=1,
	Suffix="Height",
	CurrentValue=0,
	Flag="Modify-Hip-Height",
	Callback=function(Num)
		hh=Num
	end
})
loplr:CreateToggle({
	Name="Infinite Jump",
	CurrentValue=false,
	Flag="Infinite-Jump",
	Callback=function(Bool)
		local ifj = nil
		if Bool == true then
			ifj = game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(key)
				if key:lower():byte() == 32 then
					game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
				end
			end)
		elseif Bool == false then
			ifj:Disconnect()
		end
	end
})
loplr:CreateToggle({
	Name="Fast Climb",
	CurrentValue=false,
	Flag="Fast-Climb",
	Callback=function(Bool)
		local noc = nil
		if Bool == true then
			noc = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").StateChanged:Connect(function(old,new)
				if new.Name == "Climbing" then
					game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Jump = true
				end
			end)
		elseif Bool == false then
			noc:Disconnect()
		end
	end
})

---
local misc = window:CreateTab("Other / Misc",11470615426)
misc:CreateParagraph({
	Title="NOTICE!",
	Content="Notice any bugs expected in this script! This script is still in development! A new save file will be used if updates happen!"
})
misc:CreateButton({
	Name="Auto-Collect Coins (One-Time-Only!)",
	Callback=function()
		rayfield:Destroy()
		loadstring(game:HttpGet("https://github.com/Zer0ids/Qwerty/UntitledTag/Autocollect",true))()
	end
})
misc:CreateToggle({
	Name="Loop Fullbright",
	CurrentValue=false,
	Flag="Loop-Fullbright",
	Callback=function(Bool)
		local lfb = nil
		if Bool == true then
			lfb = game:GetService("RunService").RenderStepped:Connect(function()
				game.Lighting.GlobalShadows = false
				game.Lighting:FindFirstChildOfClass("Atmosphere"):Destroy()
				game.Lighting.Brightness = 2
				game.Lighting.Ambient = Color3.new(0.498039, 0.498039, 0.498039)
				game.Lighting.OutdoorAmbient = Color3.new(0.498039, 0.498039, 0.498039)
				game.Lighting.ClockTime = 14
			end)
		elseif Bool == false then
			lfb:Disconnect()
		end
	end
})

---
rayfield:LoadConfiguration()
