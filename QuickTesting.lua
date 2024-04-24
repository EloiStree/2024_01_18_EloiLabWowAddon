SetBinding("L", "INTERACTTARGET")

local CreateMacro= function ()
    CreateMacro("Macro","INV_MISC_QUESTIONMARK", nil)
end


QuickTestRef ={}
QuickTestRef.start= function ()


    print("Quick Test")
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
    local dicoSetup= {}
    dicoSetup.SoftTargetInteract=3
    dicoSetup.SoftTargetInteractArc= 2

    dicoSetup.autoLootDefault= 1
    dicoSetup.autoInteract=0
    dicoSetup.showTutorials=0
    dicoSetup.autoLootRate=0

    dicoSetup.Sound_AmbienceVolume=0
    dicoSetup.Sound_DialogVolume=0
    dicoSetup.ChatMusicVolume	=0
    dicoSetup.ChatSoundVolume= 0
    dicoSetup.Sound_MasterVolume=1
    dicoSetup.Sound_MusicVolume=0
    dicoSetup.Sound_PingVolume=0
    dicoSetup.Sound_SFXVolume=1
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
    -- /console gxWindow 1
    -- /console gxWindowedResolution "640x480"
    -- /console RenderScale 0.1
    -- /reload
    SetCVar("gxWindow", 1)
    SetCVar("RenderScale", 0.01)
    SetCVar("gxWindowedResolution", "640x480")
    SetCVar("gxWindowedResolution", "320x240")
    ReloadUI()

    -- Apply changes
    --dicoSetup.renderscale=0.2
    --print("R 0.009")
    --dicoSetup.renderscale=0.009
   -- dicoSetup.renderscale=0.009
    --dicoSetup.renderscale=0.5
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

    
   --SetBinding("INTERACTTARGET", "I")
   ----SetBinding("INTERACTTARGET", "F")
   --SetBinding("FOLLOWTARGET", "F")
   --SetBinding("TARGETPREVIOUSENEMY", "O")


dicoSetup.alwaysShowActionBars = 1

   
SetCVar("alwaysShowActionBars", 1)
   

    bindingSetup= {}
    

    --Source: https://www.mmo-champion.com/threads/1450919-mouse-turn-keybind
    SetBinding('BUTTON1', 'TURNORACTION')
    SetBinding('BUTTON2', 'CAMERAORSELECTORMOVE')
    --SetBinding('C', 'CAMERAORSELECTORMOVE')

-- FULL LIST in Feb 2024

