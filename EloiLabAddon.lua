



--CameraZoomOut(increment)

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
Strings.ServerID="eu";

local checkForCall={}

checkForCall.fctCalled=0
checkForCall.hasChanged=false





--||||||||      SAVED MEMORY VAR ACCESS      |||||||||
MEMO= {}
MEMO.OnWindowOpenChanged = function (value)
    if(value) then 
        print("Hide UI Eloi Lab")
        clipFrame:Show()
        clipPrintFrame:Show();
        clipFrame.editBox:Show()
        clipPrintFrame.editBox:Show();
        DebugMemoryTextFrame:Show();
    else 
        print("Show UI Eloi Lab")
        clipFrame:Hide()
        clipPrintFrame:Hide();
        clipFrame.editBox:Hide()
        clipPrintFrame.editBox:Hide();
        DebugMemoryTextFrame:Hide();
    
    end
end

MEMO.IS_ADDONLOADED= function() return Bools.addonLoaded end

MEMO.SET_USEDEBUGAUTORUNTAG=function (value)  MEMO_DEBUGAUTORUNTAG=value end
MEMO.GET_USEDEBUGAUTORUNTAG=function () return MEMO_DEBUGAUTORUNTAG end

MEMO.SET_WINDOWOPEN=function (value)  MEMO_WINDOWOPEN=value MEMO.OnWindowOpenChanged(value) end
MEMO.GET_WINDOWOPEN=function () return MEMO_WINDOWOPEN end

MEMO.SET_METAINFOTEXT=function (value) MEMO_METAINFOTEXT=value end
MEMO.GET_METAINFOTEXT=function () return  MEMO_METAINFOTEXT end

MEMO.TOGGLE_WINDOWOPEN=function () return MEMO.SET_WINDOWOPEN (not MEMO.GET_WINDOWOPEN()) end

MEMO.SET_MEMO_CLIPBOARD =function (value)  MEMO_CLIPBOARD=value  end
MEMO.GET_MEMO_CLIPBOARD =function () return MEMO_CLIPBOARD end

MEMO.SET_SERVERID =function (value) MEMO_SERVERID =value end
MEMO.GET_SERVERID  =function () return MEMO_SERVERID  end

MEMO.SET_PLAYERNOTE=function (value) MEMO_PLAYERNOTE=value end
MEMO.GET_PLAYERNOTE=function () return MEMO_PLAYERNOTE end



MEMO.ToggleBlindMode= function ()    
    MEMO_BLINDMODE = not MEMO_BLINDMODE
end

MEMO.SetBlindMode= function (boolValue)    
    MEMO_BLINDMODE = boolValue
end
MEMO.GetBlindMode= function ()    
    return MEMO_BLINDMODE
end

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
    if modeId == "Index" or modeId==2  then
        return MEMO_TAGMODE ==2
    end
    if modeId == "Value" or modeId==3 then
        return MEMO_TAGMODE ==3
    end
    return false
end


MEMO.PrintALL=function () 
    El_Print( "## CHECK SAVED MEMORY ##")
    ElP_End("- Is loaded ? "..(MEMO.IsTrueAsString( MEMO.IS_ADDONLOADED()) ))
    ElP_End("  - Keep Window open ? "..(MEMO.IsTrueAsString( MEMO.GET_WINDOWOPEN())))
    ElP_End("  - Player note: "..(MEMO.ProtectEmpty (MEMO.GET_PLAYERNOTE())))
    ElP_End("  - Meta text: "..(MEMO.ProtectEmpty (MEMO.GET_METAINFOTEXT())))
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
function ClipboardFunction:GetText()
    if clipFrame then
        return clipFrame:GetText()
    end
    return ""
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



