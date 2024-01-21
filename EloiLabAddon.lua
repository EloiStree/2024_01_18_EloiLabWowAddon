
-- WANT TO CUSTOM YOUR OWN ?
-- TRY ON WEAK AURA THEN OVERWRITE "GetMetaInfo"
-- REPLACE THIS FUNCTION TO ADD YOUR OWN CODE FOR YOUR TOOL.







---------------------------------------------
---------------------------------------------
-------DONT TOUCH WITHOUT KNOWING------------
-------------------------------------------------------------------------
--##########################################################""--



--||||||||      ALLOW TO ENABLE PRINTING      |||||||||
local PrintUtility = {}
PrintUtility.use=false

PrintUtility.Print = function (self, message)
    if(PrintUtility.use==true)then
        print(message)
    end
end

PrintUtility.ForcePrint = function (self, message)
    
        print(message)
    
end







--||||||||      SOME STORAGE     |||||||||



local Ints={}
Ints.framecount = 0

local Bools={}
--PUBLIC
Bools.isDebugKeyDown=false
Bools.isDebugKeyDownToggleMenu=false
Bools.toggle_OnEventDebugLog =false
Bools.addonLoaded=false


--PRIVATE
Bools.previousWindowOpenRequest=false
Bools.currentWindowOpenRequest=false
Bools.firstUpdate= true;

local Strings ={}
Strings.DevName="Eloi Stree"
Strings.DebugKeyName="W"






--||||||||      SAVED MEMORY VAR ACCESS      |||||||||
MEMO= {}

MEMO.IS_ADDONLOADED= function() return Bools.addonLoaded end
MEMO.SET_WINDOWOPEN=function (value)  MEMO_PLAYERNOTE=value end
MEMO.SET_METAINFOTEXT=function (value) MEMO_METAINFOTEXT=value end
MEMO.SET_PLAYERNOTE=function (value) MEMO_PLAYERNOTE=value end
MEMO.SET_USEDEBUGAUTORUNTAG=function (value)  MEMO_DEBUGAUTORUNTAG=value end
MEMO.SET_MEMO_CLIPBOARD =function (value)  MEMO_CLIPBOARD=value end
MEMO.GET_WINDOWOPEN=function () return MEMO_PLAYERNOTE end
MEMO.GET_METAINFOTEXT=function () return  MEMO_METAINFOTEXT end
MEMO.GET_PLAYERNOTE=function () return MEMO_PLAYERNOTE end
MEMO.GET_USEDEBUGAUTORUNTAG=function () return MEMO_DEBUGAUTORUNTAG end
MEMO.GET_MEMO_CLIPBOARD =function () return MEMO_CLIPBOARD end


MEMO.AppendStartClipboard= function (text)    
    MEMO_CLIPBOARD = text..MEMO_CLIPBOARD
end

MEMO.AppendEndClipboard= function (text)
    MEMO_CLIPBOARD = MEMO_CLIPBOARD..text
end

MEMO.SetClipboard= function (text)
    MEMO_CLIPBOARD =text 
end

MEMO.ClearClipboard= function ()
    MEMO_CLIPBOARD =""
end


MEMO.SetTagMode =function (modeId) 
    if modeId == "Tag" or modeId==0 then
        MEMO_TAGMODE =0
    end  
    if modeId == "Type" or modeId==1  then
        MEMO_TAGMODE =1
    end   
    if modeId == "Index" or modeId==2 then
        MEMO_TAGMODE =2
    end 
      if modeId == "Value" or modeId==3 then
        MEMO_TAGMODE =3
    end
end
MEMO.IsTagMode =function (modeId) 
    if(modeId==nil or MEMO_TAGMODE==next) then return false end
    if modeId == "Tag" or modeId==0  then
        return MEMO_TAGMODE ==0
    end  
    if modeId == "Type" or modeId==1 then
        return MEMO_TAGMODE ==1
    end   
    if modeId == "Value" or modeId==2  then
        return MEMO_TAGMODE ==2
    end
    if modeId == "Value" or modeId==3 then
        return MEMO_TAGMODE ==3
    end
    return false
end


