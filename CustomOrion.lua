local orion = {
    GameName = "",
    IntroIcon = nil,
    Icon = nil
}
local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()

orion.Window = lib:MakeWindow({
    Name=orion.GameName,
    SaveConfig=false,
    IntroEnabled=true,
    IntroText="Ranxware",
    IntroIcon=orion.IntroIcon,
    Icon=orion.Icon
})

return orion