SetBinding("","MOVEANDSTEER")
SetBinding("BUTTON3","MOVEANDSTEER")
SetBinding("UP","MOVEFORWARD")
SetBinding("W","MOVEFORWARD")
SetBinding("DOWN","MOVEBACKWARD")
SetBinding("S","MOVEBACKWARD")
SetBinding("LEFT","TURNLEFT")
SetBinding("A","TURNLEFT")
SetBinding("RIGHT","TURNRIGHT")
SetBinding("D","TURNRIGHT")
SetBinding("","STRAFELEFT")
SetBinding("Q","STRAFELEFT")
SetBinding("","STRAFERIGHT")
SetBinding("E","STRAFERIGHT")
SetBinding("NUMPAD0","JUMP")
SetBinding("SPACE","JUMP")
SetBinding("","SITORSTAND")
SetBinding("X","SITORSTAND")
SetBinding("","TOGGLESHEATH")
SetBinding("Z","TOGGLESHEATH")
SetBinding("BUTTON4","TOGGLEAUTORUN")
SetBinding("NUMLOCK","TOGGLEAUTORUN")
SetBinding("","STARTAUTORUN")
SetBinding("","STARTAUTORUN")
SetBinding("","STOPAUTORUN")
SetBinding("","STOPAUTORUN")
SetBinding("","PITCHUP")
SetBinding("INSERT","PITCHUP")
SetBinding("","PITCHDOWN")
SetBinding("DELETE","PITCHDOWN")
SetBinding("","TOGGLERUN")
SetBinding("NUMPADDIVIDE","TOGGLERUN")
SetBinding("","FOLLOWTARGET")
SetBinding("","FOLLOWTARGET")
SetBinding("","OPENCHAT")
SetBinding("ENTER","OPENCHAT")
SetBinding("","OPENCHATSLASH")
SetBinding("/","OPENCHATSLASH")
SetBinding("","CHATPAGEUP")
SetBinding("PAGEUP","CHATPAGEUP")
SetBinding("","CHATPAGEDOWN")
SetBinding("PAGEDOWN","CHATPAGEDOWN")
SetBinding("","CHATBOTTOM")
SetBinding("SHIFT-PAGEDOWN","CHATBOTTOM")
SetBinding("","REPLY")
SetBinding("R","REPLY")
SetBinding("","REPLY2")
SetBinding("SHIFT-R","REPLY2")
SetBinding("","COMBATLOGPAGEUP")
SetBinding("CTRL-PAGEUP","COMBATLOGPAGEUP")
SetBinding("","COMBATLOGPAGEDOWN")
SetBinding("CTRL-PAGEDOWN","COMBATLOGPAGEDOWN")
SetBinding("","COMBATLOGBOTTOM")
SetBinding("CTRL-SHIFT-PAGEDOWN","COMBATLOGBOTTOM")
SetBinding("","TOGGLE_VOICE_SELF_MUTE")
SetBinding("","TOGGLE_VOICE_SELF_MUTE")
SetBinding("","TOGGLE_VOICE_SELF_DEAFEN")
SetBinding("","TOGGLE_VOICE_SELF_DEAFEN")
SetBinding("","TOGGLE_VOICE_PUSH_TO_TALK")
SetBinding("","TOGGLE_VOICE_PUSH_TO_TALK")
SetBinding("","TEXT_TO_SPEECH_STOP")
SetBinding("","TEXT_TO_SPEECH_STOP")
SetBinding("","ACTIONBUTTON1")
SetBinding("1","ACTIONBUTTON1")
SetBinding("","ACTIONBUTTON2")
SetBinding("2","ACTIONBUTTON2")
SetBinding("","ACTIONBUTTON3")
SetBinding("3","ACTIONBUTTON3")
SetBinding("","ACTIONBUTTON4")
SetBinding("4","ACTIONBUTTON4")
SetBinding("","ACTIONBUTTON5")
SetBinding("5","ACTIONBUTTON5")
SetBinding("","ACTIONBUTTON6")
SetBinding("6","ACTIONBUTTON6")
SetBinding("","ACTIONBUTTON7")
SetBinding("7","ACTIONBUTTON7")
SetBinding("","ACTIONBUTTON8")
SetBinding("8","ACTIONBUTTON8")
SetBinding("","ACTIONBUTTON9")
SetBinding("9","ACTIONBUTTON9")
SetBinding("","ACTIONBUTTON10")
SetBinding("0","ACTIONBUTTON10")
SetBinding("","ACTIONBUTTON11")
SetBinding("-","ACTIONBUTTON11")
SetBinding("","ACTIONBUTTON12")
SetBinding("=","ACTIONBUTTON12")
SetBinding("","EXTRAACTIONBUTTON1")
SetBinding("","EXTRAACTIONBUTTON1")
SetBinding("","SHAPESHIFTBUTTON1")
SetBinding("CTRL-F1","SHAPESHIFTBUTTON1")
SetBinding("","SHAPESHIFTBUTTON2")
SetBinding("CTRL-F2","SHAPESHIFTBUTTON2")
SetBinding("","SHAPESHIFTBUTTON3")
SetBinding("CTRL-F3","SHAPESHIFTBUTTON3")
SetBinding("","SHAPESHIFTBUTTON4")
SetBinding("CTRL-F4","SHAPESHIFTBUTTON4")
SetBinding("","SHAPESHIFTBUTTON5")
SetBinding("CTRL-F5","SHAPESHIFTBUTTON5")
SetBinding("","SHAPESHIFTBUTTON6")
SetBinding("CTRL-F6","SHAPESHIFTBUTTON6")
SetBinding("","SHAPESHIFTBUTTON7")
SetBinding("CTRL-F7","SHAPESHIFTBUTTON7")
SetBinding("","SHAPESHIFTBUTTON8")
SetBinding("CTRL-F8","SHAPESHIFTBUTTON8")
SetBinding("","SHAPESHIFTBUTTON9")
SetBinding("CTRL-F9","SHAPESHIFTBUTTON9")
SetBinding("","SHAPESHIFTBUTTON10")
SetBinding("CTRL-F10","SHAPESHIFTBUTTON10")
SetBinding("","BONUSACTIONBUTTON1")
SetBinding("CTRL-1","BONUSACTIONBUTTON1")
SetBinding("","BONUSACTIONBUTTON2")
SetBinding("CTRL-2","BONUSACTIONBUTTON2")
SetBinding("","BONUSACTIONBUTTON3")
SetBinding("CTRL-3","BONUSACTIONBUTTON3")
SetBinding("","BONUSACTIONBUTTON4")
SetBinding("CTRL-4","BONUSACTIONBUTTON4")
SetBinding("","BONUSACTIONBUTTON5")
SetBinding("CTRL-5","BONUSACTIONBUTTON5")
SetBinding("","BONUSACTIONBUTTON6")
SetBinding("CTRL-6","BONUSACTIONBUTTON6")
SetBinding("","BONUSACTIONBUTTON7")
SetBinding("CTRL-7","BONUSACTIONBUTTON7")
SetBinding("","BONUSACTIONBUTTON8")
SetBinding("CTRL-8","BONUSACTIONBUTTON8")
SetBinding("","BONUSACTIONBUTTON9")
SetBinding("CTRL-9","BONUSACTIONBUTTON9")
SetBinding("","BONUSACTIONBUTTON10")
SetBinding("CTRL-0","BONUSACTIONBUTTON10")
SetBinding("","ACTIONPAGE1")
SetBinding("","ACTIONPAGE1")
SetBinding("","ACTIONPAGE2")
SetBinding("","ACTIONPAGE2")
SetBinding("","ACTIONPAGE3")
SetBinding("","ACTIONPAGE3")
SetBinding("","ACTIONPAGE4")
SetBinding("","ACTIONPAGE4")
SetBinding("","ACTIONPAGE5")
SetBinding("","ACTIONPAGE5")
SetBinding("","ACTIONPAGE6")
SetBinding("","ACTIONPAGE6")
SetBinding("","PREVIOUSACTIONPAGE")
SetBinding("","PREVIOUSACTIONPAGE")
SetBinding("","NEXTACTIONPAGE")
SetBinding("","NEXTACTIONPAGE")
SetBinding("","TOGGLEACTIONBARLOCK")
SetBinding("","TOGGLEACTIONBARLOCK")
SetBinding("","TOGGLEAUTOSELFCAST")
SetBinding("","TOGGLEAUTOSELFCAST")
SetBinding("","MULTIACTIONBAR1BUTTON1")
SetBinding("","MULTIACTIONBAR1BUTTON1")
SetBinding("","MULTIACTIONBAR1BUTTON2")
SetBinding("","MULTIACTIONBAR1BUTTON2")
SetBinding("","MULTIACTIONBAR1BUTTON3")
SetBinding("","MULTIACTIONBAR1BUTTON3")
SetBinding("","MULTIACTIONBAR1BUTTON4")
SetBinding("","MULTIACTIONBAR1BUTTON4")
SetBinding("","MULTIACTIONBAR1BUTTON5")
SetBinding("","MULTIACTIONBAR1BUTTON5")
SetBinding("","MULTIACTIONBAR1BUTTON6")
SetBinding("","MULTIACTIONBAR1BUTTON6")
SetBinding("","MULTIACTIONBAR1BUTTON7")
SetBinding("","MULTIACTIONBAR1BUTTON7")
SetBinding("","MULTIACTIONBAR1BUTTON8")
SetBinding("","MULTIACTIONBAR1BUTTON8")
SetBinding("","MULTIACTIONBAR1BUTTON9")
SetBinding("","MULTIACTIONBAR1BUTTON9")
SetBinding("","MULTIACTIONBAR1BUTTON10")
SetBinding("","MULTIACTIONBAR1BUTTON10")
SetBinding("","MULTIACTIONBAR1BUTTON11")
SetBinding("","MULTIACTIONBAR1BUTTON11")
SetBinding("","MULTIACTIONBAR1BUTTON12")
SetBinding("","MULTIACTIONBAR1BUTTON12")
SetBinding("","MULTIACTIONBAR2BUTTON1")
SetBinding("","MULTIACTIONBAR2BUTTON1")
SetBinding("","MULTIACTIONBAR2BUTTON2")
SetBinding("","MULTIACTIONBAR2BUTTON2")
SetBinding("","MULTIACTIONBAR2BUTTON3")
SetBinding("","MULTIACTIONBAR2BUTTON3")
SetBinding("","MULTIACTIONBAR2BUTTON4")
SetBinding("","MULTIACTIONBAR2BUTTON4")
SetBinding("","MULTIACTIONBAR2BUTTON5")
SetBinding("","MULTIACTIONBAR2BUTTON5")
SetBinding("","MULTIACTIONBAR2BUTTON6")
SetBinding("","MULTIACTIONBAR2BUTTON6")
SetBinding("","MULTIACTIONBAR2BUTTON7")
SetBinding("","MULTIACTIONBAR2BUTTON7")
SetBinding("","MULTIACTIONBAR2BUTTON8")
SetBinding("","MULTIACTIONBAR2BUTTON8")
SetBinding("","MULTIACTIONBAR2BUTTON9")
SetBinding("","MULTIACTIONBAR2BUTTON9")
SetBinding("","MULTIACTIONBAR2BUTTON10")
SetBinding("","MULTIACTIONBAR2BUTTON10")
SetBinding("","MULTIACTIONBAR2BUTTON11")
SetBinding("","MULTIACTIONBAR2BUTTON11")
SetBinding("","MULTIACTIONBAR2BUTTON12")
SetBinding("","MULTIACTIONBAR2BUTTON12")
SetBinding("","MULTIACTIONBAR3BUTTON1")
SetBinding("","MULTIACTIONBAR3BUTTON1")
SetBinding("","MULTIACTIONBAR3BUTTON2")
SetBinding("","MULTIACTIONBAR3BUTTON2")
SetBinding("","MULTIACTIONBAR3BUTTON3")
SetBinding("","MULTIACTIONBAR3BUTTON3")
SetBinding("","MULTIACTIONBAR3BUTTON4")
SetBinding("","MULTIACTIONBAR3BUTTON4")
SetBinding("","MULTIACTIONBAR3BUTTON5")
SetBinding("","MULTIACTIONBAR3BUTTON5")
SetBinding("","MULTIACTIONBAR3BUTTON6")
SetBinding("","MULTIACTIONBAR3BUTTON6")
SetBinding("","MULTIACTIONBAR3BUTTON7")
SetBinding("","MULTIACTIONBAR3BUTTON7")
SetBinding("","MULTIACTIONBAR3BUTTON8")
SetBinding("","MULTIACTIONBAR3BUTTON8")
SetBinding("","MULTIACTIONBAR3BUTTON9")
SetBinding("","MULTIACTIONBAR3BUTTON9")
SetBinding("","MULTIACTIONBAR3BUTTON10")
SetBinding("","MULTIACTIONBAR3BUTTON10")
SetBinding("","MULTIACTIONBAR3BUTTON11")
SetBinding("","MULTIACTIONBAR3BUTTON11")
SetBinding("","MULTIACTIONBAR3BUTTON12")
SetBinding("","MULTIACTIONBAR3BUTTON12")
SetBinding("","MULTIACTIONBAR4BUTTON1")
SetBinding("","MULTIACTIONBAR4BUTTON1")
SetBinding("","MULTIACTIONBAR4BUTTON2")
SetBinding("","MULTIACTIONBAR4BUTTON2")
SetBinding("","MULTIACTIONBAR4BUTTON3")
SetBinding("","MULTIACTIONBAR4BUTTON3")
SetBinding("","MULTIACTIONBAR4BUTTON4")
SetBinding("","MULTIACTIONBAR4BUTTON4")
SetBinding("","MULTIACTIONBAR4BUTTON5")
SetBinding("","MULTIACTIONBAR4BUTTON5")
SetBinding("","MULTIACTIONBAR4BUTTON6")
SetBinding("","MULTIACTIONBAR4BUTTON6")
SetBinding("","MULTIACTIONBAR4BUTTON7")
SetBinding("","MULTIACTIONBAR4BUTTON7")
SetBinding("","MULTIACTIONBAR4BUTTON8")
SetBinding("","MULTIACTIONBAR4BUTTON8")
SetBinding("","MULTIACTIONBAR4BUTTON9")
SetBinding("","MULTIACTIONBAR4BUTTON9")
SetBinding("","MULTIACTIONBAR4BUTTON10")
SetBinding("","MULTIACTIONBAR4BUTTON10")
SetBinding("","MULTIACTIONBAR4BUTTON11")
SetBinding("","MULTIACTIONBAR4BUTTON11")
SetBinding("","MULTIACTIONBAR4BUTTON12")
SetBinding("","MULTIACTIONBAR4BUTTON12")
SetBinding("","MULTIACTIONBAR5BUTTON1")
SetBinding("","MULTIACTIONBAR5BUTTON1")
SetBinding("","MULTIACTIONBAR5BUTTON2")
SetBinding("","MULTIACTIONBAR5BUTTON2")
SetBinding("","MULTIACTIONBAR5BUTTON3")
SetBinding("","MULTIACTIONBAR5BUTTON3")
SetBinding("","MULTIACTIONBAR5BUTTON4")
SetBinding("","MULTIACTIONBAR5BUTTON4")
SetBinding("","MULTIACTIONBAR5BUTTON5")
SetBinding("","MULTIACTIONBAR5BUTTON5")
SetBinding("","MULTIACTIONBAR5BUTTON6")
SetBinding("","MULTIACTIONBAR5BUTTON6")
SetBinding("","MULTIACTIONBAR5BUTTON7")
SetBinding("","MULTIACTIONBAR5BUTTON7")
SetBinding("","MULTIACTIONBAR5BUTTON8")
SetBinding("","MULTIACTIONBAR5BUTTON8")
SetBinding("","MULTIACTIONBAR5BUTTON9")
SetBinding("","MULTIACTIONBAR5BUTTON9")
SetBinding("","MULTIACTIONBAR5BUTTON10")
SetBinding("","MULTIACTIONBAR5BUTTON10")
SetBinding("","MULTIACTIONBAR5BUTTON11")
SetBinding("","MULTIACTIONBAR5BUTTON11")
SetBinding("","MULTIACTIONBAR5BUTTON12")
SetBinding("","MULTIACTIONBAR5BUTTON12")
SetBinding("","MULTIACTIONBAR6BUTTON1")
SetBinding("","MULTIACTIONBAR6BUTTON1")
SetBinding("","MULTIACTIONBAR6BUTTON2")
SetBinding("","MULTIACTIONBAR6BUTTON2")
SetBinding("","MULTIACTIONBAR6BUTTON3")
SetBinding("","MULTIACTIONBAR6BUTTON3")
SetBinding("","MULTIACTIONBAR6BUTTON4")
SetBinding("","MULTIACTIONBAR6BUTTON4")
SetBinding("","MULTIACTIONBAR6BUTTON5")
SetBinding("","MULTIACTIONBAR6BUTTON5")
SetBinding("","MULTIACTIONBAR6BUTTON6")
SetBinding("","MULTIACTIONBAR6BUTTON6")
SetBinding("","MULTIACTIONBAR6BUTTON7")
SetBinding("","MULTIACTIONBAR6BUTTON7")
SetBinding("","MULTIACTIONBAR6BUTTON8")
SetBinding("","MULTIACTIONBAR6BUTTON8")
SetBinding("","MULTIACTIONBAR6BUTTON9")
SetBinding("","MULTIACTIONBAR6BUTTON9")
SetBinding("","MULTIACTIONBAR6BUTTON10")
SetBinding("","MULTIACTIONBAR6BUTTON10")
SetBinding("","MULTIACTIONBAR6BUTTON11")
SetBinding("","MULTIACTIONBAR6BUTTON11")
SetBinding("","MULTIACTIONBAR6BUTTON12")
SetBinding("","MULTIACTIONBAR6BUTTON12")
SetBinding("","MULTIACTIONBAR7BUTTON1")
SetBinding("","MULTIACTIONBAR7BUTTON1")
SetBinding("","MULTIACTIONBAR7BUTTON2")
SetBinding("","MULTIACTIONBAR7BUTTON2")
SetBinding("","MULTIACTIONBAR7BUTTON3")
SetBinding("","MULTIACTIONBAR7BUTTON3")
SetBinding("","MULTIACTIONBAR7BUTTON4")
SetBinding("","MULTIACTIONBAR7BUTTON4")
SetBinding("","MULTIACTIONBAR7BUTTON5")
SetBinding("","MULTIACTIONBAR7BUTTON5")
SetBinding("","MULTIACTIONBAR7BUTTON6")
SetBinding("","MULTIACTIONBAR7BUTTON6")
SetBinding("","MULTIACTIONBAR7BUTTON7")
SetBinding("","MULTIACTIONBAR7BUTTON7")
SetBinding("","MULTIACTIONBAR7BUTTON8")
SetBinding("","MULTIACTIONBAR7BUTTON8")
SetBinding("","MULTIACTIONBAR7BUTTON9")
SetBinding("","MULTIACTIONBAR7BUTTON9")
SetBinding("","MULTIACTIONBAR7BUTTON10")
SetBinding("","MULTIACTIONBAR7BUTTON10")
SetBinding("","MULTIACTIONBAR7BUTTON11")
SetBinding("","MULTIACTIONBAR7BUTTON11")
SetBinding("","MULTIACTIONBAR7BUTTON12")
SetBinding("","MULTIACTIONBAR7BUTTON12")
SetBinding("","TARGETNEARESTENEMY")
SetBinding("TAB","TARGETNEARESTENEMY")
SetBinding("","TARGETPREVIOUSENEMY")
SetBinding("SHIFT-TAB","TARGETPREVIOUSENEMY")
SetBinding("","TARGETSCANENEMY")
SetBinding("","TARGETSCANENEMY")
SetBinding("","TARGETNEARESTFRIEND")
SetBinding("CTRL-TAB","TARGETNEARESTFRIEND")
SetBinding("","TARGETPREVIOUSFRIEND")
SetBinding("CTRL-SHIFT-TAB","TARGETPREVIOUSFRIEND")
SetBinding("","TARGETNEARESTENEMYPLAYER")
SetBinding("","TARGETNEARESTENEMYPLAYER")
SetBinding("","TARGETPREVIOUSENEMYPLAYER")
SetBinding("","TARGETPREVIOUSENEMYPLAYER")
SetBinding("","TARGETNEARESTFRIENDPLAYER")
SetBinding("","TARGETNEARESTFRIENDPLAYER")
SetBinding("","TARGETPREVIOUSFRIENDPLAYER")
SetBinding("","TARGETPREVIOUSFRIENDPLAYER")
SetBinding("","TARGETSELF")
SetBinding("F1","TARGETSELF")
SetBinding("","TARGETPARTYMEMBER1")
SetBinding("F2","TARGETPARTYMEMBER1")
SetBinding("","TARGETPARTYMEMBER2")
SetBinding("F3","TARGETPARTYMEMBER2")
SetBinding("","TARGETPARTYMEMBER3")
SetBinding("F4","TARGETPARTYMEMBER3")
SetBinding("","TARGETPARTYMEMBER4")
SetBinding("F5","TARGETPARTYMEMBER4")
SetBinding("","TARGETPET")
SetBinding("SHIFT-F1","TARGETPET")
SetBinding("","TARGETPARTYPET1")
SetBinding("SHIFT-F2","TARGETPARTYPET1")
SetBinding("","TARGETPARTYPET2")
SetBinding("SHIFT-F3","TARGETPARTYPET2")
SetBinding("","TARGETPARTYPET3")
SetBinding("SHIFT-F4","TARGETPARTYPET3")
SetBinding("","TARGETPARTYPET4")
SetBinding("SHIFT-F5","TARGETPARTYPET4")
SetBinding("","TARGETLASTHOSTILE")
SetBinding("","TARGETLASTHOSTILE")
SetBinding("","TARGETLASTTARGET")
SetBinding("","TARGETLASTTARGET")
SetBinding("","TARGETARENA1")
SetBinding("","TARGETARENA1")
SetBinding("","TARGETARENA2")
SetBinding("","TARGETARENA2")
SetBinding("","TARGETARENA3")
SetBinding("","TARGETARENA3")
SetBinding("","TARGETARENA4")
SetBinding("","TARGETARENA4")
SetBinding("","TARGETARENA5")
SetBinding("","TARGETARENA5")
SetBinding("","FOCUSARENA1")
SetBinding("","FOCUSARENA1")
SetBinding("","FOCUSARENA2")
SetBinding("","FOCUSARENA2")
SetBinding("","FOCUSARENA3")
SetBinding("","FOCUSARENA3")
SetBinding("","FOCUSARENA4")
SetBinding("","FOCUSARENA4")
SetBinding("","FOCUSARENA5")
SetBinding("","FOCUSARENA5")
SetBinding("","NAMEPLATES")
SetBinding("V","NAMEPLATES")
SetBinding("","FRIENDNAMEPLATES")
SetBinding("SHIFT-V","FRIENDNAMEPLATES")
SetBinding("","ALLNAMEPLATES")
SetBinding("CTRL-V","ALLNAMEPLATES")
SetBinding("","INTERACTMOUSEOVER")
SetBinding("","INTERACTMOUSEOVER")
SetBinding("","INTERACTTARGET")
SetBinding("F","INTERACTTARGET")
SetBinding("","ASSISTTARGET")
SetBinding("","ASSISTTARGET")
SetBinding("","ATTACKTARGET")
SetBinding("","ATTACKTARGET")
SetBinding("","STARTATTACK")
SetBinding("","STARTATTACK")
SetBinding("","PETATTACK")
SetBinding("SHIFT-T","PETATTACK")
SetBinding("","FOCUSTARGET")
SetBinding("","FOCUSTARGET")
SetBinding("","TARGETFOCUS")
SetBinding("","TARGETFOCUS")
SetBinding("","TARGETMOUSEOVER")
SetBinding("","TARGETMOUSEOVER")
SetBinding("","TARGETTALKER")
SetBinding("","TARGETTALKER")
SetBinding("","TOGGLEGAMEMENU")
SetBinding("ESCAPE","TOGGLEGAMEMENU")
SetBinding("F12","TOGGLEBACKPACK")
SetBinding("SHIFT-B","TOGGLEBACKPACK")
SetBinding("","TOGGLEREAGENTBAG1")
SetBinding("","TOGGLEREAGENTBAG1")
SetBinding("","TOGGLEBAG1")
SetBinding("F8","TOGGLEBAG1")
SetBinding("","TOGGLEBAG2")
SetBinding("F9","TOGGLEBAG2")
SetBinding("","TOGGLEBAG3")
SetBinding("F10","TOGGLEBAG3")
SetBinding("","TOGGLEBAG4")
SetBinding("F11","TOGGLEBAG4")
SetBinding("","OPENALLBAGS")
SetBinding("B","OPENALLBAGS")
SetBinding("","HEADER_BLANK8")
SetBinding("","HEADER_BLANK8")
SetBinding("","TOGGLECHARACTER0")
SetBinding("C","TOGGLECHARACTER0")
SetBinding("","TOGGLECHARACTER2")
SetBinding("U","TOGGLECHARACTER2")
SetBinding("","TOGGLECURRENCY")
SetBinding("","TOGGLECURRENCY")
SetBinding("","HEADER_BLANK7")
SetBinding("","HEADER_BLANK7")
SetBinding("","TOGGLESPELLBOOK")
SetBinding("P","TOGGLESPELLBOOK")
SetBinding("","TOGGLEPROFESSIONBOOK")
SetBinding("K","TOGGLEPROFESSIONBOOK")
SetBinding("","TOGGLEPETBOOK")
SetBinding("SHIFT-I","TOGGLEPETBOOK")
SetBinding("","TOGGLETALENTS")
SetBinding("N","TOGGLETALENTS")
SetBinding("","HEADER_BLANK10")
SetBinding("","HEADER_BLANK10")
SetBinding("","TOGGLEACHIEVEMENT")
SetBinding("Y","TOGGLEACHIEVEMENT")
SetBinding("","TOGGLESTATISTICS")
SetBinding("SHIFT-Y","TOGGLESTATISTICS")
SetBinding("","HEADER_BLANK11")
SetBinding("","HEADER_BLANK11")
SetBinding("","TOGGLEQUESTLOG")
SetBinding("L","TOGGLEQUESTLOG")
SetBinding("","TOGGLEWORLDMAP")
SetBinding("M","TOGGLEWORLDMAP")
SetBinding("","TOGGLEWORLDMAPSIZE")
SetBinding("","TOGGLEWORLDMAPSIZE")
SetBinding("","TOGGLEMINIMAP")
SetBinding("","TOGGLEMINIMAP")
SetBinding("","TOGGLEBATTLEFIELDMINIMAP")
SetBinding("SHIFT-M","TOGGLEBATTLEFIELDMINIMAP")
SetBinding("","TOGGLEWORLDSTATESCORES")
SetBinding("SHIFT-SPACE","TOGGLEWORLDSTATESCORES")
SetBinding("","HEADER_BLANK12")
SetBinding("","HEADER_BLANK12")
SetBinding("","TOGGLEGUILDTAB")
SetBinding("J","TOGGLEGUILDTAB")
SetBinding("","TOGGLESOCIAL")
SetBinding("O","TOGGLESOCIAL")
SetBinding("","TOGGLEFRIENDSTAB")
SetBinding("","TOGGLEFRIENDSTAB")
SetBinding("","TOGGLEQUICKJOINTAB")
SetBinding("","TOGGLEQUICKJOINTAB")
SetBinding("","TOGGLEWHOTAB")
SetBinding("","TOGGLEWHOTAB")
SetBinding("","TOGGLECHATTAB")
SetBinding("T","TOGGLECHATTAB")
SetBinding("","TOGGLERAIDTAB")
SetBinding("","TOGGLERAIDTAB")
SetBinding("","TOGGLETEXTTOSPEECH")
SetBinding("","TOGGLETEXTTOSPEECH")
SetBinding("","HEADER_BLANK13")
SetBinding("","HEADER_BLANK13")
SetBinding("","TOGGLEGROUPFINDER")
SetBinding("I","TOGGLEGROUPFINDER")
SetBinding("","TOGGLEDUNGEONSANDRAIDS")
SetBinding("CTRL-I","TOGGLEDUNGEONSANDRAIDS")
SetBinding("","TOGGLECHARACTER4")
SetBinding("H","TOGGLECHARACTER4")
SetBinding("","HEADER_BLANK14")
SetBinding("","HEADER_BLANK14")
SetBinding("","TOGGLECOLLECTIONS")
SetBinding("SHIFT-P","TOGGLECOLLECTIONS")
SetBinding("","TOGGLECOLLECTIONSMOUNTJOURNAL")
SetBinding("","TOGGLECOLLECTIONSMOUNTJOURNAL")
SetBinding("","TOGGLECOLLECTIONSPETJOURNAL")
SetBinding("","TOGGLECOLLECTIONSPETJOURNAL")
SetBinding("","TOGGLECOLLECTIONSTOYBOX")
SetBinding("","TOGGLECOLLECTIONSTOYBOX")
SetBinding("","TOGGLECOLLECTIONSHEIRLOOM")
SetBinding("","TOGGLECOLLECTIONSHEIRLOOM")
SetBinding("","TOGGLECOLLECTIONSWARDROBE")
SetBinding("","TOGGLECOLLECTIONSWARDROBE")
SetBinding("","HEADER_BLANK15")
SetBinding("","HEADER_BLANK15")
SetBinding("","TOGGLEENCOUNTERJOURNAL")
SetBinding("SHIFT-J","TOGGLEENCOUNTERJOURNAL")
SetBinding("","TOGGLEGARRISONLANDINGPAGE")
SetBinding("","TOGGLEGARRISONLANDINGPAGE")
SetBinding("","STOPCASTING")
SetBinding("","STOPCASTING")
SetBinding("","STOPATTACK")
SetBinding("","STOPATTACK")
SetBinding("","DISMOUNT")
SetBinding("","DISMOUNT")
SetBinding("","MINIMAPZOOMIN")
SetBinding("NUMPADPLUS","MINIMAPZOOMIN")
SetBinding("","MINIMAPZOOMOUT")
SetBinding("NUMPADMINUS","MINIMAPZOOMOUT")
SetBinding("","TOGGLEMUSIC")
SetBinding("CTRL-M","TOGGLEMUSIC")
SetBinding("","TOGGLESOUND")
SetBinding("CTRL-S","TOGGLESOUND")
SetBinding("","MASTERVOLUMEUP")
SetBinding("CTRL-=","MASTERVOLUMEUP")
SetBinding("","MASTERVOLUMEDOWN")
SetBinding("CTRL--","MASTERVOLUMEDOWN")
SetBinding("","TOGGLEUI")
SetBinding("ALT-Z","TOGGLEUI")
SetBinding("","TOGGLEFPS")
SetBinding("CTRL-R","TOGGLEFPS")
SetBinding("","SCREENSHOT")
SetBinding("PRINTSCREEN","SCREENSHOT")
SetBinding("","ITEMCOMPARISONCYCLING")
SetBinding("SHIFT-C","ITEMCOMPARISONCYCLING")
SetBinding("","TOGGLEGRAPHICSSETTINGS")
SetBinding("","TOGGLEGRAPHICSSETTINGS")
SetBinding("","TOGGLESELFHIGHLIGHT")
SetBinding("","TOGGLESELFHIGHLIGHT")
SetBinding("","TOGGLEWINDOWED")
SetBinding("","TOGGLEWINDOWED")
SetBinding("","NEXTVIEW")
SetBinding("END","NEXTVIEW")
SetBinding("","PREVVIEW")
SetBinding("HOME","PREVVIEW")
SetBinding("","CAMERAZOOMIN")
SetBinding("MOUSEWHEELUP","CAMERAZOOMIN")
SetBinding("","CAMERAZOOMOUT")
SetBinding("MOUSEWHEELDOWN","CAMERAZOOMOUT")
SetBinding("","SETVIEW1")
SetBinding("","SETVIEW1")
SetBinding("","SETVIEW2")
SetBinding("","SETVIEW2")
SetBinding("","SETVIEW3")
SetBinding("","SETVIEW3")
SetBinding("","SETVIEW4")
SetBinding("","SETVIEW4")
SetBinding("","SETVIEW5")
SetBinding("","SETVIEW5")
SetBinding("","SAVEVIEW1")
SetBinding("","SAVEVIEW1")
SetBinding("","SAVEVIEW2")
SetBinding("","SAVEVIEW2")
SetBinding("","SAVEVIEW3")
SetBinding("","SAVEVIEW3")
SetBinding("","SAVEVIEW4")
SetBinding("","SAVEVIEW4")
SetBinding("","SAVEVIEW5")
SetBinding("","SAVEVIEW5")
SetBinding("","RESETVIEW1")
SetBinding("","RESETVIEW1")
SetBinding("","RESETVIEW2")
SetBinding("","RESETVIEW2")
SetBinding("","RESETVIEW3")
SetBinding("","RESETVIEW3")
SetBinding("","RESETVIEW4")
SetBinding("","RESETVIEW4")
SetBinding("","RESETVIEW5")
SetBinding("","RESETVIEW5")
SetBinding("","FLIPCAMERAYAW")
SetBinding("","FLIPCAMERAYAW")
SetBinding("","CENTERCAMERA")
SetBinding("","CENTERCAMERA")
SetBinding("","RAIDTARGET8")
SetBinding("","RAIDTARGET8")
SetBinding("","RAIDTARGET7")
SetBinding("","RAIDTARGET7")
SetBinding("","RAIDTARGET6")
SetBinding("","RAIDTARGET6")
SetBinding("","RAIDTARGET5")
SetBinding("","RAIDTARGET5")
SetBinding("","RAIDTARGET4")
SetBinding("","RAIDTARGET4")
SetBinding("","RAIDTARGET3")
SetBinding("","RAIDTARGET3")
SetBinding("","RAIDTARGET2")
SetBinding("","RAIDTARGET2")
SetBinding("","RAIDTARGET1")
SetBinding("","RAIDTARGET1")
SetBinding("","RAIDTARGETNONE")
SetBinding("","RAIDTARGETNONE")
SetBinding("","VEHICLEEXIT")
SetBinding("NUMPAD5","VEHICLEEXIT")
SetBinding("","VEHICLEPREVSEAT")
SetBinding("NUMPAD1","VEHICLEPREVSEAT")
SetBinding("","VEHICLENEXTSEAT")
SetBinding("NUMPAD3","VEHICLENEXTSEAT")
SetBinding("","VEHICLEAIMUP")
SetBinding("","VEHICLEAIMUP")
SetBinding("","VEHICLEAIMDOWN")
SetBinding("","VEHICLEAIMDOWN")
SetBinding("","VEHICLEAIMINCREMENT")
SetBinding("CTRL-MOUSEWHEELUP","VEHICLEAIMINCREMENT")
SetBinding("","VEHICLEAIMDECREMENT")
SetBinding("CTRL-MOUSEWHEELDOWN","VEHICLEAIMDECREMENT")
SetBinding("","TOGGLEPINGLISTENER")
SetBinding("G","TOGGLEPINGLISTENER")
SetBinding("","PINGATTACK")
SetBinding("","PINGATTACK")
SetBinding("","PINGWARNING")
SetBinding("","PINGWARNING")
SetBinding("","PINGONMYWAY")
SetBinding("","PINGONMYWAY")
SetBinding("","PINGASSIST")
SetBinding("","PINGASSIST")
-- MY SETUP