--||||||||     CREATE THE FRAME  PRINT CLIPBOARD     |||||||||

 -- Create the frame
 clipPrintFrame = CreateFrame("Frame", "Clip Print Frame", UIParent)

 clipPrintFrame:SetMovable(true)
 clipPrintFrame:EnableMouse(true)
 clipPrintFrame:RegisterForDrag("LeftButton")
 clipPrintFrame:SetScript("OnDragStart", clipPrintFrame.StartMoving)
 clipPrintFrame:SetScript("OnDragStop", clipPrintFrame.StopMovingOrSizing)

    

 -- Add an EditBox to the frame for text input
 clipPrintFrame.editBox = CreateFrame("EditBox", nil, clipPrintFrame)
 clipPrintFrame.editBox:SetAllPoints(true)
 clipPrintFrame.editBox:SetMultiLine(true)
 clipPrintFrame.editBox:SetAutoFocus(false)
 clipPrintFrame.editBox:SetFontObject(ChatFontNormal)
 clipPrintFrame.editBox:SetScript("OnEscapePressed", function() clipPrintFrame:Hide() end)

-- Function to set text in the EditBox
clipPrintFrame.SetText = function(self, text)
    self.editBox:SetText(text)
end

clipPrintFrame.GetText = function(self)
    return self.editBox:GetText()
end



-- Method to set text in the movable frame
function ClipboardFunction:ClearPrintText()
    if clipPrintFrame then
        clipPrintFrame:SetText("")
    end
end

-- Method to set text in the movable frame
function ClipboardFunction:SetPrintText(text)
    if clipPrintFrame then
        clipPrintFrame:SetText(text)
    end
end

-- Method to set text in the movable frame
function ClipboardFunction:AppentPrintTextEnd(text)
    if clipPrintFrame then
        clipPrintFrame:SetText(clipPrintFrame:GetText().. text)
    end
end
-- Method to set text in the movable frame
function ClipboardFunction:AppentPrintTextStart(text)
    if clipPrintFrame then
        clipPrintFrame:SetText(text ..clipPrintFrame:GetText())
    end
end

ELP={}


ELP.Set = function (message)    ClipboardFunction:SetPrintText(message)end   
ELP.Print= function (message)   ELP.Set(message) end
ELP.Start = function (message)    ClipboardFunction:AppentPrintTextStart(message) end 
ELP.End = function (message)    ClipboardFunction:AppentPrintTextEnd(message) end
ELP.StartLine = function (message)  ClipboardFunction:AppentPrintTextStart(message.."\n")end 
ELP.EndLine = function (message) ClipboardFunction:AppentPrintTextEnd("\n"..message)end
-- Function to show the movable frame


function ClipboardFunction:ShowPrintMovableFrame()
    if not clipPrintFrame then
        ClipboardFunction:CreateMovableFrame()
    end
    clipPrintFrame:Show()
end




--||||||||     CREATE THE FRAME       |||||||||


-- Create the DebugMemoryTextFrame frame
 DebugMemoryTextFrame = CreateFrame("Frame", "DebugMemoryTextFrame", UIParent)

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

    clipFrame:SetSize(UIParent:GetWidth() * 0.2, UIParent:GetHeight()*0.05)
    clipFrame:SetPoint("TOPLEFT",( 0.2 * (UIParent:GetWidth() )+30), 0)
    
    clipPrintFrame:SetSize(UIParent:GetWidth() * 0.20, UIParent:GetHeight()*0.05)
    clipPrintFrame:SetPoint("TOPLEFT", (0.4*(UIParent:GetWidth())+30) ,0)

end

function clipFrame:ShowFrame()
    self:Show()
end

function clipFrame:HideFrame()
    self:Hide()
end


function clipPrintFrame:ShowFrame()
    self:Show()
end

function clipPrintFrame:HideFrame()
    self:Hide()
end


function CheckForBlindMode()
    
    if(MEMO.GetBlindMode())then
        SetCVar("RenderScale", 0.009)        
    else 
        SetCVar("RenderScale", 0.5)
        
    end
end

