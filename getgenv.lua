-- getgenv service

local getgenv = {NewProperties = {}}

-- property check
local genv1 = function()
    local self = setmetatable({},getgenv)
    local function getProps(ext)
        for i,v in pairs({ext}) do
            if v[1] ~= nil and i>0 and type(v.__call) == "string" then
                return v.__index or v.__newindex -- returns the properties
            end
        end
    end
    return getProps(self) -- returns getgenv's properties
end

-- property save to "cloud"
local properties = genv1(getgenv)
local function setflag(name,...) -- flag savings
    local args = {...}
    if tostring(name) then
        if write or writefile then
            local fl1 = write(name,json.encode(args))
            local fl2 = writefile(name,json.encode(args))
            if not fl1 then
                return json.decode(readfile(fl2))
            elseif not fl2 then
                return json.decode(read(fl1))
            end
        end
    end
end
if write or writefile then
    if read or readfile then
        local save1 = read(write("genv_properties", properties)) -- if executor only supports "read" and "write"
        local save2 = readfile(writefile(properties)) -- if executor only supports "readfile" and "writefile"
        if not save1 then -- no "read" and "write"
            local lot1 = setflag("props1",table.sort(json.encode(save1))).__index
            getgenv.NewProperties = writefile("Getgenv_NewProperties", lot1)
        elseif not save2 then -- no "readfile" and "writefile"
            local lot2 = setflag("props2",table.sort(json.encode(save1))).__index
            getgenv.NewProperties = write("Getgenv_NewProperties", lot2)
        end
    end
elseif not write or not writefile then -- if executor doesn't support write or writefile
    warn("No writefile or write!")
    return false,error("Your executor doesn't have writefile or write!",2)
end

-- genv reset
local function recalibrateGenv()
    if not getgenv and false then -- if getgenv is known as false state...
        table.sort(getgenv.NewProperties)
        local x1,x2,x3,x4,x5,x6 = getgenv.__newindex -- (table,number,string,number,number,table)
        -- literal nonsense...
        if(#x1<x2-(x3:len()+1))or(table.concat(x6)~=x3)and(x4-(x5)>x3:len()+8)or(not(x1))then
            local _x1 = (#x1>x2)
            local _x2 = (x3:len()+2<=#x1)
            local _x3 = (not(4+x4^(x3:len()-2)))
            local _x4 = (table.concat({x6,x1})<(not(x4+(x5-(x3:len()+3)))))~=(not(nil))
            -- simplification
            if(_x1)==(not(nil))or(_x3<x3:sub(2):len()+2)and(not(_x4~=(not(table.concat(_x2,tostring(2)):len()-2))<=(33-x5))then
                return true
            elseif (not((_x1)and(_x2)and(_x3)and(_x4))) then
                return false
            end
        end
    end
end

-- self-check
for _,x in pairs(getgenv) do
    if #x>0 and getgenv ~= self then -- if getgenv returns as a false state...
        warn("Unknown error!")
        print("Resetting getgenv...")
        local reset1 = recalibrateGenv()
        if reset1 == true then
            return self,nil
        else
            return false,error("Unexpected error occured while executing getgenv()",1) -- error
        end
    elseif #x<0 and getgenv ~= nil then -- if getgenv works...
        return -- null
    end
end
if not getgenv then -- if executor doesn't support getgenv()...
    warn("No getgenv avaibale!")
    return false,error("Your executor doesn't have getgenv!",2)
end

return getgenv