SetBinding("Z","MOVEFORWARD")
SetBinding("S","MOVEBACKWARD")
SetBinding("A","TURNLEFT")
SetBinding("E","TURNRIGHT")
SetBinding("Q","STRAFELEFT")
SetBinding("D","STRAFERIGHT")



    -- bindingSetup.INTERACTTARGET="F"
    -- bindingSetup.MOVEFORWARD= "Z"
    -- bindingSetup.MOVEBACKWARD= "S"
    -- bindingSetup.STRAFELEFT= "Q"
    -- bindingSetup.STRAFERIGHT= "D"
    -- bindingSetup.TURNLEFT= "A"
    -- bindingSetup.TURNRIGHT= "E"
    -- bindingSetup.JUMP= "SPACE"

    -- --bindingSetup.TOGGLEAUTORUN= "BUTTON3"
    -- bindingSetup.FOLLOWTARGET= "w"
    -- bindingSetup.TOGGLEBACKPACK= "E"


-- --A, B, C, ..., Z
-- --1, 2, 3, ..., 9, 0
-- --F1, F2, F3, ..., F12
-- --ESC, TAB, SPACE, ENTER, BACKSPACE, INSERT, HOME, PAGEUP, PAGEDOWN, END, DELETE
-- --UP, DOWN, LEFT, RIGHT
-- --ALT, CTRL, SHIFT
-- --BUTTON1, BUTTON2, ..., BUTTON5 (Mouse buttons)
-- --MOUSEWHEELUP, MOUSEWHEELDOWN
-- --MOUSEOVER
-- --NUMPAD1, NUMPAD2, ..., NUMPAD9, NUMPAD0
-- --NUMPADDIVIDE (/), NUMPADMULTIPLY (*), NUMPADSUBTRACT (-), NUMPADADD (+), NUMPADDECIMAL (.)
-- --NUMPADENTER
-- --LALT, LCTRL, LSHIFT, RALT, RCTRL, RSHIFT (Modifiers)

