-- Version: 3.0


repeat wait() until game:IsLoaded()

local you = game.Players.LocalPlayer
local lighting = game.Lighting
local infjumpLoader = loadstring(game:HttpGet("https://pastebin.com/raw/WRA3sPu9"))() -- from "Obby Hub"
local coinLoader = loadstring(game:HttpGet("https://raw.githubusercontent.com/Zer0ids/Qwerty/main/UntitledTag/Autocollect"))()

local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local window = lib:MakeWindow({
	Name="Ranxware | UTG V3.0",
	SaveConfig=true,
	ConfigFolder="RanxwareUTG",
	IntroEnabled=true,
	IntroText="Ranxware V2"
})
local function let(domain,action,args)
	if action:lower() == "maketab" then
		return domain:MakeTab({
			Name=args.Name and args.Name or "Unknown Tab",
			Icon=args.Icon and args.Icon or nil
		})
	elseif action:lower() == "addsection" then
		return domain:AddSection({
			Name=args.Name and args.Name or "Unknown Section",
		})
	elseif action:lower() == "addbutton" then
		return domain:AddButton({
			Name=args.Name and args.Name or "Unknown Button",
			Callback=args.Callback or nil
		})
	elseif action:lower() == "addtoggle" then
		return domain:AddToggle({
			Name=args.Name and args.Name or "Unknown Toggle",
			Default=args.Default and args.Default or false,
			Callback=args.Callback or nil
		})
	elseif action:lower() == "addcolorpicker" then
		return domain:AddColorpicker({
			Name=args.Name and args.Name or "Unknown Colorpicker",
			Default=args.Default and args.Default or Color3.new(1,1,1),
			Callback=args.Callback or nil
		})
	elseif action:lower() == "addslider" then
		return domain:AddSlider({
			Name=args.Name or "Unknown Slider",
			Min=args.Range[1] or 0,
			Max=args.Range[2] or 100,
			Default=args.Default or args.Range[1] or 0,
			Increment=args.Increment or 1,
			ValueName=args.Suffix or nil,
			Callback=args.Callback or nil
		})
	elseif action:lower() == "addlabel" then
		return domain:AddLabel(
			args.Text or "Unknown Label"
		)
	elseif action:lower() == "addparagraph" then
		return domain:AddParagraph(
			args.Title or "Unknown Paragraph",
			args.Content or "Unknown paragraph content"
		)
	elseif action:lower() == "addinput" then
		return domain:AddTextbox({
			Name=args.Name or "Unknown Input",
			Default=args.Default or "",
			TextDisappear=args.TextDisappear or false,
			Callback=args.Callback or nil
		})
	elseif action:lower() == "addbind" then
		return domain:AddBind({
			Name=args.Name or "Unknown Bind",
			Default=args.Default or nil,
			Callback=args.Callback or nil
		})
	elseif action:lower() == "adddropdown" then
		return domain:AddDropdown({
			Name=args.Name or "Unknown Dropdown",
			Options=args.Options or {1,2,3},
			Default=args.Default or args.Options[1] or 1,
			Callback=args.Callback or nil
		})
	end
end
local function notify(title,content,image)
	return lib:MakeNotification({
		Name=title or "Ranxware V4",
		Content=content,
		Image=image or nil,
		Time=8
	})
end

local tag = let(window,"maketab",{Name="Tag Cheats"})
local movement = let(window,"maketab",{Name="Movement"})
local experi = let(window,"maketab",{Name="Experimental",Icon="rbxassetid://7733920644"})
local misc = let(window,"maketab",{Name="Misc"})

local hitboxes = let(tag,"addsection",{Name="Hitboxes"})
local autotag = let(tag,"addsection",{Name="Autotag [BETA]"})
local _humanoid = let(movement,"addsection",{Name="Humanoid"})
local physical = let(movement,"addsection",{Name="Physical"})
local exp_main = let(experi,"addsection",{Name="Main"})
local visuals = let(experi,"addsection",{Name="Visuals"})