MEMO.PrintALL=function () 
    print ("## CHECK SAVED MEMORY ##")
    print("- Is loaded ? "..(MEMO.IsTrueAsString( MEMO.IS_ADDONLOADED()) ))
    print("  - Keep Window open ? "..(MEMO.IsTrueAsString( MEMO.GET_WINDOWOPEN())))
    print("  - Player note: "..(MEMO.ProtectEmpty (MEMO.GET_PLAYERNOTE())))
    print("  - Meta text: "..(MEMO.ProtectEmpty (MEMO.GET_METAINFOTEXT())))
end

MEMO.IsTrue = function (value) 
    if(value==nil) then return false end
    if(value==true) then return true end
    if(value==false) then return false end
    return value==true 
end
MEMO.IsTrueAsString = function (value) 
    if(value==nil) then return "false" end
    if(value==true) then return "true" end
    if(value==false) then return "false" end
    return value=="true" 
end

MEMO.ProtectEmpty = function (value) 
    if(value==nil) then return "" end
    if(value==false) then return "false" end
    if(value==true) then return "true" end
    return value 
end













--||||||||     CREATE A STATIC MEMORY ADDRESS       |||||||||

StaticAddress = {}
StaticAddress.metaData = ""
StaticAddress.GetStaticText = function ()
    return StaticAddress.metaData
end

StaticAddress.SetStaticText =function (text)
    StaticAddress.statictext = text or ""
end

StaticAddress.SetStaticTextHook =function (text)
    StaticAddress.statictext = text or ""
end



--||||||||      SET THE TEXT IN TWO STATIC POSSIBLE ADDRESS SAVED AND STATIC      |||||||||

MainPurpose = {}
-- STORE THE INFO IN RAM BUT WITH AND ID TO FIND IT.
MainPurpose.JustText= "J'aime les frites au savon."
MainPurpose.metaDatahook = ""
MainPurpose.SetTextInStaticMemory = function (text)
    MainPurpose.metaDatahook= "Static__"..text;
    StaticAddress.SetStaticText(text);
    MEMO.SET_METAINFOTEXT("SavedVar__"..text);    
end


--#######################




--||||||| CLIP BOARD FRAME@@@@@@@@@@@@@@@@@@@@
ClipboardFunction={}

 -- Create the frame
 clipFrame = CreateFrame("Frame", "ClipFrame", UIParent)

 clipFrame:SetMovable(true)
 clipFrame:EnableMouse(true)
 clipFrame:RegisterForDrag("LeftButton")
 clipFrame:SetScript("OnDragStart", clipFrame.StartMoving)
 clipFrame:SetScript("OnDragStop", clipFrame.StopMovingOrSizing)

    

 -- Add an EditBox to the frame for text input
 clipFrame.editBox = CreateFrame("EditBox", nil, clipFrame)
 clipFrame.editBox:SetAllPoints(true)
 clipFrame.editBox:SetMultiLine(true)
 clipFrame.editBox:SetAutoFocus(false)
 clipFrame.editBox:SetFontObject(ChatFontNormal)
 clipFrame.editBox:SetScript("OnEscapePressed", function() clipFrame:Hide() end)

-- Function to set text in the EditBox
clipFrame.SetText = function(self, text)
    self.editBox:SetText(text)
end

clipFrame.GetText = function(self)
    return self.editBox:GetText()
end

-- Function to show the movable frame
function ClipboardFunction:ShowMovableFrame()
    if not clipFrame then
        ClipboardFunction:CreateMovableFrame()
    end
    clipFrame:Show()
end

-- Method to set text in the movable frame
function ClipboardFunction:SetText(text)
    if clipFrame then
        clipFrame:SetText(text)
    end
end
-- Method to set text in the movable frame
function ClipboardFunction:AppentTextEnd(text)
    if clipFrame then
        clipFrame:SetText(clipFrame:GetText().. text)
    end
end
-- Method to set text in the movable frame
function ClipboardFunction:AppentTextStart(text)
    if clipFrame then
        clipFrame:SetText(text ..clipFrame:GetText())
    end
end





--||||||||     CREATE THE FRAME       |||||||||

-- Create the DebugMemoryTextFrame frame
local DebugMemoryTextFrame = CreateFrame("Frame", "DebugMemoryTextFrame", UIParent)

-- Create a scroll frame to support scrolling for long texts
local ScrollFrame = CreateFrame("ScrollFrame", "DebugMemoryTextScrollFrame", DebugMemoryTextFrame, "UIPanelScrollFrameTemplate")





