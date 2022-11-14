local pathFile = ""

print("Outdated file. Reloading new version...")
wait(1)
loadstring(game:HttpGet(pathFile))()