local hbcon
local hbsize = 2
let(hitboxes,"addtoggle",{Name="Hitbox Extend",Callback=function(value)
	if value then
		hbcon = game:GetService("RunService").Stepped:Connect(function()
			for _,i in next,game.Players:GetPlayers() do
				if i ~= you then
					local root = i.Character:FindFirstChildOfClass("Humanoid").RootPart
					if root then
						root.Size = Vector3.new(hbsize,hbsize,hbsize)
						root.Transparency = 0.5
					end
				end
			end
		end)
	else
		hbcon:Disconnect()
		for _,i in next,game.Players:GetPlayers() do
			if i ~= you then
				local root = i.Character:FindFirstChildOfClass("Humanoid").RootPart
				if root then
					root.Size = Vector3.new(2,2,1)
					root.Transparency = 1
				end
			end
		end
	end
end})
let(hitboxes,"addslider",{Name="Hitbox Size",Range={2,15},Default=2,Suffix="studs",Callback=function(value)
	hbsize = value
end})
local atcon
local at_teamcheck = false
local at_runnercheck = true
let(autotag,"addtoggle",{Name="Autotag",Callback=function(value)
	if value then
		atcon = game:GetService("RunService").Stepped:Connect(function()
			local youroot = you.Character:FindFirstChildOfClass("Humanoid").RootPart
			for _,i in next,game.Players:GetPlayers() do
				if i ~= you then
					if at_runnercheck then
						if you.PlayerRole.Value ~= "Runner" and you.PlayerRole.Value ~= "Dead" then
							if at_teamcheck then
								if i.PlayerRole.Value ~= you.PlayerRole.Value then
									local root = i.Character:FindFirstChildOfClass("Humanoid").RootPart
									if root then
										local distance = (root.Position-youroot.Position).Magnitude
										if distance <= root.Size.Magnitude then
											mouse1click()
										end
									end
								end
							else
								local root = i.Character:FindFirstChildOfClass("Humanoid").RootPart
								if root then
									local distance = (root.Position-youroot.Position).Magnitude
									if distance <= root.Size.Magnitude then
										mouse1click()
									end
								end
							end
						end
					else
						if at_teamcheck then
							if i.PlayerRole.Value ~= you.PlayerRole.Value then
								local root = i.Character:FindFirstChildOfClass("Humanoid").RootPart
								if root then
									local distance = (root.Position-youroot.Position).Magnitude
									if distance <= root.Size.Magnitude then
										mouse1click()
									end
								end
							end
						else
							local root = i.Character:FindFirstChildOfClass("Humanoid").RootPart
							if root then
								local distance = (root.Position-youroot.Position).Magnitude
								if distance <= root.Size.Magnitude then
									mouse1click()
								end
							end
						end
					end
				end
			end
		end)
	else
		atcon:Disconnect()
	end
end})
let(autotag,"addtoggle",{Name="Team Check",Callback=function(value)
	at_teamcheck = value
end})
let(autotag,"addtoggle",{Name="Runner/Alive Check",Default=true,Callback=function(value)
	at_runnercheck = value
end})