-- Create an edit box to display the text
local EditBox = CreateFrame("EditBox", "DebugMemoryTextEditBox", ScrollFrame)
EditBox:SetMultiLine(true)
EditBox:SetAutoFocus(false)
EditBox:SetFontObject(ChatFontNormal)
EditBox:SetScript("OnEscapePressed", function() DebugMemoryTextFrame:Hide() end)

-- Set the scroll frame content
ScrollFrame:SetScrollChild(EditBox)



function DebugMemoryTextFrame:ShowFrame()
    self:Show()
end

function DebugMemoryTextFrame:HideFrame()
    self:Hide()
end

function DebugMemoryTextFrame:SetTextContent(text)
    EditBox:SetText(text)
end

function DebugMemoryTextFrame:ShowFrameOnOff(value)
    if(value==true) then
        DebugMemoryTextFrame:ShowFrame()        
    else
        DebugMemoryTextFrame:HideFrame()
    end

end


--||||||||    REGISTER TO EVENT IN WOW   IN AN OTHER INVISIBLE FRAME   |||||||||

local frame = CreateFrame("FRAME"); -- Need a frame to respond to events
frame:RegisterEvent("ADDON_LOADED"); -- Fired when saved variables are loaded
frame:RegisterEvent("PLAYER_LOGOUT"); -- Fired when about to log out
frame:RegisterEvent('PLAYER_LOGIN')
frame:RegisterEvent('MODIFIER_STATE_CHANGED')
frame:RegisterEvent('CINEMATIC_START')
frame:RegisterEvent('CINEMATIC_STOP')



function UpdateFramesPosition()

    

    DebugMemoryTextFrame:SetSize(UIParent:GetWidth() * 0.2, UIParent:GetHeight())
    DebugMemoryTextFrame:SetPoint("LEFT", 0, 0)
    ScrollFrame:SetPoint("TOPLEFT", DebugMemoryTextFrame, "TOPLEFT", 0, 0)
    ScrollFrame:SetPoint("BOTTOMRIGHT", DebugMemoryTextFrame, "BOTTOMRIGHT", 0, 0)
    EditBox:SetWidth(ScrollFrame:GetWidth() - 20)
    EditBox:SetHeight(ScrollFrame:GetHeight()) 
    clipFrame:SetSize(UIParent:GetWidth() * 0.20, UIParent:GetHeight()*0.05)
    clipFrame:SetPoint("TOPLEFT", UIParent:GetWidth() * 0.22, 0)

end



function frame:OnEvent(event, arg1)
    UpdateFramesPosition()
    if Bools.toggle_OnEventDebugLog then
        print("Event:".. (event or ""))
        print("Arg1:".. (arg1 or ""))
    end



    --||||||||     WHEN PLAYER RELOAD      |||||||||
    if event == "ADDON_LOADED" and arg1 == "EloiLab" then
        print("> Eloi Lab info: /elhelp ")
        print("> How to use ? /elrtfm")
        print("> This tool is for educational purpose")
        print("> Use it is against TOS")
        print("> YOU ARE GOING TO BE BAN FOR USING IT: DON'T.")
        print("= But if you do, Have fun learning :)-")
            
        

        
        Bools.addonLoaded=true
        --MEMO.PrintALL()

        local textInMemory = MEMO.GET_METAINFOTEXT()
        textInMemory = textInMemory or ""
        MainPurpose.SetTextInStaticMemory(textInMemory)
        
        clipFrame:SetText(MEMO.GET_MEMO_CLIPBOARD())
        

    elseif event == "PLAYER_LOGOUT" then
        MainPurpose.SetTextInStaticMemory( StaticAddress.GetStaticText())
        ExitFunction.ResetVar()
        MEMO.SET_MEMO_CLIPBOARD(clipFrame:GetText());
    elseif event == "PLAYER_LOGIN" then
    end
end




ExitFunction={}
ExitFunction.ResetVar=function ()
    Bools.previousWindowOpenRequest=false
    Bools.currentWindowOpenRequest=false
    Bools.firstUpdate= true;
end





--||||||||    MANAGE CODE IN THE UPDATE FRAME   |||||||||