-- --bindingSetup["MACRO 1"]="i"     
-- --bindingSetup["MACRO 2"]="o"     
-- --bindingSetup["MACRO 3"]=""     
-- --bindingSetup["MACRO 4"]=""     
-- --bindingSetup["MACRO 5"]=""     
-- --bindingSetup["MACRO 6"]=""     
-- --bindingSetup["MACRO 7"]=""     
-- --bindingSetup["MACRO 8"]=""     
-- --bindingSetup["MACRO 9"]=""
-- --bindingSetup["MACRO 10"]=""     
-- --bindingSetup["MACRO 11"]=""     
-- --bindingSetup["MACRO 12"]=""     
-- --bindingSetup["MACRO 13"]=""     
-- --bindingSetup["MACRO 14"]=""     
-- --bindingSetup["MACRO 15"]=""     
-- --bindingSetup["MACRO 16"]=""     
-- --bindingSetup["MACRO 17"]=""     
-- --bindingSetup["MACRO 18"]=""     
-- --bindingSetup["MACRO 19"]=""

-- bindingSetup.ACTIONBUTTON1="1"
-- bindingSetup.ACTIONBUTTON2="2"
-- bindingSetup.ACTIONBUTTON3="3"
-- bindingSetup.ACTIONBUTTON4="4"
-- bindingSetup.ACTIONBUTTON5="5"
-- bindingSetup.ACTIONBUTTON6="6"
-- bindingSetup.ACTIONBUTTON7="7"
-- bindingSetup.ACTIONBUTTON8="8"
-- bindingSetup.ACTIONBUTTON9="9"
-- bindingSetup.ACTIONBUTTON10="10"
-- bindingSetup.ACTIONBUTTON11="11"
-- bindingSetup.ACTIONBUTTON12="12"