function frame:OnEvent(event, arg1)
    UpdateFramesPosition()
    if Bools.toggle_OnEventDebugLog then
        ELP.Print("Event:".. (event or ""))
        ELP.End ( "Arg1:".. (arg1 or ""))
    end



    --||||||||     WHEN PLAYER RELOAD      |||||||||
    if event == "ADDON_LOADED" and arg1 == "EloiLab" then
        ELP.Print("> Eloi Lab info: /elhelp ")
        ELP.EndLine ("> How to use ? /elrtfm")
        ELP.EndLine("> This tool is for educational purpose")
        ELP.EndLine("> Use it is against TOS")
        ELP.EndLine("> YOU ARE GOING TO BE BAN FOR USING IT: DON'T.")
        ELP.EndLine("= But if you do, Have fun learning :)-")
            
        
        

        
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
        Strings.ServerID = MEMO.GET_SERVERID();
        if(Strings.ServerID ==nil or Strings.ServerID=="") then
            Strings.ServerID="eu"
        end

        RunTestLuaText("print('Hoy hey hoy !')")
        CheckForBlindMode()
        --QuickTestRef.start()

        --PrintAllKeyBindings()



        --Run Macro apparently is block by blizzard don't use.
        --RunMacroText("/elrtfm")
        -- this one call macro that the player created in the macro interface
        --RunMacro("Hello")
    end
end



function RunTestLuaText(luaCodeText)

    local luaCodeFunction, errorMessage = loadstring(luaCodeText)
    if luaCodeFunction then
        luaCodeFunction()
    else
        ELP.Print("Error in Lua code:".. errorMessage)
    end
end
function RunTestLuaTextWithReturn(luaCodeText)

local luaCodeFunction, errorMessage = loadstring(luaCodeText)
    if luaCodeFunction then
        return luaCodeFunction()
    else
        return ("Error in Lua code:".. errorMessage)
    end
end


local text0=""
function RunTestLuaTextCatched(luaCodeText)
    text0 =luaCodeText
    _,_=pcall(RunTestLuaTextCatched0)
end
function RunTestLuaTextCatched0()

    local luaCodeFunction, errorMessage = loadstring(text0)
        if luaCodeFunction then
            return luaCodeFunction()
        else
            ELP.Print("Lua Not Executed "..GetTime());
            return ("Error in Lua code:".. errorMessage)
        end
    end
    
    


ExitFunction={}
ExitFunction.ResetVar=function ()
    Bools.previousWindowOpenRequest=false
    Bools.currentWindowOpenRequest=false
    Bools.firstUpdate= true;
end




--[[


FollowUnit("unit")

    LeaveParty() 
AcceptGroup() - Accept the invitation to party.
ConfirmReadyCheck(isReady) - Indicate if you are ready or not.
ConvertToRaid() - Converts party to raid.
DeclineGroup() - Decline the invitation to a party.
DoReadyCheck() - Initiate a ready check.
InviteUnit("name" or "unit") - Invites the specified player to the group you are currently in (added 2.0.0)
IsInGroup() -
CameraZoomIn(increment) - Zooms the camera into the viewplane by increment.
CameraZoomOut(increment) - Zooms the camera out of the viewplane by increment.
FlipCameraYaw(degrees) - Rotates the camera about the Z-axis by the angle amount specified in degrees.
NextView() - Cycles forward through the five predefined camera positions.
PrevView() - Cycles backward through the five predefined camera positions.
ResetView(index) - Resets the specified (1-5) predefined camera position to its default if it was changed using #SaveView(index).
SaveView(index) - Replaces the specified (1-5) predefined camera positions with the current camera position.
SetView(index) - Sets camera position to a specified (1-5) predefined camera position.
]]



local maxFunctionCallable= 1000
function RunLuaUnderCatchFromFctCallId()
    if (checkForCall.fctCalled < maxFunctionCallable and checkForCall.fctCalled>0) then 
        RunTestLuaText(CustomLuaCodeIndex[checkForCall.fctCalled])
    end
end





LuaText={}
LuaText.clipboardtext=""
function RunLuaEditorTextUnderCatch()
    LuaText.clipboardtext = ClipboardFunction:GetText();
    RunTestLuaText(LuaText.clipboardtext)
    
end



--11E70AC8A20

--||||||||    MANAGE CODE IN THE UPDATE FRAME   |||||||||

