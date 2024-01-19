tickModulo=2
tickRangeInSecond=5
tickId=1
maxtextvalue =5000
TextInMemory = {}



useAddressTagInjection=true;
tagInjectionValueTextIndex=250100000000
tagInjectionValueMemoryChanged=250100000001


function SetHasChangedTo(randomUniqueNumber)
    TextInMemory[1]=randomUniqueNumber
end
function SetHasChangedToTag()
    TextInMemory[1]=tagInjectionValueMemoryChanged
end

local hasChangedIndex=0
function SetHasChangedIncrement()
    hasChangedIndex =hasChangedIndex+1
    TextInMemory[1]=hasChangedIndex
end

local time=GetTime()
function RefreshTheTickBoundary()
    time= GetTime()
 
    tickId =math.floor((time/tickRangeInSecond)%tickModulo)
    TextInMemory[0]= 12345600 + tickId --startTickDynamic
    TextInMemory[1]= 0 -- Value used to check if the memory changed 
    FlushValueBetweenBoundary()
    TextInMemory[maxtextvalue+1]= 65432100 + tickId --stopTickDynamic
end
function FlushValueBetweenBoundary()
    for i=2,maxtextvalue do
        TextInMemory[i]=math.floor(2501000+(i%255))
        --TextInMemory[i]=0
    end
end

function FlushValueBetweenBoundaryToInt(value)
    for i=2,maxtextvalue do
        TextInMemory[i]=math.floor(value)
        --TextInMemory[i]=0
    end
end


