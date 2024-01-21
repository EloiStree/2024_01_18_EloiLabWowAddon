SetBinding("L", "INTERACTTARGET")

local CreateMacro= function ()
    CreateMacro("Macro","INV_MISC_QUESTIONMARK", nil)
end


QuickTestRef ={}
QuickTestRef.start= function ()



    local createMacroCommand = '/run CreateMacro("Macro","INV_MISC_QUESTIONMARK", nil)'


    local macrotext=""
    for i=1,120 do 
        local    macroName, _, _ = GetMacroInfo(i)
        if macroName then 
            
            if i==1 then macrotext="/dejunk destroy"end
            if i==2 then macrotext="/sit "end
            if i==3 then macrotext="print('hello')"end
            if i==4 then macrotext="/reload"end
            if i==5 then macrotext="/elhelp"end
            if i==6 then macrotext="/elrtfm"end
            if macrotext~="" then 
                EditMacro(i, nil, nil, macrotext)
            end
        else 
            pcall(CreateMacro)
        end
        macrotext=""
    end
 
   
    print("Quick Test")
    dicoSetup= {}
    dicoSetup.SoftTargetInteract=3
    dicoSetup.SoftTargetInteractArc= 2

    dicoSetup.autoLootDefault= 1
    dicoSetup.autoInteract=0
    dicoSetup.showTutorials=0
    dicoSetup.autoLootRate=0

    dicoSetup.Sound_AmbienceVolume=1
    dicoSetup.Sound_DialogVolume=0
    dicoSetup.ChatMusicVolume	=0
    dicoSetup.ChatSoundVolume= 0
    dicoSetup.Sound_MasterVolume=1
    dicoSetup.Sound_MusicVolume=0
    dicoSetup.Sound_PingVolume=0
    dicoSetup.Sound_SFXVolume=0
    dicoSetup.maxFPS=1
    dicoSetup.maxFPSBk=1
    dicoSetup.maxFPSLoading=1
    dicoSetup.interactQuestItems=1
    
    dicoSetup.alwaysShowActionBars=1
    dicoSetup.Sound_EnableSoundWhenGameIsInBG=1
    


    dicoSetup.SoftTargetNameplateEnemy=0
    dicoSetup.SoftTargetNameplateFriend=0
    dicoSetup.SoftTargetNameplateInteract=0
    dicoSetup.SoftTargetNameplateSize=0
    --componentTextureLevel componentCompress
    --componentTexCacheSize componentTexLoadLimit
    --componentTextureLevel graphicsTextureResolution
    dicoSetup.useHighResolutionUITextures=0 ------ ?
    dicoSetup.worldMaxMipLevel=0
    dicoSetup.worldPreloadHighResTextures=0
    dicoSetup.SoftTargetNameplateSize=0
    dicoSetup.SoftTargetNameplateSize=0
    dicoSetup.useHighResolutionUITextures=0
    dicoSetup.SkyCloudLOD=0
    -- Can we go down ?
    ---- Min  0.009
    
    --dicoSetup.renderscale=0.009
    dicoSetup.renderscale=0.5
    dicoSetup.graphicsShadowQuality=0
    dicoSetup.graphicsLiquidDetail=0
    dicoSetup.graphicsParticleDensity=0
    dicoSetup.graphicsSSAO=0
    dicoSetup.graphicsDepthEffects=0
    dicoSetup.graphicsOutlineMode=2
    dicoSetup.graphicsSpellDensity=0
    dicoSetup.wmoLodDist=0
    dicoSetup.graphicsViewDistance=0
    dicoSetup.graphicsProjectedTextures=0
    dicoSetup.graphicsEnvironmentDetail=0
    dicoSetup.graphicsGroundClutter=0
    dicoSetup.textureFilteringMode=0
    dicoSetup.shadowRT=0
    dicoSetup.physicsLevel=0
    dicoSetup.ResampleQuality=0
    dicoSetup.ResampleSharpness=-1
    dicoSetup.ffxAntiAliasingMode=0
    dicoSetup.MSAAAlphaTest=0
    dicoSetup.ffxGlow=0
    dicoSetup.ffxDeath=0
    dicoSetup.ffxNether=0
    dicoSetup.ffxVenari=0
    dicoSetup.ffxLingeringVenari=0
    dicoSetup.cameraFov=90 --50-90
    dicoSetup.sunShafts=0
    dicoSetup.windowResizeLock=0
    -- Source: https://www.dual-boxing.com/threads/52701-Console-Variables-for-Video-Settings-(Dragonflight)

    --SetBinding("key", "SPELL " .. spell);
    --SetBinding("key", "ITEM " .. item);
    --SetBindingMacro("key", "macroName" or macroId);
    --SetBindingMacro("key", "macroName" or macroId);

    --https://wowwiki-archive.fandom.com/wiki/API_SetBinding
    --https://wowpedia.fandom.com/wiki/API_SetBinding
    bindingSetup= {}
    bindingSetup.INTERACTTARGET="F"

    bindingSetup.MOVEFORWARD= "Z"
    bindingSetup.MOVEBACKWARD= "S"
    bindingSetup.STRAFELEFT= "Q"
    bindingSetup.STRAFERIGHT= "D"
    bindingSetup.TURNLEFT= "A"
    bindingSetup.TURNRIGHT= "E"
    bindingSetup.JUMP= "SPACE"

    
    bindingSetup.TOGGLEAUTORUN= "BUTTON3"
    bindingSetup.FOLLOWTARGET= "w"
    bindingSetup.TOGGLEBACKPACK= "E"