local wsval,jpval = 30,32
local wscon,jpcon,wscon2,jpcon2
let(_humanoid,"addtoggle",{Name="Walkspeed",Callback=function(value)
	if value then
		local humanoid = you.Character:FindFirstChildOfClass("Humanoid")
		local function changeWs()
			humanoid.WalkSpeed = wsval
		end
		changeWs()
		wscon = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(changeWs)
		wscon2 = you.CharacterAdded:Connect(function(char)
			humanoid = char:FindFirstChildOfClass("Humanoid")
			changeWs()
			wscon = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(changeWs)
		end)
	else
		wscon:Disconnect()
		wscon2:Disconnect()
	end
end})
let(_humanoid,"addslider",{Name="Walkspeed Value",Range={26,65},Default=30,Callback=function(value)
	wsval = value
end})
let(_humanoid,"addtoggle",{Name="Jumppower",Callback=function(value)
	if value then
		local humanoid = you.Character:FindFirstChildOfClass("Humanoid")
		local function changeJp()
			humanoid.UseJumpPower = true
			humanoid.JumpPower = wsval
		end
		changeJp()
		jpcon = humanoid:GetPropertyChangedSignal("JumpPower"):Connect(changeJp)
		jpcon2 = you.CharacterAdded:Connect(function(char)
			humanoid = char:FindFirstChildOfClass("Humanoid")
			changeJp()
			jpcon = humanoid:GetPropertyChangedSignal("JumpPower"):Connect(changeJp)
		end)
	else
		jpcon:Disconnect()
		jpcon2:Disconnect()
	end
end})
let(_humanoid,"addslider",{Name="Jumppower Value",Range={26,65},Default=30,Callback=function(value)
	jpval = value
end})
local fclimbcon,fclimbcon2,noclipcon,noclipcon2
let(physical,"addtoggle",{Name="Infinite Jump",Callback=function(value)
	if value then
		infjumpLoader:Load()
	else
		infjumpLoader:Unload()
	end
end})
let(physical,"addtoggle",{Name="Fast Climb",Callback=function(value)
	if value then
		local humanoid = you.Character:FindFirstChildOfClass("Humanoid")
		fclimbcon = humanoid.Climbing:Connect(function()
			humanoid.Jump = true
		end)
		fclimbcon2 = you.CharacterAdded:Connect(function(char)
			local humanoid = char:FindFirstChildOfClass("Humanoid")
			fclimbcon = humanoid.Climbing:Connect(function()
				humanoid.Jump = true
			end)
		end)
	else
		fclimbcon:Disconnect()
		fclimbcon2:Disconnect()
	end
end})
let(physical,"addtoggle",{Name="Noclip",Callback=function(value)
	if value then
		local char = you.Character
		noclipcon = game:GetService("RunService").Stepped:Connect(function()
			for _,p in next,char:GetDescendants() do
				if p:IsA("BasePart") then
					p.CanCollide = false
				end
			end
		end)
		noclipcon2 = you.CharacterAdded:Connect(function(nchar)
			char = nchar
			noclipcon = game:GetService("RunService").Stepped:Connect(function()
				for _,p in next,char:GetDescendants() do
					if p:IsA("BasePart") then
						p.CanCollide = false
					end
				end
			end)
		end)
	else
		noclipcon:Disconnect()
	end
end})