charValueTempInt=0
function SetMemoryText(text)
    for i = 2, maxtextvalue do
        if(i>maxtextvalue) then
            TextInMemory[i] =0
        else
            if(i<=#text)then
                TextInMemory[i] = math.floor(string.byte(text, i)*10000 +i)
            else 
                TextInMemory[i] =0
            end
        end
    end
end
RefreshTheTickBoundary()
--SetMemoryText("0123456789 ABC xyz  Hello World my friend ! 2501 42 :) _1234567890)^-")






JustTest={}
JustTest.Time=0
JustTest.Tick=0


CustomFunction={}


dico = {    }

CustomFunction["GetMetaInfo"]=function()
    
   
    local anchorTick =(string.format("TICK: %s\n START TICK %s\n STOPTICK %s\n",tickId,TextInMemory[0],TextInMemory[maxtextvalue+1]))
   


    local player ="player"
    local target ="target"
    local tt ="target target"
    local partOne=true
    
    local partTwo=true
    local partbuff=true
    local zoneName = GetZoneText() or ""
    local subzoneName = GetSubZoneText() or ""
    if zoneName==nil then 
        return ""
    end
    
    
    local isDonjon= IsInInstance()
    local pfacing=GetPlayerFacing()
    if not isDonjon and pfacing==nil then
        return ""
    end
    
    
    local px=0
    local py=0
    local pz=0 
    if not isDonjon then
        px, py,pz = UnitPosition("player")
        
    end
    
    
    local facing =isDonjon and 0 or GetPlayerFacing()/(2.0*3.1418)
    
    dico.realm=GetRealmName()
    
    dico.playerWorldPositionX= px
    dico.playerWorldPositionY= py
    dico.playerWorldPositionZ= pz
    dico.playerDirectionClockwise= facing
    dico.zoneName= zoneName
    dico.subzoneName= subzoneName
    
    if true then 
        -- if not isDonjon then 
        
        -- START
        -- CODE THAT FETCH THE MAP INFORMATION OF PLAYER POSITION
        local posX,posY 
        if not isDonjon then
            local map = C_Map.GetBestMapForUnit("player");
            local pos = C_Map.GetPlayerMapPosition(map,"player");
            posX,posY = pos:GetXY()
        else 
            posX=0
            posY=0
        end
        
        
        dico.playerMapPositionX = string.format("%.3f",posX*100)
        dico.playerMapPositionY = string.format("%.3f",posY*100)

        dico.a_playerMapPositionXfloor = math.floor(posX*100)
        dico.a_playerMapPositionYfloor = math.floor(posY*100)

        JustTest[4]=dico.a_playerMapPositionXfloor 
        JustTest[5]=dico.a_playerMapPositionYfloor
        
        
        if partbuff==true then
            


          






            local buffs, i = { }, 1;
            local buff = UnitBuff("target", i);
            
            while buff do
                local name = GetSpellInfo(buff);
                if name then
                    buffs[#buffs + 1] = '"' .. name .. '"';
                end
                i = i + 1;
                buff = UnitBuff("target", i);
            end;
            
            if #buffs < 1 then
                buffs = "";
            else
                buffs[1] = "" .. buffs[1];
                buffs = table.concat(buffs, " | ");
            end;
            dico.targetbufflist=buffs;
            
            local debuffs, i = { }, 1;
            local debuff = UnitDebuff("target", i);
            
            while debuff do
                local name = GetSpellInfo(debuff);
                if name then
                    debuffs[#debuffs + 1] = '"' .. name .. '"';
                end
                i = i + 1;
                debuff = UnitDebuff("target", i);
            end;
            
            if #debuffs < 1 then
                debuffs = "";
            else
                debuffs[1] = "" .. debuffs[1];
                debuffs = table.concat(debuffs, " | ");
            end;
            dico.targetdebufflist=debuffs;
            
            
            
            local buffs, i = { }, 1;
            local buff = UnitBuff(player, i);
            
            while buff do
                local name = GetSpellInfo(buff);
                if name then
                    buffs[#buffs + 1] = '"' .. name .. '"';
                end
                i = i + 1;
                buff = UnitBuff(player, i);
            end;
            
            if #buffs < 1 then
                buffs = "";
            else
                buffs[1] = "" .. buffs[1];
                buffs = table.concat(buffs, " | ");
            end;
            dico.bufflist=buffs;
            
            local debuffs, i = { }, 1;
            local debuff = UnitDebuff(player, i);
            
            while debuff do
                local name = GetSpellInfo(debuff);
                if name then
                    debuffs[#debuffs + 1] = '"' .. name .. '"';
                end
                i = i + 1;
                debuff = UnitDebuff(player, i);
            end;
            
            if #debuffs < 1 then
                debuffs = "";
            else
                debuffs[1] = "" .. debuffs[1];
                debuffs = table.concat(debuffs, " | ");
            end;
            dico.debufflist=debuffs;
            
        end
        

------------------------------[[
   
        local munit = "mouseover"
        local serverID="eu"
        dico.mname, dico.mrealm = UnitName(munit)
        dico.mguildName, _, _, dico.mrealmGuild = GetGuildInfo(munit)
        
        dico.misplayer=UnitIsPlayer(munit)
        if dico.mname==nil then dico.mname="" end
        if dico.mrealm==nil then dico.mrealm="" end
        if dico.mrealm==nil then  dico.mrealm="" end
        if dico.mguildName==nil then dico.mguildName="" end
        
        
        
        if  dico.mrealmGuild==nil or dico.mrealmGuild=="" then
            dico.mrealmGuild=GetRealmName()
        end
        if  dico.mrealm==nil or dico.mrealm=="" then
            dico.mrealm=GetRealmName()
        end
        
            
        dico.mouse_player_url=string.format("https://worldofwarcraft.blizzard.com/en-gb/character/%s/%s/%s \n",serverID , dico.mrealm , dico.mname)
        dico.mouse_guild_url=string.format("https://worldofwarcraft.blizzard.com/en-gb/guild/%s/%s/%s\n",serverID , dico.mrealm , dico.mguildName)
        
   
    
    
    

----------------------------




        if partTwo==true then
            
            
            dico.screenWidth = UIParent:GetWidth()
            dico.screenHeight = UIParent:GetHeight()
            dico.mouseX, dico.mouseY = GetCursorPosition()
            _,dico.playerclass,_ = UnitClass(player)
            
            
            
            dico.istargetplayer= UnitIsPlayer(target)
            dico.istargettargetplayer= UnitIsPlayer(tt)
            dico.ispetdeath=UnitIsDead("pet")
            
            local targetOfTarget = "targettarget"
            dico.targetHasTarget = UnitExists(targetOfTarget)
            if UnitExists(targetOfTarget) then
                dico.targettargetname = UnitName(targetOfTarget)
                dico.targettargetunitClass, _, classID = UnitClass(targetOfTarget)
                dico.targettargetunitLevel = UnitLevel(targetOfTarget)
                dico.targettargetunitHealth = UnitHealth(targetOfTarget)
                dico.targettargetunitMaxHealth = UnitHealthMax(targetOfTarget)
                dico.targettargetunitPowerType = UnitPowerType(targetOfTarget)
                dico.targettargetunitPower = UnitPower(targetOfTarget)
                dico.targettargetunitMaxPower = UnitPowerMax(targetOfTarget)
                dico.targettargetunitIsPlayer = UnitIsPlayer(targetOfTarget)
                dico.targettargetunitIsDead = UnitIsDeadOrGhost(targetOfTarget)
            else
                dico.targettargetname = ""
                dico.targettargetunitClass=""
                dico.targettargetunitLevel =""
                dico.targettargetunitHealth =""
                dico.targettargetunitMaxHealth =""
                dico.targettargetunitPowerType =""
                dico.targettargetunitPower =""
                dico.targettargetunitMaxPower=""
                dico.targettargetunitIsPlayer =""
                dico.targettargetunitIsDead =""
            end
            
            -- Does it means that I could make a tool to get all the bots in a region to report :)
            dico.tguildName, dico.tguildRankName, dico.tguildRankIndex, dico.tguildRealm, dico.tguildMembers, dico.tguildAchievementPoints, dico.tguildAchievementPointsMax, dico.tguildLevel, _ = GetGuildInfo(target)
            dico.pguildName, dico.pguildRankName, dico.pguildRankIndex, dico.pguildRealm, dico.pguildMembers, dico.pguildAchievementPoints, dico.pguildAchievementPointsMax, dico.pguildLevel, _ = GetGuildInfo(player)
            
            
            dico.tguildName =      dico.tguildName or ""
            dico.tguildRankName =  dico.tguildRankName or ""
            dico.tguildRankIndex =         dico.tguildRankIndex or ""
            dico.tguildRealm =        dico.tguildRealm or ""
            dico.tguildMembers =         dico.tguildMembers or ""
            dico.tguildAchievementPoints =         dico.tguildAchievementPoints or ""
            dico.tguildAchievementPointsMax =           dico.tguildAchievementPointsMax or ""
            dico.tguildLevel =           dico.tguildLevel or ""
            dico.pguildName =      dico.pguildName or ""
            dico.pguildRankName =       dico.pguildRankName or ""
            dico.pguildRankIndex =        dico.pguildRankIndex or ""
            dico.pguildRealm =         dico.pguildRealm or ""
            dico.pguildMembers =        dico.pguildMembers or ""
            dico.pguildAchievementPoints =          dico.pguildAchievementPoints or ""
            dico.pguildAchievementPointsMax =         dico.pguildAchievementPointsMax  or ""
            dico.pguildLevel =         dico.pguildLevel or ""
            
            
            dico.pguildRealm = dico.pguildRealm=="" and GetRealmName() or ""
            dico.tguildRealm= dico.tguildRealm=="" and GetRealmName() or ""
            
            
            -- Not sure of the condition of use
            --[[
        local playerName = "Venaliinagwy"
        local realmName = "Doomhammer"
        
        local idname = playerName .. "-" .. realmName
        
        dico.isPlayerConnected= UnitIsConnected(idname) 
        ]]
            
        end
        
        if partOne ==true then
            
            local isTargetFriendly= UnitIsFriend("player", "target")
            dico.isTargetAlly= isTargetFriendly and "True" or "False"
            
            
            dico.gold= GetMoney()
            
            
            
            local _, _, _, _, intellect, agility, stamina, strength = UnitStat("player", 1, 2, 3, 4)
            local mastery = GetMasteryEffect()
            local haste = GetHaste()
            local leech = GetLifesteal()
            local crit = GetCritChance()
            local versatility = GetCombatRatingBonus(CR_VERSATILITY_DAMAGE_DONE) + GetVersatilityBonus(CR_VERSATILITY_DAMAGE_TAKEN)
            local _, _, _, ilvl = GetAverageItemLevel()
            
            
            
            local startTime, duration, _ = GetSpellCooldown(6948)
            dico.cd_hearthstonestarttime =  startTime 
            dico.cd_hearthstonestarttime =  duration 
            dico.time = GetTime()
            
            
            dico.casting = select(1, UnitCastingInfo("player"))
            dico.channel = select(1, UnitChannelInfo("player"))
            if dico.casting ==nil then
                dico.casting=""
            end
            if dico.channel ==nil then
                dico.channel=""
            end
            
            
            dico.statIntellectBase, dico.statIntellectStat, dico.statIntellectPosBuff, dico.statIntellectNegBuff = UnitStat(player, 1);
            dico.statAgilityBase, dico.statAgilityStat, dico.statAgilityPosBuff, dico.statAgilityNegBuff = UnitStat(player, 2);
            dico.statStaminaBase, dico.statStaminaStat, dico.statStaminaPosBuff, dico.statStaminaNegBuff = UnitStat(player, 3);
            dico.statStrenghtBase, dico.statStrenghtStat, dico.statStrenghtPosBuff, dico.statStrenghtNegBuff = UnitStat(player, 4);
            dico.armorBase, dico.armorEffectiveArmor, dico.armor, dico.armorPosBuff, dico.armorNegBuff = UnitArmor(player);
            
            dico.lastPingPositionx, dico.lastPingPositionY = Minimap:GetPingPosition()
            dico.mastery , dico.masteryCoefficient= GetMasteryEffect()
            dico.haste = GetHaste()
            dico.leech = GetLifesteal()
            dico.crit = GetCritChance()
            dico.versatility = GetCombatRatingBonus(CR_VERSATILITY_DAMAGE_DONE) + GetVersatilityBonus(CR_VERSATILITY_DAMAGE_TAKEN)
            local _, _, _, ilvl = GetAverageItemLevel()
            
            
            
            
            
            -- Target Information
            dico.targetName = UnitName("target") or "No Target"
            dico.targetHealth = UnitHealth("target") or 0
            dico.maxHealth = UnitHealthMax("target") or 1
            dico.targetPower = UnitPower("target") or 0
            dico.maxPower = UnitPowerMax("target") or 1
            dico.targetLevel = UnitLevel("target") or 0
            dico.targetClassification = UnitClassification("target") or "Normal"
            dico.targetCreatureType = UnitCreatureType("target") or "Unknown"
            dico.targetFaction = UnitFactionGroup("target") or "Unknown"
            
            dico.targetIsPlayer = UnitIsPlayer("target")
            dico.targetIsDead = UnitIsDead("target")
            dico.targetIsGhost = UnitIsGhost("target")
            dico.targetIsElite = UnitClassification("target") == "elite"
            dico.targetIsRare = UnitClassification("target") == "rare" or UnitClassification("target") == "rareelite"
            dico.targetIsBoss = UnitClassification("target") == "worldboss" or UnitClassification("target") == "rareelite"
            
            -- Player Information
            dico.playerName = UnitName("player") or "No Player"
            dico.playerHealth = UnitHealth("player") or 0
            dico.maxPlayerHealth = UnitHealthMax("player") or 1
            dico.playerPower = UnitPower("player") or 0
            dico.maxPlayerPower = UnitPowerMax("player") or 1
            dico.playerLevel = UnitLevel("player") or 0
            dico.playerClassification = UnitClassification("player") or "Normal"
            dico.playerCreatureType = UnitCreatureType("player") or "Unknown"
            dico.playerFaction = UnitFactionGroup("player") or "Unknown"
            
            dico.playerIsDead = UnitIsDead("player")
            dico.playerIsGhost = UnitIsGhost("player")
            dico.playerIsElite = UnitClassification("player") == "elite"
            dico.playerIsRare = UnitClassification("player") == "rare" or UnitClassification("player") == "rareelite"
            dico.playerIsBoss = UnitClassification("player") == "worldboss" or UnitClassification("player") == "rareelite"
            
            -- General Information
            dico.isInCombat = UnitAffectingCombat("player")
            dico.isMounted = IsMounted()
            dico.isStealthed = IsStealthed()
            dico.isInParty = IsInGroup()
            dico.isInRaid = IsInRaid()
            
            
            
            --]]
            -- BLOCK SECTION PART 1 Stop
        end
        
        
    end
    
    
    
    local timeTick =10
    local result = ""


    JustTest.Time= GetTime() 
    JustTest.Tick= math.floor( GetTime() / timeTick )
    JustTest[0]=JustTest.Tick
    JustTest[1]=dico.gold
    JustTest[2]=JustTest.Time

    result= anchorTick
    result = result.. "Tick Extract:"..(JustTest.Tick) .. "\n"
    result = result.."Time:"..GetTime().."\n"
    local keys = {}
    
    for key, _ in pairs(dico) do
        table.insert(keys, key)
    end
    
    -- Sort keys
    table.sort(keys)
    
    -- Iterate over sorted keys
    for _, key in ipairs(keys) do
        local value = dico[key]
        
        -- Check if the value is nil
        if value == nil then
            value = "nil"
        elseif type(value) == "boolean" then
            -- Convert boolean to string
            value = value and "True" or "False"
        end
        
        result = result .. key .. ":" .. value .. "\n"
    end
    

    RefreshTheTickBoundary()
    useAddressTagInjection=tickId%2==0
    if( useAddressTagInjection)then
        FlushValueBetweenBoundaryToInt(tagInjectionValueTextIndex)
        SetHasChangedTo(tagInjectionValueMemoryChanged)
    else
         SetMemoryText(result)

         SetHasChangedIncrement(hasChangeIndex)
    end
    return result
    
end






