# Hitbox Extend Documentation

(If you don't know how to operate this script, it is recommended to read this first!)

***Ignore this...*** ~(Thanks you for using this script. I do appreciate the efforts!)~

## Want to change the Hitbox Size?
You can either do these functions below:

`Vector3` method:
```lua
--[[
Function : self:ChangeHitboxSizeByVector3(size)
Args : {
    size : Vector3 : [1]
}
]]--

-- Example:
self:ChangeHitboxSizeByVector3(Vector3.new(20,20,10))
```

`Integer` method (will be resized with the same integer value for `x`,`y`,`z`):
```lua
--[[
Function : self:ChangeHitboxSizeByInt(size)
Args : {
    size : number : [1]
}
]]--

-- Example:
self:ChangeHitboxSizeByInt(69) -- funni :)
```

**NOTICE:** (The size should **never** be below or at zero!)

## Can't see the Hitboxes?
You can be able to see the hitboxes with this function below:
```lua
--[[
Function : self:SetHitboxVisibility(visible,transparency)
Args : {
    visible : boolean : [1]
    transparency : number : [2]
}
]]--

-- Example:
self:SetHitboxVisibility(true,0.5)
```

**NOTICE:** (Putting the argument, "transparency", to 1 wouldn't work, sorry...)

## Somehow colliding to Hitboxes after their Character's death?
You'll be able to uncollide through hitboxes with this function below:

```lua
--[[
Function : self:UncollideHitboxes(state,destroyRoot)
Args : {
    state : boolean : [1]
    destroyRoot : boolean : [2]
}
]]--

-- Example:
self:UncollideHitboxes(true,false) -- destroyRoot argument is required but can be optionally set to "true"
```

### Reset Hitbox sizes
```lua
--[[
Function : self:ResetHitboxSize()
Args : {none!}
]]--

-- Example:
self:ResetHitboxSize() -- resets hitbox sizes
```

# Other Information
Later on, I'll be making player arguments so that the players, you want to target, can be affected by this...

Thanks for using this script, by the way!
