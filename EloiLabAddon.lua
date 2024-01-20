
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
MEMO.GET_WINDOWOPEN=function () return MEMO_PLAYERNOTE end
MEMO.GET_METAINFOTEXT=function () return  MEMO_METAINFOTEXT end
MEMO.GET_PLAYERNOTE=function () return MEMO_PLAYERNOTE end

MEMO.SetTagMode =function (modeId) 
    if modeId == "Tag" or modeId==0 or modeId=="t"or modeId=="T" then
        MEMO_TAGMODE =0
    end  
    if modeId == "Index" or modeId==1  or modeId=="i"or modeId=="i"then
        MEMO_TAGMODE =1
    end   
     if modeId == "Value" or modeId==2  or modeId=="v"or modeId=="v"then
        MEMO_TAGMODE =2
    end
end
MEMO.IsTagMode =function (modeId) 
    if(modeId==nil or MEMO_TAGMODE==next) then return false end
    if modeId == "Tag" or modeId==0 or modeId=="t"or modeId=="T" then
        return MEMO_TAGMODE ==0
    end  
    if modeId == "Index" or modeId==1  or modeId=="i"or modeId=="i"then
        return MEMO_TAGMODE ==1
    end   
     if modeId == "Value" or modeId==2  or modeId=="v"or modeId=="v"then
        return MEMO_TAGMODE ==2
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



--||||||||     CREATE THE FRAME       |||||||||

-- Create the DebugMemoryTextFrame frame
local DebugMemoryTextFrame = CreateFrame("Frame", "DebugMemoryTextFrame", UIParent)
DebugMemoryTextFrame:SetSize(UIParent:GetWidth() * 0.2, UIParent:GetHeight())
DebugMemoryTextFrame:SetPoint("LEFT", 0, 0)

-- Create a scroll frame to support scrolling for long texts
local ScrollFrame = CreateFrame("ScrollFrame", "DebugMemoryTextScrollFrame", DebugMemoryTextFrame, "UIPanelScrollFrameTemplate")
ScrollFrame:SetPoint("TOPLEFT", DebugMemoryTextFrame, "TOPLEFT", 0, 0)
ScrollFrame:SetPoint("BOTTOMRIGHT", DebugMemoryTextFrame, "BOTTOMRIGHT", 0, 0)



-- Create an edit box to display the text
local EditBox = CreateFrame("EditBox", "DebugMemoryTextEditBox", ScrollFrame)
EditBox:SetMultiLine(true)
EditBox:SetAutoFocus(false)
EditBox:SetFontObject(ChatFontNormal)
EditBox:SetWidth(ScrollFrame:GetWidth() - 20)
EditBox:SetHeight(ScrollFrame:GetHeight())
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


function frame:OnEvent(event, arg1)

    if Bools.toggle_OnEventDebugLog then
        print("Event:".. (event or ""))
        print("Arg1:".. (arg1 or ""))
    end



    --||||||||     WHEN PLAYER RELOAD      |||||||||
    if event == "ADDON_LOADED" and arg1 == "EloiLab" then
        print("> Eloi Lab info: /elhelp ")
        print("> SavedVar__   Static__")
        Bools.addonLoaded=true
        --MEMO.PrintALL()

        local textInMemory = MEMO.GET_METAINFOTEXT()
        textInMemory = textInMemory or ""
        MainPurpose.SetTextInStaticMemory(textInMemory)
        

    elseif event == "PLAYER_LOGOUT" then
        MainPurpose.SetTextInStaticMemory( StaticAddress.GetStaticText())
        ExitFunction.ResetVar()
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


function frame:OnUpdate(aElapsed)
    
    if not Bools.addonLoaded then return end

    if Bools.firstUpdate then 
        Bools.firstUpdate=false
        
        Bools.currentWindowOpenRequest=MEMO.IsTrue(MEMO.GET_WINDOWOPEN())
        Bools.previousWindowOpenRequest=Bools.currentWindowOpenRequest
        DebugMemoryTextFrame:ShowFrameOnOff(Bools.currentWindowOpenRequest)
    end
    Ints.framecount=Ints.framecount+1
    local metaInfo =CustomFunction.GetMetaInfo() ;
    
    MainPurpose.SetTextInStaticMemory(CustomFunction.GetMetaInfo())
    DebugMemoryTextFrame:SetTextContent(metaInfo)


    
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
    print("- /elvalue : Put the value in the memory");
end


SLASH_ELOILABMODTAG1 = "/eltag";
function SlashCmdList.ELOILABMODTAG(msg)
    MEMO.SetTagMode("Tag")
end

SLASH_ELOILABMODINDEX1 = "/elindex";
function SlashCmdList.ELOILABMODINDEX(msg)
    MEMO.SetTagMode("Index")
end

SLASH_ELOILABMODVALUE1 = "/elvalue";
function SlashCmdList.ELOILABMODVALUE(msg)
    MEMO.SetTagMode("Value")
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





--------------------------------------------------------------------------[[