--A, B, C, ..., Z
--1, 2, 3, ..., 9, 0
--F1, F2, F3, ..., F12
--ESC, TAB, SPACE, ENTER, BACKSPACE, INSERT, HOME, PAGEUP, PAGEDOWN, END, DELETE
--UP, DOWN, LEFT, RIGHT
--ALT, CTRL, SHIFT
--BUTTON1, BUTTON2, ..., BUTTON5 (Mouse buttons)
--MOUSEWHEELUP, MOUSEWHEELDOWN
--MOUSEOVER
--NUMPAD1, NUMPAD2, ..., NUMPAD9, NUMPAD0
--NUMPADDIVIDE (/), NUMPADMULTIPLY (*), NUMPADSUBTRACT (-), NUMPADADD (+), NUMPADDECIMAL (.)
--NUMPADENTER
--LALT, LCTRL, LSHIFT, RALT, RCTRL, RSHIFT (Modifiers)

--bindingSetup["MACRO 1"]="i"     
--bindingSetup["MACRO 2"]="o"     
--bindingSetup["MACRO 3"]=""     
--bindingSetup["MACRO 4"]=""     
--bindingSetup["MACRO 5"]=""     
--bindingSetup["MACRO 6"]=""     
--bindingSetup["MACRO 7"]=""     
--bindingSetup["MACRO 8"]=""     
--bindingSetup["MACRO 9"]=""
--bindingSetup["MACRO 10"]=""     
--bindingSetup["MACRO 11"]=""     
--bindingSetup["MACRO 12"]=""     
--bindingSetup["MACRO 13"]=""     
--bindingSetup["MACRO 14"]=""     
--bindingSetup["MACRO 15"]=""     
--bindingSetup["MACRO 16"]=""     
--bindingSetup["MACRO 17"]=""     
--bindingSetup["MACRO 18"]=""     
--bindingSetup["MACRO 19"]=""

bindingSetup.ACTIONBUTTON1="1"
bindingSetup.ACTIONBUTTON2="2"
bindingSetup.ACTIONBUTTON3="3"
bindingSetup.ACTIONBUTTON4="4"
bindingSetup.ACTIONBUTTON5="5"
bindingSetup.ACTIONBUTTON6="6"
bindingSetup.ACTIONBUTTON7="7"
bindingSetup.ACTIONBUTTON8="8"
bindingSetup.ACTIONBUTTON9="9"
bindingSetup.ACTIONBUTTON10="10"
bindingSetup.ACTIONBUTTON11="11"
bindingSetup.ACTIONBUTTON12="12"

bindingSetup.ACTIONBAR1BUTTON1="NUMPAD1"
bindingSetup.ACTIONBAR1BUTTON2="NUMPAD2"
bindingSetup.ACTIONBAR1BUTTON3="NUMPAD3"
bindingSetup.ACTIONBAR1BUTTON4="NUMPAD4"
bindingSetup.ACTIONBAR1BUTTON5="NUMPAD5"
bindingSetup.ACTIONBAR1BUTTON6="NUMPAD6"
bindingSetup.ACTIONBAR1BUTTON7="NUMPAD7"
bindingSetup.ACTIONBAR1BUTTON8="NUMPAD8"
bindingSetup.ACTIONBAR1BUTTON9="NUMPAD9"
bindingSetup.ACTIONBAR1BUTTON10="NUMPAD10"
bindingSetup.ACTIONBAR1BUTTON11="NUMPAD11"
bindingSetup.ACTIONBAR1BUTTON12="NUMPAD12"