StaticMetaInfo={}
StaticMetaInfo.text=""


local previousLua=""
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

        checkForCall.fctCalled, checkForCall.hasChanged = MemoryFunction.ReadGateInText()
        if(checkForCall.hasChanged) then 
            ELP.Print("Command Called:"..checkForCall.fctCalled)
            local success, result = pcall(RunLuaUnderCatchFromFctCallId)
        end
        

        local gateInReceived = MemoryFunction.ReadGateInText()
        MemoryFunction.BeforeGetCustomText()
        StaticMetaInfo.text =CustomFunction:GetMetaInfo() 
        if StaticMetaInfo.text == nil then
            StaticMetaInfo.text= "Nil returned"
        else 
            DebugMemoryTextFrame:SetTextContent("GATE IN:\n"..gateInReceived .."\n\n\nGATE OUT:\n"..StaticMetaInfo.text )
            
            if(string.lower(previousLua) ~= string.lower(gateInReceived)) then 
                --print("II")
                RunTestLuaTextCatched(gateInReceived)
                previousLua=gateInReceived
            end
            
        end
        MemoryFunction.AfterGetCustomText(StaticMetaInfo.text)
    end
    
   -- print (StaticMetaInfo.text)
   -- OLD: was trying to read text from memory before realizing that LUA string changing addresses system.
   -- Not a anti-cheat, just lua dealing with memory
    MainPurpose.SetTextInStaticMemory(StaticMetaInfo.text )

    
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
    ELP.Print("Read me: https://github.com/EloiStree/HelloWarcraftQAXR");
    ELP.EndLine("Cmd: /elhelp ");
end
    --||||||||    MANAGE SHORTCUT |||||||||
SLASH_ELOILABLIST1 = "/elhelp";
function SlashCmdList.ELOILABLIST(msg)

    ELP.Print("Read me: https://github.com/EloiStree/HelloWarcraftQAXR");
    ELP.EndLine("- /elwrite : write a note to keep between players");
    ELP.EndLine("- /elread : read a note to keep between players");
    ELP.EndLine("- /elcheck : display memory state");
    ELP.EndLine("- /elshow : show info");
    ELP.EndLine("- /elhide : hide info");
    ELP.EndLine("- /elstart : Start to work and continue when you reload");
    ELP.EndLine("- /elstop : Stop to work and need start to continue after reload");
    ELP.EndLine("- /eltag : Put that address tag in the memory");
    ELP.EndLine("- /elindex : Put the index Tag in the memory");
    ELP.EndLine("- /eltype : Put the type in the memory");
    ELP.EndLine("- /elvalue : Put the value in the memory");
    ELP.EndLine("- /elautotagon : While modulo around 4 tag type value");
    ELP.EndLine("- /elautotagoff : Stop debug mode (require manual now)");
    ELP.EndLine("- /elserver eu|us|?? : Set the server you are on for link generation");
    ELP.EndLine("- /elplayerinfoappend : Append in the clipboard information about the target and mouseover")
    ELP.EndLine("- /elplayerinfo : Set in the clipboard information about the target and mouseover")
    ELP.EndLine("- /elrtfm: Give links to \"Read the fucking manual\". :)- ")
    
end

SendMessageUtility={}
SendMessageUtility.SendMessageToSelf =  function (message)
   
    SendChatMessage(message, "GUILD", nil, UnitName("player"))
end


function ExecuteCodeAndPrintResult(code)
    -- Use pcall to catch errors in the code
    local success, result = pcall(loadstring(code))

    -- Check if execution was successful
    if success then
        -- Print the result
        return result
    else
        -- Print the error message
        return "Error"
    end
end



SLASH_ELOILABRTFM1 = "/elrtfm";
function SlashCmdList.ELOILABRTFM(msg)
    ELP.Print("Manual: https://github.com/EloiStree/HelloWarcraftQAXR/issues\n" )
    ELP.EndLine("Code Addons: https://github.com/EloiStree/2024_01_18_EloiLabWowAddon\n")
    ELP.EndLine("Code Memory Reader: https://github.com/EloiStree/2023_12_31_ReadMemoryOfWow\n")