-- bindingSetup.ACTIONBAR1BUTTON1="NUMPAD1"
-- bindingSetup.ACTIONBAR1BUTTON2="NUMPAD2"
-- bindingSetup.ACTIONBAR1BUTTON3="NUMPAD3"
-- bindingSetup.ACTIONBAR1BUTTON4="NUMPAD4"
-- bindingSetup.ACTIONBAR1BUTTON5="NUMPAD5"
-- bindingSetup.ACTIONBAR1BUTTON6="NUMPAD6"
-- bindingSetup.ACTIONBAR1BUTTON7="NUMPAD7"
-- bindingSetup.ACTIONBAR1BUTTON8="NUMPAD8"
-- bindingSetup.ACTIONBAR1BUTTON9="NUMPAD9"
-- bindingSetup.ACTIONBAR1BUTTON10="NUMPAD10"
-- bindingSetup.ACTIONBAR1BUTTON11="NUMPAD11"
-- bindingSetup.ACTIONBAR1BUTTON12="NUMPAD12"

-- bindingSetup.ACTIONBAR2BUTTON1="F1"
-- bindingSetup.ACTIONBAR2BUTTON2="F2"
-- bindingSetup.ACTIONBAR2BUTTON3="F3"
-- bindingSetup.ACTIONBAR2BUTTON4="F4"
-- bindingSetup.ACTIONBAR2BUTTON5="F5"
-- bindingSetup.ACTIONBAR2BUTTON6="F6"
-- bindingSetup.ACTIONBAR2BUTTON7="F7"
-- bindingSetup.ACTIONBAR2BUTTON8="F8"
-- bindingSetup.ACTIONBAR2BUTTON9="F9"
-- bindingSetup.ACTIONBAR2BUTTON10="F10"
-- bindingSetup.ACTIONBAR2BUTTON11="F11"
-- bindingSetup.ACTIONBAR2BUTTON12="F12"

