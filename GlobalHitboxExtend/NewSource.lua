local hbe = {}
local function getPlayers()
    for _,v in next,game.Players:GetPlayers() do
        if v ~= game.Players.LocalPlayer and v.Name ~= game.Players.LocalPlayer.Name then
            return v
        end
    end
end
local i1 = 0
local i2 = 0
local i3 = 0
local i4 = 0
local runService = game:GetService("RunService")
function hbe:ChangeHitboxSizeByVector3(size)
    runService:UnbindToRenderStep("HitboxExtendInt_"..i2)
    runService:UnbindToRenderStep("HitboxExtendVector3_"..i1)
    i1 += 1
    runService:BindToRenderStep("HitboxExtendVector3_"..i1,Enum.RenderPriority.Character.Value,function()
        local plr = getPlayers()
        local root = plr.Character:FindFirstChildOfClass("Humanoid").RootPart
        if root and size.X >= 1 and size.Y >= 1 and size.Z >= 1 then
            root.Size = size
        elseif size < 1 then
            error("Argument [1] error! Size's vector(s) is below one!",1)
        end
    end)
end
function hbe:ChangeHitboxSizeByInteger(size)
    runService:UnbindToRenderStep("HitboxExtendVector3_".i1)
    runService:UnbindToRenderStep("HitboxExtendInt_"..i2)
    i2 += 1
    runService:BindToRenderStep("HitboxExtendInt_"..i2,Enum.RenderPriority.Character.Value,function()
        local plr = getPlayers
        local root = plr.Character:FindFirstChildOfClass("Humanoid").RootPart
        if root and size >= 1 then
            root.Size = Vector3.new(size,size,size)
        elseif size < 1 then
            error("Argument [1] error! Size is below one!")
        end
    end)
end
function hbe:ResetHitboxSize()
    runService:UnbindToRenderStep("HitboxExtendVector3_".i1)
    runService:UnbindToRenderStep("HitboxExtendInt_"..i2)
    local plr = getPlayers()
    local root = plr.Character:FindFirstChildOfClass("Humanoid").RootPart
    if root and root.Size ~= Vector3.new(2,2,1) then
        root.Size = Vector3.new(2,2,1)
    end
end
function hbe:UncollideHitboxes(state)
    runService:UnbindToRenderStep("UncollideHitboxes_"..i3)
    local pl = getPlayers()
    local root = plr.Character:FindFirstChildOfClass("Humanoid").RootPart
    if root then
        if state == true then
            i3 += 1
            runService:BindToRenderStep("UncollideHitboxes_"..i3,Enum.RenderPriority.First.Value,function()
                if root.CanCollide == true then
                    root.CanCollide = false
                end
            end)
        else
            runService:UnbindToRenderStep("UncollideHitboxes_"..i3)
        end
    end
end
function hbe:SetHitboxVisibility(visible,transparency)
    -- 69
    runService:UnbindToRenderStep("HitboxVisibility_".i4)
    local plr = getPlayers()
    local root = plr.Character:FindFirstChildOfClass("Humanoid").RootPart
    if root then
        if visible == true and transparency < 1 then
            i4 += 1
            runService:BindToRenderStep("HitboxVisibility_"..i4)
        elseif visible == true and transparency >= 1 then
            error("Argument [2] error! Transparency must be under 1!")
        elseif visible == false then
            runService:UnbindToRenderStep("HitboxVisibility_".i4)
        end
    end
end
return hbe