end




SLASH_ELOILABELOISETUP1 = "/eloisetup";
function SlashCmdList.ELOILABELOISETUP(msg)
    QuickTestRef.start()
end


SLASH_ELOILABELOIEDITLUAPRINT1 = "/eluaprintreturn";
function SlashCmdList.ELOILABELOIEDITLUAPRINT(msg)
    
    --print(("Try Start"))
    ELP.Print(">"..ExecuteCodeAndPrintResult(ClipboardFunction:GetText()))
    --print(("Try End"))
end


SLASH_ELOILABELOIEDITLUA1 = "/elua";
function SlashCmdList.ELOILABELOIEDITLUA(msg)
    
    --local success, result = pcall(RunLuaEditorTextUnderCatch)
    RunLuaEditorTextUnderCatch()
end

SLASH_ELOILAClIP1 = "/elclip";
function SlashCmdList.ELOILABClIP(msg)
    ClipboardFunction:SetText(msg)
end

SLASH_ELOILABMODTAG1 = "/eltag";
function SlashCmdList.ELOILABMODTAG(msg)
    ELP.Print("Is in tag mode "..tagInjectionGeneric)
    MEMO.SetTagMode("Tag")
end

SLASH_ELOILABMODINDEX1 = "/elindex";
function SlashCmdList.ELOILABMODINDEX(msg)
    ELP.Print("Is in index mode")
    MEMO.SetTagMode("Index")
end

SLASH_ELOILABMODVALUE1 = "/elvalue";
function SlashCmdList.ELOILABMODVALUE(msg)
    ELP.Print("Is in value mode")
    MEMO.SetTagMode("Value")
end

SLASH_ELOILABMODTYPE1 = "/eltype";
function SlashCmdList.ELOILABMODTYPE(msg)
    ELP.Print("Is in type mode")
    MEMO.SetTagMode("Type")
end


SLASH_ELOILABCHECK1 = "/elcheck";
function SlashCmdList.ELOILABCHECK(msg)
    MEMO.PrintALL()
end


SLASH_ELOILABSTART1 = "/elstart";
function SlashCmdList.ELOILABSTART(msg)
    ClipboardFunction:SetText("Not implemented")
end

SLASH_ELOILABSTOP1 = "/elstop";
function SlashCmdList.ELOILABSTOP(msg)
    ClipboardFunction:SetText("Not implemented")
end

SLASH_ELOILABWRITE1 = "/elwrite";
function SlashCmdList.ELOILABWRITE(msg)
    ClipboardFunction:SetText("Write:" .. msg);
    MEMO.SET_PLAYERNOTE(msg)
end
SLASH_ELOILABREAD1 = "/elread";
function SlashCmdList.ELOILABREAD(msg)
    ClipboardFunction:SetText("Read:" .. (MEMO.GET_PLAYERNOTE() or " "));
    
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
    ELP.Print("Auto Tag loop On");
    MEMO.SET_USEDEBUGAUTORUNTAG(true)
end

SLASH_ELOILABTAGOFF1 =   "/elautotagoff";
function SlashCmdList.ELOILABTAGOFF(msg)
    ELP.Print("Auto Tag loop Off");
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


SLASH_ELOILABSERVER1 =   "/elserver";
function SlashCmdList.ELOILABSERVER(msg)
    Strings.ServerID = msg
    MEMO.SET_SERVERID(msg)
