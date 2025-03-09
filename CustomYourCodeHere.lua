




-------########## Hey mon ami / Hi my friend
--- THIS FILE ALLOWS YOU TO CUSTOM WHAT YOUR WANT TO EXTRACT
--  THE FOLLOWING CODE IS AN EXAMPLE. FEEL FRE TO OVERRIDE IT IF YOU WANT.



-- WILL BE CALL BY THE MAIN CODE TO KNOW WHAT TO EXTRACT
CustomFunction={}

-- USE TO EASE THE EXPORTATION
-- ADD VALUE IN THERE IT WILL BE ADD TO THE TEXT TO SEND.
keyValueDico = {}


local valueSpliter=":"
local lineSpliter="\n"


local player ="player"
local target ="target"
local mouseover ="mouseover"
local serverID="eu"
local tt ="target target"

CustomFunction["GetMetaInfo"]=function()    
-- THIS FUNCTION RETURN ALLOWS TO CUSTOM THE INFORMATION YOU WANT TO EXTRACT 
-- TWO WAYS RAM READING OR COLOR PICKING BOTH ARE AGAINST TOS.

    -- USE TO RETURN THE TEXT YOU WANT.
    local result = ""
 
    keyValueDico.file="|cffff0000CustomYourCodeHere.lua|r"
    keyValueDico._GUIDTARGET="Target:".. ( UnitGUID("target")  or  "" );
    keyValueDico._GUIDMOUSE="Mouse:".. ( UnitGUID("mouseover")  or  "" );
    keyValueDico._GUIDPLAYER="Player:".. ( UnitGUID("player")   or "" );
    


    -- YOUR SeRVER NAME 
    keyValueDico.realm=GetRealmName()

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
    keyValueDico.zoneName= zoneName
    keyValueDico.subzoneName= subzoneName
    

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
    keyValueDico.playerWorldPositionX= px 
    keyValueDico.playerWorldPositionY= py 
    keyValueDico.playerWorldPositionZ= pz 
    
    
    -- ORIENTATION IS NOT ACTIVE IN DONJON
    -- FACING IS A VALUE OF 0-7.28... CLOCKWISE
    -- IT REPRESENT THE XY ORIENTATION OF THE PLAYER
    local facing =isDonjon and 0 or GetPlayerFacing()/(2.0*3.1418)
    keyValueDico.playerDirectionClockwise= facing


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
       keyValueDico.playerMapPositionX = string.format("%.3f",posX*100)
       keyValueDico.playerMapPositionY = string.format("%.3f",posY*100)
       keyValueDico.playerMapPositionXfloor = math.floor(posX*100)
       keyValueDico.playerMapPositionYfloor = math.floor(posY*100)




    -- I LIKE TO BE ABLE TO REPORT BOT AND MULTIBOXER
    -- THIS TOOL HERE ALLOWS TO HAVE INFORMATION ON WHO IS UNDER YOUR MOUSE
        keyValueDico.mname, keyValueDico.mrealm = UnitName(mouseover)
        keyValueDico.mguildName, _, _, keyValueDico.mrealmGuild = GetGuildInfo(mouseover)
        
        keyValueDico.misplayer=UnitIsPlayer(mouseover)
        if keyValueDico.mname==nil then keyValueDico.mname="" end
        if keyValueDico.mrealm==nil then keyValueDico.mrealm="" end
        if keyValueDico.mrealm==nil then  keyValueDico.mrealm="" end
        if keyValueDico.mguildName==nil then keyValueDico.mguildName="" end
        
    
        if  keyValueDico.mrealmGuild==nil or keyValueDico.mrealmGuild=="" then
            keyValueDico.mrealmGuild=GetRealmName()
        end
        if  keyValueDico.mrealm==nil or keyValueDico.mrealm=="" then
            keyValueDico.mrealm=GetRealmName()
        end
        
        -- THIS INFO GENERATE A LINK TO CHECK THE PLAYER AND GUILD INFROMATION ONLINE.
        keyValueDico.mouse_player_url=string.format("https://worldofwarcraft.blizzard.com/en-gb/character/%s/%s/%s \n",serverID , keyValueDico.mrealm , keyValueDico.mname)
        keyValueDico.mouse_guild_url=string.format("https://worldofwarcraft.blizzard.com/en-gb/guild/%s/%s/%s\n",serverID , keyValueDico.mrealm , keyValueDico.mguildName)
       

        -- SOME USEFUL INFORMATION
        keyValueDico.gold = GetMoney()
        keyValueDico.time = GetTime()
        keyValueDico.casting = select(1, UnitCastingInfo("player"))
        keyValueDico.channel = select(1, UnitChannelInfo("player"))
        if keyValueDico.casting ==nil then
            keyValueDico.casting=""
        end
        if keyValueDico.channel ==nil then
            keyValueDico.channel=""
        end
        
        
        
        -- SOME COMBAT PLAYER VS TARGET BASIC INFORMATION
        keyValueDico.targetName = UnitName("target") or "No Target"
        keyValueDico.targetHealth = UnitHealth("target") or 0
        keyValueDico.maxHealth = UnitHealthMax("target") or 1
        keyValueDico.targetPower = UnitPower("target") or 0
        keyValueDico.maxPower = UnitPowerMax("target") or 1
        keyValueDico.targetLevel = UnitLevel("target") or 0
        
        keyValueDico.playerHealth = UnitHealth("player") or 0
        keyValueDico.maxPlayerHealth = UnitHealthMax("player") or 1
        keyValueDico.playerPower = UnitPower("player") or 0
        keyValueDico.maxPlayerPower = UnitPowerMax("player") or 1
        keyValueDico.playerLevel = UnitLevel("player") or 0
        
        keyValueDico.isInCombat = UnitAffectingCombat("player")
        keyValueDico.isMounted = IsMounted()
        
        
        
    
    -------------------DONT ToUCH IF YOU DONT KNOW 
    ---- THIS EXPORT THE KEY VALUE DICO AS A STRING TEXT.

    if true then 
       -- return FunctionName("Hey mon ami|",keyValueDico, "Les patates!")
       return FunctionName("",keyValueDico, "")
    end 
    
end

function FunctionName(startwith, dicoGiven,endWith)
    local keys = {}
    local result=startwith
    
    for key, _ in pairs(dicoGiven) do
        table.insert(keys, key)
    end
    
    -- Sort keys
    table.sort(keys)
    
    -- Iterate over sorted keys
    for _, key in ipairs(keys) do
        local value = dicoGiven[key]
        
        -- Check if the value is nil
        if value == nil then
            value = "nil"
        elseif type(value) == "boolean" then
            -- Convert boolean to string
            value = value and "True" or "False"
        end
        
        result = result .. key .. valueSpliter .. value .. lineSpliter
    end
    
    return result..endWith
    
end





