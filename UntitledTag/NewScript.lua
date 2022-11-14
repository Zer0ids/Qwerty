local self = game.Players.LocalPlayer
local humanoid = self.Character:FindFirstChildOfClass("Humanoid")
local runS = game:GetService("RunService")
local Lighting = game.Lighting

if humanoid.UseJumpPower == false then
	humanoid.UseJumpPower = true
end

local uiLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local window = uiLib:CreateWindow({
	Name = "UTG V2",
	LoadingTitle = "Untitled Tag Script V2",
	LoadingSubtitle = "by Ranxware",
	ConfigurationSaving = {
		Enabled = false
	},
	KeySystem = false
})
local tab1 = window:CreateTab("Tag Cheats")
tab1:CreateSection("Hitbox")
local hb = 2
local hbtrans = 0.6
tab1:CreateToggle({Name="Extend Hitboxes",CurrentValue=false,Callback=function(value)
	if value == true then
		runS:BindToRenderStep("HitboxExtend",Enum.RenderPriority.Character.Value,function()
			for _,v in pairs(game.Players:GetPlayers()) do
				if v ~= self and v.Name ~= self.Name then
					local root = v.Character:FindFirstChildOfClass("Humanoid").RootPart
					if root then
						root.Size = Vector3.new(hb,hb,hb)
						root.Transparency = hbtrans
					end
				end
			end
		end)
	else
		runS:UnbindFromRenderStep("HitboxExtend")
		for _,v in pairs(game.Players:GetPlayers()) do
			if v ~= self and v.Name ~= self.Name then
				local root = v.Character:FindFirstChildOfClass("Humanoid").RootPart
				if root then
					root.Size = Vector3.new(2,2,1)
					root.Transparency = 1
				end
			end
		end
	end
end})
tab1:CreateSlider({Name="Hitbox Size",Range={2,25},Increment=1,CurrentValue=2,Suffix="studs",Callback=function(value)
	hb = value
end})
tab1:CreateSlider({Name="Hitbox Transparency",Range={0,1},Increment=0.1,CurrentValue=0.6,Suffix="%",Callback=function(value)
	hbtrans = value
end})
tab1:CreateSection("Autotag")
local at_teamcheck = false
local at_offset = 3
tab1:CreateToggle({Name="Autotag Enabled",CurrentValue=false,Callback=function(value)
	if value == true then
		runS:BindToRenderStep("Autotag",Enum.RenderPriority.Character.Value,function()
			local root = self.Character:FindFirstChildOfClass("Humanoid").RootPart
			local hrp = workspace:FindPartOnRay(Ray.new(root.Position,root.CFrame.LookVector*at_offset),self.Character)
			if hrp and hrp.Name == "HumanoidRootPart" and game.Players[hrp.Parent.Name].PlayerRole.Value ~= "Dead" then
				if at_teamcheck == true then
					if game.Players[hrp.Parent.Name].PlayerRole.Value ~= self.PlayerRole.Value then
						mouse1click()
					end
				else
					mouse1click()
				end
			end
		end)
	else
		runS:UnbindFromRenderStep("Autotag")
	end
end})
tab1:CreateToggle({Name="Autotag Team Check",CurrentValue=false,Callback=function(value)
	at_teamcheck = value
end})
tab1:CreateSlider({Name="Autotag Distance",Range={1,4},Increment=.5,CurrentValue=3,Suffix="studs",Callback=function(value)
	at_offset = value
end})
local tab2 = window:CreateTab("Movement")
tab2:CreateSection("Character")
local ws,jp = 30,32
tab2:CreateToggle({Name="Walkspeed",CurrentValue=false,Callback=function(value)
	if value == true then
		runS:BindToRenderStep("Walkspeed",Enum.RenderPriority.Character.Value,function()
			humanoid.WalkSpeed = ws
		end)
	else
		runS:UnbindFromRenderStep("Walkspeed")
	end
end})
tab2:CreateSlider({Name="Walkspeed Value",Range={30,100},CurrentValue=30,Increment=1,Suffix="studs/s",Callback=function(value)
	ws = value
end})
tab2:CreateToggle({Name="Jumppower",CurrentValue=false,Callback=function(value)
	if value == true then
		runS:BindToRenderStep("Jumppower",Enum.RenderPriority.Character.Value,function()
			humanoid.JumpPower = jp
		end)
	else
		runS:UnbindFromRenderStep("Jumppower")
	end
end})
tab2:CreateSlider({Name="Jumppower Value",Range={32,150},CurrentValue=32,Increment=1,Callback=function(value)
	jp = value
end})
tab2:CreateSection("Physical")
local infjump
tab2:CreateToggle({Name="Infinite Jump",CurrentValue=false,Callback=function(value)
	if value == true then
		infjump = game:GetService("UserInputService").InputBegan:Connect(function(input,gpe)
			if gpe then return end
			if input.KeyCode == Enum.KeyCode.Space then
				humanoid:ChangeState("Jumping")
				wait()
				humanoid:ChangeState("Seated")
			end
		end)
	else
		infjump:Disconnect()
	end
end})
local fc
tab2:CreateToggle({Name="Fast Climb",CurrentValue=false,Callback=function(value)
	if value == true then
		fc = humanoid.Climbing:Connect(function()
			humanoid.Jump = true
		end)
	else
		fc:Disconnect()
	end
end})
local tab3 = window:CreateTab("Other")
tab3:CreateToggle({Name="Autocollect Coins",CurrentValue=false,Callback=function(value)
	local coinLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Zer0ids/Qwerty/main/UntitledTag/Autocollect"))()
	if value == true then
		coinLib:Load()
	else
		coinLib:Unload()
	end
end})
tab3:CreateToggle({Name="Loop Fullbright",CurrentValue=false,Callback=function(value)
	if value == true then
		runS:BindToRenderStep("LoopFB",Enum.RenderPriority.Camera.Value,function()
			Lighting.Brightness = 2
			Lighting.ClockTime = 14
			Lighting.FogEnd = 100000
			Lighting.GlobalShadows = false
			Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
			for _,atmosphere in next,Lighting:GetChildren() do
				if atmosphere:IsA("Atmosphere") then
					atmosphere:Destroy()
				end
			end
		end)
	else
		runS:UnbindFromRenderStep("LoopFB")
	end
end})
tab3:CreateButton({Name="Grab Fake Machete",Callback=function()
	if not self.Backpack:FindFirstChild("CampingMachete") then
		local machete = game.ReplicatedStorage.CoolBadgeThingy.Runner_Clone.CampingMachete:Clone()
		machete.Parent = self.Backpack
	end
end})