;end

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
        
        npcInfoString = npcInfoString ..  ( UnitGUID(target)  or  "" ).."\n";
        local level = UnitLevel(target) or "Unknown Level"
        local classification = UnitClassification(target) or "Unknown Classification"
        npcInfoString = npcInfoString .. "Level: " .. level .. "\nClassification: " .. classification .. "\n"
        
        local faction = UnitFactionGroup(target) or "Unknown Faction"
        npcInfoString = npcInfoString .. "Faction: " .. faction .. "\n"
        
        local creatureType = UnitCreatureType(target) or "Unknown Creature Type"
        npcInfoString = npcInfoString .. "Creature Type: " .. creatureType
        return npcInfoString.."\n\n"
    end


    localDico._GUID= ( UnitGUID(target)  or  "" ).."\n";
    localDico.targetlevel=UnitLevel(target)
    localDico.mname, localDico.mrealm = UnitName(target)
    localDico.mguildName, _, _, localDico.mrealmGuild = GetGuildInfo(target)
    



    local guildName, guildRankName, guildRankIndex, _, _, guildLevel, guildExperience, guildMembersOnline, guildMembersTotal, _, guildId, guildAchievementPoints, guildMOTD = GetGuildInfo(target)
    if guildName then
        localDico.guildDescription= string.format("Guild:%s (%s |%s)", guildName,guildRankName or "N/A",guildRankIndex or "N/A")
    else
        localDico.guildDescription=("Not in a guild.")
    end



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

   

    --- WOO CORRECTION ? I DONT FEEL IT IS MY CODE.
    localDico.mrealm = string.gsub(localDico.mrealm, "LesClairvoyants", "Les-Clairvoyants")

    

    -- THIS INFO GENERATE A LINK TO CHECK THE PLAYER AND GUILD INFROMATION ONLINE.
    localDico.mouse_player_url=string.format("https://worldofwarcraft.blizzard.com/en-gb/character/%s/%s/%s "
    ,Strings.ServerID , localDico.mrealm , localDico.mname)
    localDico.mouse_player_url = (replaceSpacesWithHyphens(trimString(localDico.mouse_player_url)))

    localDico.mouse_player_raidio_url=string.format("https://raider.io/characters/%s/%s/%s"
    ,Strings.ServerID , localDico.mrealm , localDico.mname)
    localDico.mouse_player_raidio_url = (replaceSpacesWithHyphens(trimString(localDico.mouse_player_raidio_url)))

    localDico.mouse_guild_url=string.format("https://worldofwarcraft.blizzard.com/en-gb/guild/%s/%s/%s",
    Strings.ServerID 
    , localDico.mrealmGuild ,
     localDico.mguildName)

     localDico.mouse_guild_url= (replaceSpacesWithHyphens(trimString(localDico.mouse_guild_url)))
localDico.whisper = string.format("/w %s-%s",localDico.mname,localDico.mrealm)
    return string.format("%s | %s %s\n%s\n%s\n%s\n%s\n%s\n%s\n\n",
    localDico.mname,localDico.mrealm,localDico.targetlevel,
    localDico._GUID,
    localDico.guildDescription,
    localDico.mouse_player_url,
    localDico.mouse_player_raidio_url,
    localDico.mouse_guild_url,
    localDico.whisper
    
)

end