let(exp_main,"addtoggle",{Name="Autocollect Coins",Callback=function(value)
	if value then
		coinLoader:Load()
	else
		coinLoader:Unload()
	end
end})
local esp = false
local boxes = false
local chams = false
local tracers = false
local names = false
local roles = false
local teamcheck = false
local tracerorigin = "Bottom"
let(visuals,"addtoggle",{Name="Enable ESP [Thanks to Sense]",Callback=function(value)
	esp = value
end})
let(visuals,"addtoggle",{Name="Box ESP",Callback=function(value)
	boxes = value
end})
let(visuals,"addtoggle",{Name="Cham ESP",Callback=function(value)
	chams = value
end})
let(visuals,"addtoggle",{Name="Tracer ESP",Callback=function(value)
	tracers = value
end})
let(visuals,"addtoggle",{Name="Name ESP",Callback=function(value)
	names = value
end})
let(visuals,"addtoggle",{Name="Role ESP",Callback=function(value)
	roles = value
end})
let(visuals,"adddropdown",{Name="Tracer Origin",Options={"Bottom","Top","Mouse","Middle"},Default="Bottom",Callback=function(option)
	tracerorigin = option
end})
let(visuals,"addtoggle",{Name="Role Check",Callback=function(value)
	teamcheck = value
end})
-- this took me forever to code this! :D
local function addEsp(target)
	local function addBox()
		local box = Drawing.new("Square")
		box.Color = Color3.new()
		box.Thickness = 0.5
		box.Filled = false
		box.Transparency = 1;
	end
	local function addLine()
		local line = Drawing.new("Line")
		line.Color = Color3.new()
		line.Thickness = 0.5
		return line
	end
	local function addText()
		local text = Drawing.new("Text")
		text.Color = Color3.new()
		text.Size = 20
		text.Outline = true
		text.Center = true
		return text
	end
	local function addCham()
		local cham = Instance.new("BoxHandleAdornment",gethui and gethui() or game.CoreGui)
		cham.Color3 = Color3.new()
		cham.AlwaysOnTop = true
		cham.ZIndex = 10
		return cham
	end
	local function alive(target)
		return (target.PlayerRole.Value ~= "Dead")
	end
	local function isSameTeam(target)
		return (target.PlayerRole.Value == you.PlayerRole.Value)
	end
	local box = addBox()
	local tracer = addLine()
	local name = addText()
	local role = addText()
	local text = addText()
	local head = addCham()
	local torso = addCham()
	local larm = addCham()
	local rarm = addCham()
	local lleg = addCham()
	local rleg = addCham()
	game.Players.PlayerRemoving:Connect(function(player)
		if player == target then
			box:Destroy()
			tracer:Destroy()
			name:Destroy()
			role:Destroy()
			text:Destroy()
			head:Destroy()
			torso:Destroy()
			larm:Destroy()
			rarm:Destroy()
			lleg:Destroy()
			rleg:Destroy()
		end
	end)
	game:GetService("RunService").Stepped:Connect(function()
		box.Color = target.Character.Torso.Color
		tracer.Color = target.Character.Torso.Color
		name.Color = target.Character.Torso.Color
		role.Color = target.Character.Torso.Color
		head.Color3 = target.Character.Torso.Color
		torso.Color3 = target.Character.Torso.Color
		larm.Color3 = target.Character.Torso.Color
		rarm.Color3 = target.Character.Torso.Color
		lleg.Color3 = target.Character.Torso.Color
		rleg.Color3 = target.Character.Torso.Color
		text.Color = target.Character.Torso.Color
		if alive(target) then
			local mainpos,vis = workspace.CurrentCamera:WorldToViewportPoint(target.Character:FindFirstChildOfClass("Humanoid").RootPart.Position)
			local miscpos1 = workspace.CurrentCamera:WorldToViewportPoint(target.Character.Head.Position+Vector3.new(0,0.5,0))
			local miscpos2 = workspace.CurrentCamera:WorldToViewportPoint(target.Character:FindFirstChildOfClass("Humanoid").RootPart.Position-Vector3.new(0,4,0))
			if vis then
				if not teamcheck then
					if isSameTeam(target) then
						vis = false
					end
				end
			end
			if boxes then
				box.Visible = vis
				box.Size = Vector2.new((2350/mainpos.Z)+2.5,miscpos1.Y-miscpos2.Y)
				box.Position = Vector2.new((mainpos.X-box.Size.X/2)-1,mainpos.Y-box.Size.Y/2)
			else
				box.Visible = false
			end
			if chams then
				head.Visible = true
				torso.Visible = true
				larm.Visible = true
				rarm.Visible = true
				lleg.Visible = true
				rleg.Visible = true
				head.Adornee = target.Character.Head
				torso.Adornee = target.Character.Torso
				larm.Adornee = target.Character["Left Arm"]
				rarm.Adornee = target.Character["Right Arm"]
				lleg.Adornee = target.Character["Left Leg"]
				rleg.Adornee = target.Character["Right Leg"]
			else
				head.Visible = false
				torso.Visible = false
				larm.Visible = false
				rarm.Visible = false
				lleg.Visible = false
				rleg.Visible = false
			end
			if tracers then
				tracer.Visible = vis
				if tracerorigin == "Top" then
					tracer.To = Vector2.new(workspace.CurrentCamera.ViewportSize.X/2,0)
					tracer.From = Vector2.new(mainpos.X-1,mainpos.Y+(miscpos1.Y-miscpos2.Y)/2)
				elseif tracerorigin == "Middle" then
					tracer.To = workspace.CurrentCamera.ViewportSize/2
					tracer.From = Vector2.new(mainpos.X-1,(mainpos.Y+(miscpos1.Y-miscpos2.Y)/2)-((miscpos1.Y-miscpos2.Y)/2))
				elseif tracerorigin == "Bottom" then
					tracer.From = Vector2.new(mainpos.X-1,mainpos.Y+(miscpos1.Y-miscpos2.Y)/2)
					tracer.To = Vector2.new(workspace.CurrentCamera.ViewportSize.X/2,1000)
				elseif tracerorigin == "Mouse" then
					tracer.To = game:GetService("UserInputService"):GetMouseLocation()
					tracer.From = Vector2.new(mainpos.X-1,(mainpos.Y+(miscpos1.Y-miscpos2.Y)/2)-((miscpos1.Y-miscpos2.Y)/2))
				end
			else
				tracer.Visible = false
			end
			if names then
				name.Visible = vis
				name.Position = Vector2.new(workspace.CurrentCamera:WorldToViewportPoint(target.Character.Head.Position).X,workspace.CurrentCamera:WorldToViewportPoint(target.Character.Head.Position).Y+20)
				name.Text = target.Name
			else
				name.Visible = false
			end
			if roles then
				role.Visible = vis
				name.Position = Vector2.new(workspace.CurrentCamera:WorldToViewportPoint(target.Character.Head.Position).X,workspace.CurrentCamera:WorldToViewportPoint(target.Character.Head.Position).Y+20)
				name.Text = target.PlayerRole.Value
			else
				role.Visible = false
			end
			if names and roles then
				name.Visible = false
				role.Visible = false
				text.Visible = vis
				text.Position = Vector2.new(workspace.CurrentCamera:WorldToViewportPoint(target.Character.Head.Position).X,workspace.CurrentCamera:WorldToViewportPoint(target.Character.Head.Position).Y+20)
				text.Text = target.Name.." | "..target.PlayerRole.Value
			else
				text.Visible = false
			end
		else
			box.Visible = false
			tracer.Visible = false
			name.Visible = false
			role.Visible = false
			text.Visible = false
			head.Visible = false
			torso.Visible = false
			larm.Visible = false
			rarm.Visible = false	
			lleg.Visible = false
			rleg.Visible = false
		end
	end)
