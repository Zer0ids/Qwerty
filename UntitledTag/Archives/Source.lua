-- This was the first version of the utg script
local pathFile = "https://raw.githubusercontent.com/Zer0ids/Qwerty/main/UntitledTag/NewScript.lua"

local module = getrenv().require(game:GetService("CoreGui").RobloxGui.Modules.ErrorPrompt)
local prompt = module.new("Default")
prompt._hideErrorCode = true
local index = Instance.new("ScreenGui",gethui and gethui() or game.CoreGui)
index.ResetOnSpawn = false
index.LayoutOrder = 999
prompt:setParent(index)
prmompt:setErrorTitle("Ranxware Hub")
prompt:_open("This source is outdated. Do you want to load the new one, instead?")
prompt:updateButtons({
    {
      Text="Yes",
      Callback=function()
        prompt:_close()
        index:Destroy()
        loadstring(game:HttpGet(pathFile))()
      end,
      Primary=true
    },
    {
      Text="No thanks.",
      Callback=function()
        prompt:_close()
        index:Destroy()
      end
    }
})