StaticMetaInfo={}
StaticMetaInfo.text=""
function frame:OnUpdate(aElapsed)
    
    if not Bools.addonLoaded then return end

    if Bools.firstUpdate then 
        Bools.firstUpdate=false
        
        Bools.currentWindowOpenRequest=MEMO.IsTrue(MEMO.GET_WINDOWOPEN())
        Bools.previousWindowOpenRequest=Bools.currentWindowOpenRequest
        DebugMemoryTextFrame:ShowFrameOnOff(Bools.currentWindowOpenRequest)
    end
    Ints.framecount=Ints.framecount+1
    
    StaticMetaInfo.text="None "..GetTime()
    -- WAIT THAT OTHER SCRIPT ARE LOADED BEFORE USING ARRAY
    if 
        true
        --type(MemoryFunction)=="Table" 
        --and type(CustomFunction)=="Table" 
        --and type(CustomFunction.GetMetaInfo)=="function" 
        --and type(MemoryFunction.BeforeGetCustomText)=="function" 
        --and type(MemoryFunction.AfterGetCustomText)=="function" 
     
    then  
        
        MemoryFunction.BeforeGetCustomText()
        StaticMetaInfo.text =CustomFunction:GetMetaInfo() ;
        if StaticMetaInfo.text == nil then
            StaticMetaInfo.text= "Nil returned"
        else 
            --print (metaInfo)
        end
        MemoryFunction.AfterGetCustomText()
    end
    
    print (StaticMetaInfo.text)

    
    DebugMemoryTextFrame:SetTextContent(StaticMetaInfo.text .. "")
    --ClipboardFunction:SetText(metaInfo .. "")
    --MainPurpose.SetTextInStaticMemory(metaInfo .. "")

    
    --||||||||    KEY MANAGEMENT  |||||||||
    local isCtrlShiftDown= IsShiftKeyDown() and IsControlKeyDown()
    
    if isCtrlShiftDown then 

        local currentIsKKeyDown = IsKeyDown(Strings.DebugKeyName)
        
        --||||||||    PRESS   |||||||||
        if currentIsKKeyDown and not Bools.isDebugKeyDown then
           -- print("Key " .. Strings.DebugKeyName .. " pressed")
            Bools.isDebugKeyDownToggleMenu = not Bools.isDebugKeyDownToggleMenu
            
            MEMO.SET_WINDOWOPEN(Bools.isDebugKeyDownToggleMenu)
           
        end

        
        --||||||||    RELEASE   |||||||||
        if not currentIsKKeyDown and Bools.isDebugKeyDown then
           -- print("Key "..Strings.DebugKeyName.." released")
        end

        Bools.isDebugKeyDown = currentIsKKeyDown
    end

    --||||||||    CHECK MEMORY TO KNOW WHEN TO TURN ON OF THE FRAME  |||||||||
    Bools.currentWindowOpenRequest = MEMO.GET_WINDOWOPEN()
    if(Bools.currentWindowOpenRequest == not Bools.previousWindowOpenRequest) then

        --print("OHTO "..BoolToString(currentWindowOpenRequest))
        --MEMO.PrintALL()
        Bools.previousWindowOpenRequest = Bools.currentWindowOpenRequest
        DebugMemoryTextFrame:ShowFrameOnOff(Bools.currentWindowOpenRequest)
        
    end
end

function BoolToString(value)
    if value==nil then return "false" end
    if value=="false" then return "false" end
    if value==false then return "false" end
    return "true";
end

    --||||||||   HOOK TO THE FRAME THE CODE OF US |||||||||
frame:SetScript("OnEvent", frame.OnEvent);
frame:SetScript('OnUpdate', frame.OnUpdate)




    --||||||||    MANAGE SHORTCUT |||||||||
SLASH_ELOILAB1 = "/eloilab";
function SlashCmdList.ELOILAB(msg)
    print("Read me: https://github.com/EloiStree/HelloWarcraftQAXR");
    print("Cmd: /elhelp ");
end
    --||||||||    MANAGE SHORTCUT |||||||||
SLASH_ELOILABLIST1 = "/elhelp";
function SlashCmdList.ELOILABLIST(msg)
    print("Read me: https://github.com/EloiStree/HelloWarcraftQAXR");
    print("- /elwrite : write a note to keep between players");
    print("- /elread : read a note to keep between players");
    print("- /elcheck : display memory state");
    print("- /elshow : show info");
    print("- /elhide : hide info");
    print("- /elstart : Start to work and continue when you reload");
    print("- /elstop : Stop to work and need start to continue after reload");
    print("- /eltag : Put that address tag in the memory");
    print("- /elindex : Put the index Tag in the memory");
    print("- /eltype : Put the type in the memory");
    print("- /elvalue : Put the value in the memory");
    print("- /elautotagon : While modulo around 4 tag type value");
    print("- /elautotagoff : Stop debug mode (require manual now)");
    print("- /elrtfm: Give links to \"Read the fucking manual\". :)- ")
    