end
for _,i in next,game.Players:GetPlayers() do
	if i ~= you then
		addEsp(i)
	end
end
game.Players.PlayerAdded:Connect(function(i)
	if i ~= you then
		addEsp(i)
	end
end)

local fbcon
let(misc,"addtoggle",{Name="Fullbright",Callback=function(value)
	if value then
		fbcon = game:GetService("RunService").Stepped:Connect(function()
			lighting.Brightness = 2
			lighting.ClockTime = 14
			lighting.FogEnd = 100000
			lighting.GlobalShadows = false
			lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
			lighting.ExposureCompensation = 0
			for _,atmosphere in next,lighting:GetChildren() do
				if atmosphere:IsA("Atmosphere") then
					atmosphere:Destroy()
				end
			end
		end)
	else
		fbcon:Disconnect()
	end
end})

lib:Init()


--[[

~ UPDATE LOGS: ~

* 11/5/22 - First version of UTG script created (the usual stuff...)
* 11/13/22 - Created coin autocollect module for script
* 11/14/22 - Second version released (removed the useless authentication system; fixed bugs; added new features)
* 12/29/22 - 2.5 version released
* 2/14/23 - closed script... (update for v3 soon.)
* 2/23/23 - Third version released (revamped features; new ui library [orion]; added esp [experimental])

]]