-- --bindingSetup.TOGGLESIT              =""      
-- bindingSetup.TARGETNEARESTENEMY  ="Tab"
-- bindingSetup.TARGETPREVIOUSENEMY ="i"
-- bindingSetup.TARGETSCANENEMY     ="o"
-- bindingSetup.TARGETNEARESTFRIEND ="u"
-- bindingSetup.TARGETSELF  ="m"
--bindingSetup.RAIDTARGET1 =""
--bindingSetup.RAIDTARGET2 =""
--bindingSetup.RAIDTARGET3 =""
--bindingSetup.RAIDTARGET4 =""
--bindingSetup.RAIDTARGET5 =""
--bindingSetup.RAIDTARGET6 =""
--bindingSetup.RAIDTARGET7 =""
--bindingSetup.RAIDTARGET8 =""
--bindingSetup.RAIDTARGETNONE =""
--bindingSetup.RAIDTARGET9  =""
--bindingSetup.RAIDTARGET10 =""
--bindingSetup.RAIDTARGET11 =""
--bindingSetup.RAIDTARGET12 =""
--bindingSetup.RAIDTARGET13 =""
--bindingSetup.Dismount =""
--bindingSetup.STOPCASTING =""
--bindingSetup.STOPATTACK =""
--bindingSetup.TARGETPARTYMEMBER1=""
--bindingSetup.TARGETPARTYMEMBER2=""
--bindingSetup.TARGETPARTYMEMBER3=""
--bindingSetup.TARGETPARTYMEMBER4=""
--bindingSetup.ACTIONPAGE1=""
--bindingSetup.ACTIONPAGE2=""
--bindingSetup.ACTIONPAGE3=""
--bindingSetup.ACTIONPAGE4=""
--bindingSetup.ACTIONPAGE5=""
--bindingSetup.ACTIONPAGE6=""
--bindingSetup.PET_ACTIONBUTTON1=""
--bindingSetup.PET_ACTIONBUTTON2=""
--bindingSetup.PET_ACTIONBUTTON3=""
--bindingSetup.PET_ACTIONBUTTON4=""
--bindingSetup.PET_ACTIONBUTTON5=""
--bindingSetup.PET_ACTIONBUTTON6=""
--bindingSetup.PET_ACTIONBUTTON7=""
--bindingSetup.PET_ACTIONBUTTON8=""
--bindingSetup.PET_ACTIONBUTTON9=""
--bindingSetup.PET_ACTIONBUTTON10=""
--bindingSetup.TARGETLASTHOSTILE="G"
--bindingSetup.TARGETLASTTARGET="H"
--bindingSetup.FOCUS="J"


    print("T")
    SetOptionVARCFromDico(dicoSetup)
    print("I")
    --SetBindingFromDico(bindingSetup)
    print("Quick Test")
    SaveBindings(GetCurrentBindingSet())
    
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