end

SendMessageUtility={}
SendMessageUtility.SendMessageToSelf =  function (message)
   
    SendChatMessage(message, "GUILD", nil, UnitName("player"))
end


SLASH_ELOILABRTFM1 = "/elrtfm";
function SlashCmdList.ELOILABRTFM(msg)
    ClipboardFunction:SetText("Manual: https://github.com/EloiStree/HelloWarcraftQAXR/issues\n" )
    ClipboardFunction:AppentTextEnd("Code Addons: https://github.com/EloiStree/2024_01_18_EloiLabWowAddon\n")
    ClipboardFunction:AppentTextEnd("Code Memory Reader: https://github.com/EloiStree/2023_12_31_ReadMemoryOfWow\n")
end


SLASH_ELOILAClIP1 = "/elclip";
function SlashCmdList.ELOILABClIP(msg)
    ClipboardFunction:SetText(msg)
end

SLASH_ELOILABMODTAG1 = "/eltag";
function SlashCmdList.ELOILABMODTAG(msg)
    print("Is in tag mode")
    MEMO.SetTagMode("Tag")
end


SLASH_ELOILABMODINDEX1 = "/elindex";
function SlashCmdList.ELOILABMODINDEX(msg)
    print("Is in index mode")
    MEMO.SetTagMode("Index")
end

SLASH_ELOILABMODVALUE1 = "/elvalue";
function SlashCmdList.ELOILABMODVALUE(msg)
    print("Is in value mode")
    MEMO.SetTagMode("Value")
end

SLASH_ELOILABMODTYPE1 = "/eltype";
function SlashCmdList.ELOILABMODTYPE(msg)
    print("Is in type mode")
    MEMO.SetTagMode("Type")
end


SLASH_ELOILABCHECK1 = "/elcheck";
function SlashCmdList.ELOILABCHECK(msg)
    MEMO.PrintALL()
end


SLASH_ELOILABSTART1 = "/elstart";
function SlashCmdList.ELOILABSTART(msg)
    print("Not implemented")
end

SLASH_ELOILABSTOP1 = "/elstop";
function SlashCmdList.ELOILABSTOP(msg)
    print("Not implemented")
end

SLASH_ELOILABWRITE1 = "/elwrite";
function SlashCmdList.ELOILABWRITE(msg)
    print("Write:" .. msg);
    MEMO.SET_PLAYERNOTE(msg)
end
SLASH_ELOILABREAD1 = "/elread";
function SlashCmdList.ELOILABREAD(msg)
    print("Read:" .. (MEMO.GET_PLAYERNOTE() or " "));
    
end

SLASH_ELOILABON1 = "/elshow";
function SlashCmdList.ELOILABON(msg)
    DebugMemoryTextFrame:ShowFrame()
end

SLASH_ELOILABOFF1 = "/elhide";
function SlashCmdList.ELOILABOFF(msg)
    DebugMemoryTextFrame:HideFrame()
end


SLASH_ELOILABUTOTAGON1 = "/elautotagon";
function SlashCmdList.ELOILABUTOTAGON(msg)
    print("Auto Tag loop On");
    MEMO.SET_USEDEBUGAUTORUNTAG(true)
end

SLASH_ELOILABTAGOFF1 =   "/elautotagoff";
function SlashCmdList.ELOILABTAGOFF(msg)
    print("Auto Tag loop Off");
    MEMO.SET_USEDEBUGAUTORUNTAG(false)
end



SLASH_ELOILABPLAYERINFO1 =   "/elplayerinfo";
function SlashCmdList.ELOILABPLAYERINFO(msg)

    ClipboardFunction:SetText(PlayerInfo.GetFocusPlayerAsString())
    ClipboardFunction:AppentTextEnd(PlayerInfo.GetOnMousePlayerInfoAsString())
end

SLASH_ELOILABPLAYERINFOAPP1 =   "/elplayerinfoappend";
function SlashCmdList.ELOILABPLAYERINFOAPP(msg)

    ClipboardFunction:AppentTextEnd(PlayerInfo.GetFocusPlayerAsString())
    ClipboardFunction:AppentTextEnd(PlayerInfo.GetOnMousePlayerInfoAsString())
