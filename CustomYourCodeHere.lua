




-------########## Hey mon ami / Hi my friend
--- THIS FILE ALLOWS YOU TO CUSTOM WHAT YOUR WANT TO EXTRACT
--  THE FOLLOWING CODE IS AN EXAMPLE. FEEL FRE TO OVERRIDE IT IF YOU WANT.



-- WILL BE CALL BY THE MAIN CODE TO KNOW WHAT TO EXTRACT
CustomFunction={}

-- USE TO EASE THE EXPORTATION
-- ADD VALUE IN THERE IT WILL BE ADD TO THE TEXT TO SEND.
keyValueDic = {}


local valueSpliter="|"
local lineSpliter="\n"


local player ="player"
local target ="target"
local mouseover ="mouseover"
local serverID="eu"
local tt ="target target"

CustomFunction["GetMetaInfo"]=function()    

    -- USE TO RETURN THE TEXT YOU WANT.
    local result = ""

     -- YOUR SeRVER NAME 
    keyValueDic.realm=GetRealmName()

    -- This line is just informative.
    result =result..(string.format("--TICK: %s TIME: %s\n",tickId, GetTime()))
    
    -- YOU NEED THIS ONE IF YOU DONT WANT ERROR AROUND YOUR CODE
    local isDonjon= IsInInstance()

    -- I SUPPOSE YOU WILL USE ZONE NAME
    local zoneName = GetZoneText() or ""
    local subzoneName = GetSubZoneText() or ""
    if zoneName==nil then 
        return ""
    end
    keyValueDic.zoneName= zoneName
    keyValueDic.subzoneName= subzoneName
    
    
    local pfacing=GetPlayerFacing()

    -- IF YOU ARE IN THE WORLD AN YOU DONT HAVE ACCES TO DIRECTION
    -- IT MEANS THAT SOMETHING IS WRONG AND YOU NEED TO DO NOTHING
    if not isDonjon and pfacing==nil then
        return "Waiting for player"
    end
    
    
    -- PLAYER POSITION IS NOT ACTIVE IN DONJON
    -- THIS IS THE WORLD POSITION
    local px=0
    local py=0
    local pz=0 
    if not isDonjon then
        px, py,pz = UnitPosition(player)
        
    end
    keyValueDic.playerWorldPositionX= px 
    keyValueDic.playerWorldPositionY= py 
    keyValueDic.playerWorldPositionZ= pz 
    
    
    -- ORIENTATION IS NOT ACTIVE IN DONJON
    -- FACING IS A VALUE OF 0-7.28... CLOCKWISE
    -- IT REPRESENT THE XY ORIENTATION OF THE PLAYER
    local facing =isDonjon and 0 or GetPlayerFacing()/(2.0*3.1418)
    keyValueDic.playerDirectionClockwise= facing


    -- PLAYER POSITION IS NOT ACTIVE IN DONJON
    -- THIS IS THE MAP ZONE POSITION
        local posX,posY 
        if not isDonjon then
            local map = C_Map.GetBestMapForUnit(player);
            local pos = C_Map.GetPlayerMapPosition(map,player);
            posX,posY = pos:GetXY()
        else 
            posX=0
            posY=0
        end
        keyValueDic.playerMapPositionX = string.format("%.3f",posX*100)
        keyValueDic.playerMapPositionY = string.format("%.3f",posY*100)
        keyValueDic.playerMapPositionXfloor = math.floor(posX*100)
        keyValueDic.playerMapPositionYfloor = math.floor(posY*100)




    -- I LIKE TO BE ABLE TO REPORT BOT AND MULTIBOXER
    -- THIS TOOL HERE ALLOWS TO HAVE INFORMATION ON WHO IS UNDER YOUR MOUSE
        keyValueDic.mname, keyValueDic.mrealm = UnitName(mouseover)
        keyValueDic.mguildName, _, _, keyValueDic.mrealmGuild = GetGuildInfo(mouseover)
        
        keyValueDic.misplayer=UnitIsPlayer(mouseover)
        if keyValueDic.mname==nil then keyValueDic.mname="" end
        if keyValueDic.mrealm==nil then keyValueDic.mrealm="" end
        if keyValueDic.mrealm==nil then  keyValueDic.mrealm="" end
        if keyValueDic.mguildName==nil then keyValueDic.mguildName="" end
        
    
        if  keyValueDic.mrealmGuild==nil or keyValueDic.mrealmGuild=="" then
            keyValueDic.mrealmGuild=GetRealmName()
        end
        if  keyValueDic.mrealm==nil or keyValueDic.mrealm=="" then
            keyValueDic.mrealm=GetRealmName()
        end
        
        -- THIS INFO GENERATE A LINK TO CHECK THE PLAYER AND GUILD INFROMATION ONLINE.
        keyValueDic.mouse_player_url=string.format("https://worldofwarcraft.blizzard.com/en-gb/character/%s/%s/%s \n",serverID , keyValueDic.mrealm , keyValueDic.mname)
        keyValueDic.mouse_guild_url=string.format("https://worldofwarcraft.blizzard.com/en-gb/guild/%s/%s/%s\n",serverID , keyValueDic.mrealm , keyValueDic.mguildName)
       

        -- SOME USEFUL INFORMATION
        keyValueDic.gold = GetMoney()
        keyValueDic.time = GetTime()
        keyValueDic.casting = select(1, UnitCastingInfo("player"))
        keyValueDic.channel = select(1, UnitChannelInfo("player"))
        if keyValueDic.casting ==nil then
            keyValueDic.casting=""
        end
        if keyValueDic.channel ==nil then
            keyValueDic.channel=""
        end
        
        
        
        -- SOME COMBAT PLAYER VS TARGET BASIC INFORMATION
        keyValueDic.targetName = UnitName("target") or "No Target"
        keyValueDic.targetHealth = UnitHealth("target") or 0
        keyValueDic.maxHealth = UnitHealthMax("target") or 1
        keyValueDic.targetPower = UnitPower("target") or 0
        keyValueDic.maxPower = UnitPowerMax("target") or 1
        keyValueDic.targetLevel = UnitLevel("target") or 0
        
        keyValueDic.playerHealth = UnitHealth("player") or 0
        keyValueDic.maxPlayerHealth = UnitHealthMax("player") or 1
        keyValueDic.playerPower = UnitPower("player") or 0
        keyValueDic.maxPlayerPower = UnitPowerMax("player") or 1
        keyValueDic.playerLevel = UnitLevel("player") or 0
        
        keyValueDic.isInCombat = UnitAffectingCombat("player")
        keyValueDic.isMounted = IsMounted()
        
        
        
    
    -------------------DONT ToUCH IF YOU DONT KNOW 
    ---- THIS EXPORT THE KEY VALUE DICO AS A STRING TEXT.

    local keys = {}
    
    for key, _ in pairs(keyValueDic) do
        table.insert(keys, key)
    end
    
    -- Sort keys
    table.sort(keys)
    
    -- Iterate over sorted keys
    for _, key in ipairs(keys) do
        local value = keyValueDic[key]
        
        -- Check if the value is nil
        if value == nil then
            value = "nil"
        elseif type(value) == "boolean" then
            -- Convert boolean to string
            value = value and "True" or "False"
        end
        
        result = result .. key .. valueSpliter .. value .. lineSpliter
    end
    
    return result
    
end