function failable_set(value, key)

    SetBinding(value, key)
    print("Set "..value.." "..key)
    SaveBindings(GetCurrentBindingSet())
end

function SetBindingFromDico(dicoSetup)
   
    
    -- local currentBindingSet = GetCurrentBindingSet()
    -- -- Iterate through all possible actions
    -- for i = 1, 1000 do
    --     local actionName = GetBinding(i)

    --     if actionName then
    --         local key1, key2 = GetBindingKey(actionName)
    --        --print("have:"..actionName .. ":", key1 or "")
    --         --print("have:"..actionName .. ":", key1 or "", key2 or "")
            
    --         local value = dicoSetup[actionName]
    --         if value ~= nil and value ~= "" and value ~= " " then 
                
    --             SetBinding(value,actionName,currentBindingSet)
                
    --             print("Reset:"..actionName .. ":", value or "")
    --             SaveBindings(currentBindingSet)
    --         else 

    --             if key1 ~= nil then 
                    
    --                 SetBinding(key1,actionName,currentBindingSet)
    --                -- SetBinding(key1,actionName,currentBindingSet)
    --                 print("Current:"..actionName .. ":", key1 or "")
    --                 SaveBindings(currentBindingSet)
    --             end
    --             if key2 ~= nil then 
                    
    --                 SetBinding(key2,actionName,currentBindingSet)
    --                -- SetBinding(key1,actionName,currentBindingSet)
    --                 print("Current:"..actionName .. ":", key2 or "")
    --                 SaveBindings(currentBindingSet)
    --             end
    --         end     
    --     else
    --         break  -- Break the loop when no more actions are found
    --     end
    -- end

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
        local success, error_message =  pcall(failable_set, value, key )
            if not success then
                print("Error:".. error_message) 
                print("Fail:".. key.."-".. value) 
            end
        end      
    end
    
end

print("QStart")
QuickTestRef.start();
print("QEnd")

ReloadUI()