bindingSetup.ACTIONBAR2BUTTON1="F1"
bindingSetup.ACTIONBAR2BUTTON2="F2"
bindingSetup.ACTIONBAR2BUTTON3="F3"
bindingSetup.ACTIONBAR2BUTTON4="F4"
bindingSetup.ACTIONBAR2BUTTON5="F5"
bindingSetup.ACTIONBAR2BUTTON6="F6"
bindingSetup.ACTIONBAR2BUTTON7="F7"
bindingSetup.ACTIONBAR2BUTTON8="F8"
bindingSetup.ACTIONBAR2BUTTON9="F9"
bindingSetup.ACTIONBAR2BUTTON10="F10"
bindingSetup.ACTIONBAR2BUTTON11="F11"
bindingSetup.ACTIONBAR2BUTTON12="F12"

bindingSetup.TOGGLESIT              =""      
bindingSetup.TARGETNEARESTENEMY  ="Tab"
bindingSetup.TARGETPREVIOUSENEMY ="i"
bindingSetup.TARGETSCANENEMY     ="Tab"
bindingSetup.TARGETNEARESTFRIEND ="u"
bindingSetup.TARGETSELF  =""
bindingSetup.RAIDTARGET1 =""
bindingSetup.RAIDTARGET2 =""
bindingSetup.RAIDTARGET3 =""
bindingSetup.RAIDTARGET4 =""
bindingSetup.RAIDTARGET5 =""
bindingSetup.RAIDTARGET6 =""
bindingSetup.RAIDTARGET7 =""
bindingSetup.RAIDTARGET8 =""
bindingSetup.RAIDTARGETNONE =""
bindingSetup.RAIDTARGET9  =""
bindingSetup.RAIDTARGET10 =""
bindingSetup.RAIDTARGET11 =""
bindingSetup.RAIDTARGET12 =""
bindingSetup.RAIDTARGET13 =""
bindingSetup.Dismount =""
bindingSetup.STOPCASTING =""
bindingSetup.STOPATTACK =""
bindingSetup.TARGETPARTYMEMBER1=""
bindingSetup.TARGETPARTYMEMBER2=""
bindingSetup.TARGETPARTYMEMBER3=""
bindingSetup.TARGETPARTYMEMBER4=""
bindingSetup.ACTIONPAGE1=""
bindingSetup.ACTIONPAGE2=""
bindingSetup.ACTIONPAGE3=""
bindingSetup.ACTIONPAGE4=""
bindingSetup.ACTIONPAGE5=""
bindingSetup.ACTIONPAGE6=""
bindingSetup.PET_ACTIONBUTTON1=""
bindingSetup.PET_ACTIONBUTTON2=""
bindingSetup.PET_ACTIONBUTTON3=""
bindingSetup.PET_ACTIONBUTTON4=""
bindingSetup.PET_ACTIONBUTTON5=""
bindingSetup.PET_ACTIONBUTTON6=""
bindingSetup.PET_ACTIONBUTTON7=""
bindingSetup.PET_ACTIONBUTTON8=""
bindingSetup.PET_ACTIONBUTTON9=""
bindingSetup.PET_ACTIONBUTTON10=""
bindingSetup.TARGETLASTHOSTILE="G"
bindingSetup.TARGETLASTTARGET="H"
bindingSetup.FOCUS="J"




    print("T")
    SetOptionVARCFromDico(dicoSetup)
    print("I")
    SetBindingFromDico(bindingSetup)
    print("Quick Test")
end


function SetOptionVARCFromDico(dicoSetup)
    local keys = {}
    
    for key, _ in pairs(dicoSetup) do
        table.insert(keys, key)
    end
    
    -- Sort keys
    table.sort(keys)
    
    -- Iterate over sorted keys
    for _, key in ipairs(keys) do
        local value = dicoSetup[key]
            
        -- Check if the value is nil
        if value ~= nil then 
            SetCVar(key, value)
        end         
    end

end


function SetBindingFromDico(dicoSetup)
    local keys = {}
    
    for key, _ in pairs(dicoSetup) do
        table.insert(keys, key)
    end
    
    -- Sort keys
    table.sort(keys)
    
    -- Iterate over sorted keys
    for _, key in ipairs(keys) do
        local value = dicoSetup[key]
            
        -- Check if the value is nil
        if value ~= nil and value ~= "" and value ~= " " then 
            SetBinding(value, key)
        end         
    end
    
    SaveBindings(GetCurrentBindingSet())
end