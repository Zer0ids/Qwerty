local self = {}
function getPlayers()
	for _,v in pairs(game:GetService("Players"):GetPlayers()) do
		if v ~= game.Players.LocalPlayer then
			return v
		end
	end
end
local RS = game:GetService('RunService').RenderStepped
local x01 = nil
function self:ChangeHitboxSizeByVector3(size:Vector3)
	x01:Disconnect()
	local plr1 = getPlayers()
	local root = plr1.Character:FindFirstChild("HumanoidRootPart")
	if root and size.X > 0 and size.Y > 0 and size.Z > 0 then
		x01 = RS:Connect(function()
			root.Size = size
		end)
	end
end
function self:ChangeHitboxSizeByInt(size:number)
	x01:Disconnect()
	local plr1 = getPlayers()
	local root = plr1.Character:FindFirstChild("HumanoidRootPart")
	if root and size > 0 then
		x01 = RS:Connect(function()
			root.Size = Vector3.new(size,size,size)
		end)
	end
end
local x02 = nil
function self:SetHitboxVisibility(visible:boolean,transparency:number)
	local plr1 = getPlayers()
	local root = plr1.Character:FindFirstChild("HumanoidRootPart")
	if root then
		if visible == true and transparency < 1 then
			x02 = RS:Connect(function()
				root.Transparency = transparency
			end)
		elseif visible == false then
			x02:Disconnect()
			root.Transparency = 1
		end
	end
end
function self:ResetHitboxSize()
	x01:Disconnect()
	x01 = nil
	local plr1 = getPlayers()
	local root = plr1.Character:FindFirstChild("HumanoidRootPart")
	if root then
		root.Size = Vector3.new(2,2,1)
	end
end
local x03 = nil
function self:UncollideHitboxes(state:boolean,destroyRoot:boolean)
	local plr1 = getPlayers()
	local root = plr1.Character:FindFirstChild("HumanoidRootPart")
	if root then
		if state == true then
			x03 = root:GetPropertyChangedSignal("CanCollide"):Connect(function()
				if root.CanCollide == true then
					root.CanCollide = false
					if destroyRoot == true then
						root:Destroy()
					end
				end
			end)
		elseif state == false then
			x03:Disconnect()
			x03 = nil
		end
	end
end
return self