end

PlayerInfo = {}
PlayerInfo.GetFocusPlayerAsString = function ()
    return PlayerInfo.GetInfo("target")
     
end

PlayerInfo.GetOnMousePlayerInfoAsString = function ()
    return PlayerInfo.GetInfo("mouseover")
end


local serverIDFocus="eu"
SLASH_ELOILABSERVER1 =   "/elserver";
function SlashCmdList.ELOILABSERVER(msg)
    serverIDFocus = msg
end

function replaceSpacesWithHyphens(input_text)
    local modified_text = ""

    for i = 1, #input_text do
        local char = input_text:sub(i, i)
        if char == " " then
            modified_text = modified_text .. "-"
        else
            modified_text = modified_text .. char
        end
    end

    return modified_text
end

function trimString(s)
    local start = 1
    local finish = #s

    -- Find the start index without leading whitespaces
    while start <= #s and s:sub(start, start) == ' ' do
        start = start + 1
    end

    -- Find the end index without trailing whitespaces
    while finish >= 1 and s:sub(finish, finish) == ' ' do
        finish = finish - 1
    end

    -- Return the trimmed substring
    return s:sub(start, finish)
end
-- DO LATER MACRO TO SET SERVER
local localDico={}
PlayerInfo.GetInfo= function(target)
    local select = UnitName(target)
    if select==nil then return "" end

    if( not UnitIsPlayer(target) ) then
        local npcInfoString = "Non-Player Information: "..select.."\n"
        
        local level = UnitLevel("target") or "Unknown Level"
        local classification = UnitClassification("target") or "Unknown Classification"
        npcInfoString = npcInfoString .. "Level: " .. level .. "\nClassification: " .. classification .. "\n"
        
        local faction = UnitFactionGroup("target") or "Unknown Faction"
        npcInfoString = npcInfoString .. "Faction: " .. faction .. "\n"
        
        local creatureType = UnitCreatureType("target") or "Unknown Creature Type"
        npcInfoString = npcInfoString .. "Creature Type: " .. creatureType
        return npcInfoString.."\n\n"
    end
    localDico.mname, localDico.mrealm = UnitName(target)
    localDico.mguildName, _, _, localDico.mrealmGuild = GetGuildInfo(target)
    
    if localDico.mname==nil then localDico.mname="" end
    if localDico.mrealm==nil then localDico.mrealm="" end
    if localDico.mrealmGuild==nil then  localDico.mrealmGuild="" end
    if localDico.mguildName==nil then localDico.mguildName="" end
    

    if  localDico.mrealmGuild==nil or #localDico.mrealmGuild ==0 then
        localDico.mrealmGuild=GetRealmName()
    end
    if  localDico.mrealm==nil or #localDico.mrealm==0 then
        localDico.mrealm=GetRealmName()
    end

    print(localDico.mname )
    print(localDico.mguildName )
    print(localDico.mrealm )
    print(localDico.mrealmGuild )
    

    --- WOO CORRECTION ? I DONT FEEL IT IS MY CODE.
    localDico.mrealm = string.gsub(localDico.mrealm, "LesClairvoyants", "Les-Clairvoyants")

    

    -- THIS INFO GENERATE A LINK TO CHECK THE PLAYER AND GUILD INFROMATION ONLINE.
    localDico.mouse_player_url=string.format("https://worldofwarcraft.blizzard.com/en-gb/character/%s/%s/%s "
    ,serverIDFocus , localDico.mrealm , localDico.mname)
    localDico.mouse_player_url = (replaceSpacesWithHyphens(trimString(localDico.mouse_player_url)))

    localDico.mouse_guild_url=string.format("https://worldofwarcraft.blizzard.com/en-gb/guild/%s/%s/%s",
    serverIDFocus 
    , localDico.mrealmGuild ,
     localDico.mguildName)

     localDico.mouse_guild_url= (replaceSpacesWithHyphens(trimString(localDico.mouse_guild_url)))

    return string.format("%s\n%s\n%s\n%s\n\n",
    localDico.mname,localDico.mrealm,
    localDico.mouse_player_url,
    localDico.mouse_guild_url)

end



--------------------------------------------------------------------------[[