--------------------------------------------------------------------------[[



local isMouseOverLogo=false
local charDebugMode=false



-- MyAddon.lua

-- Create a frame
local LogoImage = CreateFrame("Frame", "LogoImage", UIParent)
LogoImage:SetSize(64, 64)
LogoImage:SetPoint("CENTER")
LogoImage:EnableMouse(true)
LogoImage:SetMovable(true)
LogoImage:RegisterForDrag("LeftButton")
LogoImage:SetScript("OnDragStart", LogoImage.StartMoving)
LogoImage:SetScript("OnDragStop", LogoImage.StopMovingOrSizing)

-- Create a texture for the clickable image
local LogoImageTexture = LogoImage:CreateTexture(nil, "OVERLAY")
LogoImageTexture:SetAllPoints()
--LogoImageTexture:SetTexture("Interface\\AddOns\\EloiLab\\Image\\RTFM.tga")
LogoImageTexture:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
local imagePath = "Interface\\AddOns\\EloiLab\\Images\\EloiTeachingLab.tga"
LogoImageTexture:SetTexture(imagePath)
LogoImageTexture:SetAllPoints()

-- Set the strata and level
LogoImage:SetFrameStrata("HIGH")  -- Set the strata to "HIGH" to place it above most UI elements
LogoImage:SetFrameLevel(100)  -- Set the level to a high value

-- Set a tooltip for the image
LogoImage:SetScript("OnEnter", function(self)
    isMouseOverLogo=true
    GameTooltip:SetOwner(self, "ANCHOR_TOP")
    GameTooltip:SetText("Middle:How to use Addon | Right:Learn to Code")
    GameTooltip:Show()
end)

LogoImage:SetScript("OnLeave", function()
    isMouseOverLogo=false
    GameTooltip:Hide()
end)


local isMouseLeftOn=false
local isMouseMiddleOn=false
local isMouseRightOn=false


-- Handle click events
LogoImage:SetScript("OnMouseUp", function(self, button)
    --print("OnClick triggered with button:", button)
    if button == "LeftButton" then isMouseLeftOn = false end
    if button == "MiddleButton" then isMouseMiddleOn = false end
    if button == "RightButton" then isMouseRightOn = false end
        
   
   
end)-- Handle click events


-- Handle click events
LogoImage:SetScript("OnMouseDown", function(self, button)
    --print("OnClick triggered with button:", button)
    if button == "LeftButton" then isMouseLeftOn = true end
    if button == "MiddleButton" then isMouseMiddleOn = true end
    if button == "RightButton" then isMouseRightOn = true end
        --print("Hello, World!")
   if isMouseLeftOn then 
        if isMouseRightOn then
           MEMO.TOGGLE_WINDOWOPEN()
         end 
        if isMouseMiddleOn then
            ClipboardFunction:SetText("Copy Past Me:\nHow to use the addon:\n https://github.com/EloiStree/2024_01_18_EloiLabWowAddon")
        end
    else

        if isMouseRightOn then
            ClipboardFunction:SetText("Copy Past Me:\nLearn To code with Warcraft: \nhttps://github.com/EloiStree/HelloWarcraftQAXR")
         end 
        if isMouseMiddleOn then
            ClipboardFunction:SetText("Copy Past Me:\nHow to use the addon:\n https://github.com/EloiStree/2024_01_18_EloiLabWowAddon")
        end
    end
   
end)-- Handle click events




LogoImage:SetScript("OnChar", function(self, button)

    if isMouseOverLogo and button == "y" then
        ELP.Print("Tag")
        MEMO.SetTagMode("Tag")
    end
    if isMouseOverLogo and button == "u" then
        ELP.Print("Type")
        MEMO.SetTagMode("Type")
    end
    if isMouseOverLogo and button == "i" then
        ELP.Print("Index")
        MEMO.SetTagMode("Index")
    end
    if isMouseOverLogo and button == "o" then
        ELP.Print("Value")
        MEMO.SetTagMode("Value")
        
    end
    if isMouseOverLogo and button == "e" then
        MEMO.SetTagMode("Value")
    end
    if isMouseOverLogo and button == "b" then
        MEMO.ToggleBlindMode()
        CheckForBlindMode()
    end

    if LogoDebugMode.charDebugMode then 
        print("OnChar:", button)
    end 
    
end)

LogoDebugMode= {}
LogoDebugMode.charDebugMode=false
LogoDebugMode.Toogle_charDebugMode = function ()
     LogoDebugMode.charDebugMode = not LogoDebugMode.charDebugMode
    end




    function PrintAllKeyBindings()

        -- Ignore for the moment
        --if true then return end
        
        print("List of Key Bindings:")
    
        local text=""
        -- Iterate through all possible actions
        for i = 1, 1000 do
            local actionName = GetBinding(i)
    
            if actionName then
                local key1, key2 = GetBindingKey(actionName)
                text = text.."\nSetBinding(\""..(key2 or "").."\",\"".. actionName .."\")"
                text = text.."\nSetBinding(\""..(key1 or "").."\",\"".. actionName .."\")"
                --text = text.."\nbindingSetup.".. actionName .. "=\"".. (key2 or "").."\""
                ClipboardFunction:SetText(text)  
            else
                break  -- Break the loop when no more actions are found
            end
        end
        
    end