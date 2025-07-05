--- Color to mark the border of the map and the center of it
local colorMapBorder = { r = 1, g = 0.4, b = 0.7, a = 1 } -- Pink
--- Color to make the borde of the screen
local borderColor = { r = 0, g = 1, b = 0, a = 1 } -- Orange











local isClassic = false
local isRetail = false





-- Check if the game is running in any Classic version
if WOW_PROJECT_ID == WOW_PROJECT_CLASSIC or
   WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC or
   WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC then
    isClassic = true
end

isRetail= not isClassic

if isClassic then
    print("The game is running in Classic WoW.")
else
    print("The game is running in Retail WoW.")
end


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








--------------------------------------------------








time_new_discovered = 0

function GetTimeSinceLastDiscovered()
    return GetTime() - time_new_discovered
end

function HasDiscoveredZoneLastSeconds(seconds)
    if time_new_discovered == 0 then return false end
    return GetTimeSinceLastDiscovered() < seconds
end


discovered_area_id = 0
discovered_zone_text = "Zone Discovered"
discovered_sub_zone_text = "Zone Discovered"



local f = CreateFrame("Frame")
f:RegisterEvent("CHAT_MSG_SYSTEM")

f:SetScript("OnEvent", function(self, event, msg)
    -- Check if the message contains "Discovered"
    if msg:find("Discovered") then
        local areaID = C_Map.GetBestMapForUnit("player")
        if areaID then
            local areaName = C_Map.GetAreaInfo(areaID)
            local subZoneName = GetSubZoneText()
            print("Discovered Area ID: " .. tostring(areaID))
            print("Discovered Area Name: " .. tostring(areaName))
            print("Current Sub Zone Name: " .. tostring(subZoneName))

            discovered_area_id = areaID
            discovered_zone_text = areaName or "Unknown Zone"
            discovered_sub_zone_text = subZoneName or "Unknown Sub Zone"

            time_new_discovered = GetTime()

        else
            print("No area ID found.")
        end
    end
end)


-----------------------------------------------


-- Create a full-screen frame
local borderFrame = CreateFrame("Frame", "OrangeBorderFrame", UIParent)
borderFrame:SetFrameStrata("FULLSCREEN_DIALOG")
borderFrame:SetAllPoints(UIParent)


-- Top
local top = borderFrame:CreateTexture(nil, "OVERLAY")
top:SetColorTexture(borderColor.r, borderColor.g, borderColor.b, borderColor.a)
top:SetPoint("TOPLEFT", borderFrame, "TOPLEFT", 0, 0)
top:SetPoint("TOPRIGHT", borderFrame, "TOPRIGHT", 0, 0)
top:SetHeight(10)

-- Bottom
local bottom = borderFrame:CreateTexture(nil, "OVERLAY")
bottom:SetColorTexture(borderColor.r, borderColor.g, borderColor.b, borderColor.a)
bottom:SetPoint("BOTTOMLEFT", borderFrame, "BOTTOMLEFT", 0, 0)
bottom:SetPoint("BOTTOMRIGHT", borderFrame, "BOTTOMRIGHT", 0, 0)
bottom:SetHeight(10)

-- Left
local left = borderFrame:CreateTexture(nil, "OVERLAY")
left:SetColorTexture(borderColor.r, borderColor.g, borderColor.b, borderColor.a)
left:SetPoint("TOPLEFT", borderFrame, "TOPLEFT", 0, 0)
left:SetPoint("BOTTOMLEFT", borderFrame, "BOTTOMLEFT", 0, 0)
left:SetWidth(10)

-- Right
local right = borderFrame:CreateTexture(nil, "OVERLAY")
right:SetColorTexture(borderColor.r, borderColor.g, borderColor.b, borderColor.a)
right:SetPoint("TOPRIGHT", borderFrame, "TOPRIGHT", 0, 0)
right:SetPoint("BOTTOMRIGHT", borderFrame, "BOTTOMRIGHT", 0, 0)
right:SetWidth(10)


local innerBorderFrameHeight = borderFrame:GetHeight() - 20 -- Subtract the height of the top and bottom borders
local innerBorderFrameWidth = borderFrame:GetWidth() - 20 -- Subtract the width of the left and right borders




local function ClearMinimapOverlays()
    -- Remove the mask texture
    Minimap:SetMaskTexture("Interface\\Buttons\\WHITE8x8")

end



local hideMapMask = true
if hideMapMask then
   ClearMinimapOverlays()
end



-----------------------------------------------------







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




------------ CREATE PLAYER ID FRAME

local frame = CreateFrame("Frame", "TargetIDFrame", UIParent)
frame:SetSize(200, 50)
frame:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, UIParent:GetHeight() * 0.002)

frame.text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
frame.text:SetPoint("CENTER")
frame.text:SetTextColor(0, 1, 0) -- Green color

local no_id = "No ID"
local focus_id = "mouseover"  -- Change to mouseover instead of target

local function UpdateTargetID()
    frame.text:SetText(no_id)
    if UnitExists(focus_id) then
        local targetGUID = UnitGUID(focus_id)
        if targetGUID then
            local targetID = select(6, strsplit("-", targetGUID))
            if UnitIsPlayer(focus_id) then
                local name, realm = UnitName(focus_id)
                frame.text:SetText((realm or "No Realm").."-"..(MEMO.GET_SERVERID() or "EU?US").."-"..targetGUID or no_id)
            else    
                frame.text:SetText(UnitGUID(focus_id))
            end
        end
    end
end

-- Using C_Timer.NewTicker to call UpdateTargetID every 0.1 seconds
C_Timer.NewTicker(0.1, UpdateTargetID)
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:SetScript("OnEvent", UpdateTargetID)



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
    
    -- if(MEMO.GetBlindMode())then
    --     SetCVar("RenderScale", 0.009)   
    --     SetCVar("gxWindow", 1)
    --     SetCVar("gxWindowedResolution", "320x240")
    --     if isRetail then
    --         ReloadUI()      
    --     end
    -- else 
    --     SetCVar("RenderScale", 0.5)
    --     SetCVar("gxWindow", 1)
    --     SetCVar("gxWindowedResolution", "320x240")
    --     if isRetail then
    --         ReloadUI()      
    --     end
        
    -- end
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





local bool_usePixelUpdate = false

if bool_usePixelUpdate then

        ------------------ COLORSTART
        local screenHeight = GetScreenHeight()
        local screenWidth = GetScreenWidth()
        print("Screen Height: " .. screenHeight)
        print("Screen Width: " .. screenWidth)

        -- Create the main frame
        local mainFrame = CreateFrame("Frame", nil, UIParent)
        mainFrame:SetSize(800, 4)  -- Adjust height to 4 for 4 lines
        mainFrame:SetPoint("TOPLEFT")  
        mainFrame:SetFrameStrata("FULLSCREEN_DIALOG")

        -- Create 800 individual 1px wide textures for each of the 4 lines
        local blockTextWidth = 4
        local blockTextHeight = 600
        local blockTotaleSize = blockTextWidth * blockTextHeight
        local scalePerPixelWidth = screenWidth/800
        local scalePerPixelHeight = screenHeight/600
        print ("Scale per pixel width: "..scalePerPixelWidth)
        print ("Scale per pixel height: "..scalePerPixelHeight)
        local textures = {}
        for line = 0, blockTextHeight-1 do  -- Loop for 4 lines
            for column = 0, blockTextWidth-1 do
                local texture = mainFrame:CreateTexture()
                texture:SetSize(scalePerPixelWidth, scalePerPixelHeight)  -- Scale size for each texture
                texture:SetPoint("TOPLEFT", mainFrame, "TOPLEFT",
                (column ) * scalePerPixelWidth,
                -(line) * scalePerPixelHeight) 

                if line == 1 then
                    texture:SetColorTexture(1, 0, 1)  -- Set texture color (Red for demonstration)
                elseif line == 2 then
                    texture:SetColorTexture(0, 1, 0)  -- Set texture color (Green for demonstration)
                elseif line == 3 then
                    texture:SetColorTexture(0, 0, 1)  -- Set texture color (Blue for demonstration)
                else
                    texture:SetColorTexture(1, 1, 1)  -- Set texture color (White for demonstration)
                end
                table.insert(textures, texture)  -- Store the texture in a table
            end
        end

        -- Define a variable for time or animation effect
        local timeElapsed = 0

        -- Update function that runs every frame
        mainFrame:SetScript("OnUpdate", function(self, elapsed)
            local textToDisplayAsColor ="  "..(StaticMetaInfo and StaticMetaInfo.text or "No text")  -- Get the text to display as color
            --textToDisplayAsColor = "Bonjour, j'aime les frites."  -- Get the text to display as color
            timeElapsed = timeElapsed + elapsed  -- Increment the time elapsed since the last frame

            -- local maxTextSize =blockTotaleSize-1*3
            -- if #textToDisplayAsColor > maxTextSize then
            --     textToDisplayAsColor = string.sub(textToDisplayAsColor, 1, maxTextSize)  -- Limit the text to 800 characters
            -- end


            --print("Count ".. #textToDisplayAsColor)
            if timeElapsed > 0.1 then 
                local textLength = #textToDisplayAsColor  -- Get the length of the text in UTF-8 characters using WoW API
                --print("Text and array size "..textLength.." "..arraySize)
                for i=1, blockTotaleSize do
                    local indexInArray = i
                    local indexInText = indexInArray*3
                    if (indexInText + 2) < textLength then
                        local r = string.byte(textToDisplayAsColor, indexInText) / 255
                        local g = string.byte(textToDisplayAsColor, indexInText + 1) / 255
                        local b = string.byte(textToDisplayAsColor, indexInText + 2) / 255
                        
                    
                        textures[indexInArray]:SetColorTexture(r, g, b)  -- Update the texture's color
                    else    
                        textures[indexInArray]:SetColorTexture(1, 0, 1)  -- Set texture color (White for demonstration)
                    end
                end
                timeElapsed = 0  -- Reset the time
            end
        end)

end

function getCoordinateColor()
    
    
    -- is in donjon
    local isInDonjon = IsInInstance()
    if isInDonjon then
        return 0, 0, 0, 0-- Return black if in an instance
    end

    local map = C_Map.GetBestMapForUnit("player");
    local pos = C_Map.GetPlayerMapPosition(map,"player");
    local posX,posY = pos:GetXY()
    local facing = (GetPlayerFacing() / (2*3.1418))
    
    
    return posX,posY,facing,1
end


function getPercentToF(valuePercent)
   
    if valuePercent<1.0/15.0 then return '0' end
    if valuePercent<2.0/15.0 then return '1' end
    if valuePercent<3.0/15.0 then return '2' end
    if valuePercent<4.0/15.0 then return '3' end
    if valuePercent<5.0/15.0 then return '4' end
    if valuePercent<6.0/15.0 then return '5' end
    if valuePercent<7.0/15.0 then return '6' end
    if valuePercent<8.0/15.0 then return '7' end
    if valuePercent<9.0/15.0 then return '8' end
    if valuePercent<10.0/15.0 then return '9' end
    if valuePercent<11.0/15.0 then return 'A' end
    if valuePercent<12.0/15.0 then return 'B' end
    if valuePercent<13.0/15.0 then return 'C' end
    if valuePercent<14.0/15.0 then return 'D' end
    if valuePercent<15.0/15.0 then return 'E' end
    return 'F'
end

function FF_To_Decimal(value)
    
 -- turn ff hexa to 255 decimal
    local decimalValue = tonumber(value, 16)
    if decimalValue == nil then
        return 0
    end
    return decimalValue

end

function FF_To_Percent(value)
    local decimalValue = FF_To_Decimal(value)
    return decimalValue / 255.0
end



function getPlayerAsColor(selection)
    local targetGUID = UnitGUID(selection)
    
    if not targetGUID then
        return 1, 1, 1, 1, 1, 1 -- white
    else
        local string_ffffffffffff = "000000000000"
        if not UnitIsPlayer(selection) then
            if targetGUID and targetGUID:find("Creature") then
                string_ffffffffffff = "FF0000000000"
                local unitType, zero, serverId, instanceId, zoneUid, npcId, spawnUid = strsplit("-", targetGUID)

                -- convert npcid in decimal to hexadecimal
                local idAsDecimal = tonumber(npcId, 10) or 0
                local hex = string.format("%x", idAsDecimal)

                -- copy from right to left characters to fill the string_ffffffffffff
                local hexLength = string.len(hex)
                local startIndex = 12 - hexLength
                string_ffffffffffff = string.sub(string_ffffffffffff, 1, startIndex) .. hex .. string.sub(string_ffffffffffff, startIndex + hexLength + 1)
                --print("GUID: " .. targetGUID .. " Hex: " .. string_ffffffffffff)
            end
            if targetGUID and targetGUID:find("Vehicle") then
                string_ffffffffffff = "FD0000000000"
            end
            if targetGUID and targetGUID:find("Pet") then
                string_ffffffffffff = "FE0000000000"
            end
        else
            string_ffffffffffff = string.lower(string.gsub(string.gsub(targetGUID, "-", ""), "Player", ""))
        end
        local hex = string.sub(string_ffffffffffff, 1, 12)
        local c1r = FF_To_Percent(string.sub(hex, 1, 2))
        local c1g = FF_To_Percent(string.sub(hex, 3, 4))
        local c1b = FF_To_Percent(string.sub(hex, 5, 6))
        local c2r = FF_To_Percent(string.sub(hex, 7, 8))
        local c2g = FF_To_Percent(string.sub(hex, 9, 10))
        local c2b = FF_To_Percent(string.sub(hex, 11, 12))

        return c1r, c1g, c1b, c2r, c2g, c2b
    end

    return 1, 1, 1, 1, 1, 1 -- white
end




function getPlayerAsColorFocus()
    return getPlayerAsColor("target")
end

function getPlayerAsColorCurrent()
    return getPlayerAsColor("player")
end


function getHealAndXp()
    
    local percentHealth = UnitHealth("player") / UnitHealthMax("player")

    local playerLevel = UnitLevel("player")/255.0 or 0 

    local xp = UnitXP("player")
    local percentXp = xp / UnitXPMax("player")
    
    return percentHealth, playerLevel   , percentXp
end

function getWorldPosition(trueXFalseY)
    local isInDonjon = IsInInstance()
    local px, py, pz = 0, 0, 0

    -- Fetch player position if not in an instance
    if not isInDonjon then
        py, px, pz = UnitPosition("player")
    end

    -- Choose the coordinate to encode (x or y)
    local coordinate = trueXFalseY and px or py
    local r, g, b = 0, 0, 0
    -- -347321 
    -- r =34
    -- g = 73
    -- b = 21
    -- if is negative r = r+100
    local isNegative = coordinate < 0
    --print ("Coordinate "..coordinate)
    coordinate = math.abs(coordinate)
    local b = math.floor(coordinate) %100 
    local g = math.floor(coordinate / 100.0)%100
    local r = math.floor(coordinate / 10000.0)%100
    if isNegative then
        r = r + 100
    end
    -- print ("RGB "..r.." "..g.." "..b)
    return r/255.0, g/255.0, b/255.0

end


function getPlayerPosition()
    -- Get player position and facing angle
    local mapID = C_Map.GetBestMapForUnit("player")
    if not mapID then
        return "Position: Unknown"
    end

    local position = C_Map.GetPlayerMapPosition(mapID, "player")
    if not position then
        return "Position: Unknown"
    end

    local x, y = position:GetXY()
    x = math.floor(x * 10000) / 100 -- Convert to percentage and round
    y = math.floor(y * 10000) / 100

    local isInDonjon = IsInInstance()
    local px, py, pz = 0, 0, 0
    if not isInDonjon then
        py, px, pz = UnitPosition("player")
    end

    local facing = GetPlayerFacing()
    if not facing then
        return string.format("X: %.2f, Y: %.2f, Angle: Unknown", x, y)
    end

    local angle = math.deg(facing)
    if angle < 0 then
        angle = angle + 360
    end

    local player_guid = UnitGUID("player")
    local split = { strsplit("-", player_guid or "") }
    local player_id = (split[2] or " ").."-"..(split[3] or " ")

    if displayPlayerId == true then
        return string.format("mX: %.2f, mY: %.2f\nwX: %.2f, wY: %.2f\nAngle: %.2f°\nID: %s", x, y, px, py, angle, player_id)
    else
        return string.format("mX: %.2f, mY: %.2f\nwX: %.2f, wY: %.2f\nAngle: %.2f°", x, y, px, py, angle)
    end
    -- Return formatted string
end














-------------------------------------- HERE
local cellHeightPercent = 0.125  -- 12.5% of screen height
local frameWidth = 25

-- Create a semi-transparent background frame covering the entire UIParent
local backgroundFrame = CreateFrame("Frame", "EloiLabBackgroundFrame", UIParent)
backgroundFrame:SetAllPoints(UIParent)
backgroundFrame:SetFrameStrata("BACKGROUND")
backgroundFrame:SetFrameLevel(0)

local bgTexture = backgroundFrame:CreateTexture(nil, "BACKGROUND")
bgTexture:SetAllPoints()
bgTexture:SetColorTexture(1, 0, 0, 0.1) -- Black with 80% opacity

-- Ensure innerBorderFrameHeight is set after borderFrame is initialized

-- Improved createColorFrame function for right-side color bars
local function createColorFrameRight(xOffset, yOffset, updateFunction)
    local frame = CreateFrame("Frame", nil, backgroundFrame)
    frame:SetSize(frameWidth, 10)
    frame:SetPoint("TOPRIGHT", backgroundFrame, "TOPRIGHT", xOffset, yOffset)
    frame:SetFrameStrata("TOOLTIP")
    frame:SetFrameLevel(GameTooltip:GetFrameLevel() + 10)

    local texture = frame:CreateTexture(nil, "BACKGROUND")
    texture:SetAllPoints()
    texture:SetColorTexture(1, 1, 1)

    frame:SetScript("OnUpdate", function(self, elapsed)
        local cellSize = (borderFrame:GetHeight() - 20) * cellHeightPercent
        if self:GetHeight() ~= cellSize then
            self:SetSize(frameWidth, cellSize)
            self:SetPoint("TOPRIGHT", backgroundFrame, "TOPRIGHT", xOffset,-10+( yOffset * cellSize))
        end

        local r, g, b = 1, 1, 1
        if type(updateFunction) == "function" then
            local rr, gg, bb = updateFunction()
            if tonumber(rr) then r = rr end
            if tonumber(gg) then g = gg end
            if tonumber(bb) then b = bb end
        end
        texture:SetColorTexture(r, g, b)
    end)

    return texture
end

local function createColorFrameLeft(xOffset, yOffset, updateFunction)
    local frame = CreateFrame("Frame", nil, backgroundFrame)
    frame:SetSize(frameWidth, 10)
    frame:SetPoint("TOPLEFT", backgroundFrame, "TOPLEFT", xOffset, yOffset)
    frame:SetFrameStrata("TOOLTIP")
    frame:SetFrameLevel(GameTooltip:GetFrameLevel() + 10)

    local texture = frame:CreateTexture(nil, "BACKGROUND")
    texture:SetAllPoints()
    texture:SetColorTexture(1, 1, 1)

    frame:SetScript("OnUpdate", function(self, elapsed)
        local cellSize = (borderFrame:GetHeight() - 20) * cellHeightPercent
        if self:GetHeight() ~= cellSize then
            self:SetSize(frameWidth, cellSize)
            self:SetPoint("TOPLEFT", backgroundFrame, "TOPLEFT", xOffset,-10+( yOffset * cellSize))
        end

        local r, g, b = 1, 1, 1
        if type(updateFunction) == "function" then
            local rr, gg, bb = updateFunction()
            if tonumber(rr) then r = rr end
            if tonumber(gg) then g = gg end
            if tonumber(bb) then b = bb end
        end
        texture:SetColorTexture(r, g, b)
    end)

    return texture
end

-- Position Color
createColorFrameRight(0, 0, getCoordinateColor)

-- World Position X
createColorFrameRight(0, -1 , function() return getWorldPosition(true) end)

-- World Position Y
createColorFrameRight(0, -2 , function() return getWorldPosition(false) end)

-- Heal and XP
createColorFrameRight(0, -3 , getHealAndXp)

-- Player ID Part One
createColorFrameRight(0, -6 , function()
    local r1, g1, b1 =  getPlayerAsColor("player")
    return r1, g1, b1
end)

-- Player ID Part Two
createColorFrameRight(0, -7 , function()
    local _, _, _, r2, g2, b2 = getPlayerAsColor("player")
    return r2, g2, b2
end)

-- Group life as f









-- Integer Action out
int_texture2 = createColorFrameRight(0, -4 , function()

    local playerLifePercent01 = UnitHealth("player") / UnitHealthMax("player")
    local partyLifePercent01 = UnitHealth("party1") / UnitHealthMax("party1")
    local partyLifePercent02 = UnitHealth("party2") / UnitHealthMax("party2")
    local partyLifePercent03 = UnitHealth("party3") / UnitHealthMax("party3")
    local partyLifePercent04 = UnitHealth("party4") / UnitHealthMax("party4")
    local petLifePercent01 = UnitHealth("pet") / UnitHealthMax("pet")
    
    local rFF = getPercentToF(playerLifePercent01)..getPercentToF(partyLifePercent01)
    local gFF = getPercentToF(partyLifePercent02)..getPercentToF(partyLifePercent03)
    local bFF = getPercentToF(partyLifePercent04)..getPercentToF(petLifePercent01)

    local fffff = rFF..gFF..bFF
    --print ("="..fffff)
    -- Placeholder for future implementation
    local r1 = FF_To_Percent(rFF)
    local g1 = FF_To_Percent(gFF)
    local b1 = FF_To_Percent(bFF)
    -- Add logic here to calculate r1, g1, b1


    return r1, g1, b1
end)













function unsigned_integer_to_rgb_bytes(value)
   
    local r = bit.band(value, 0xFF) / 255.0
    local g = bit.band(bit.rshift(value, 8), 0xFF) / 255.0
    local b = bit.band(bit.rshift(value, 16), 0xFF) / 255.0
--local r, g, b = unsigned_integer_to_rgb_bytes(last_push_integer)
    return r, g, b
end

int_texture1 = createColorFrameRight(0, -5 , function()
    local int_xp = UnitXP("player")
    local int_999999 = int_xp % 1000000
    local r_99 = math.floor(int_999999 / 10000) % 100
    local g_99 = math.floor(int_999999 / 100) % 100
    local b_99 = int_999999 % 100
    -- print("XP: " .. int_xp)
    --print("r: " .. r_999999 .. " g: " .. g_999999 .. " b: " .. b_999999)
    return r_99 / 255.0, g_99 / 255.0, b_99 / 255.0
end)


















local last_loot_opened_object_id_list={}
local last_loot_opened_object_id_focus = nil

local last_loot_opened_object_id_next_change =15

-- every second, check if object id in list to dequeue in focus
C_Timer.NewTicker(0.1, function()

    if last_loot_opened_object_id_next_change > 0 then
            last_loot_opened_object_id_next_change = last_loot_opened_object_id_next_change - 1
            return
    end

    local length = #last_loot_opened_object_id_list
    if length > 0 then
            last_loot_opened_object_id_focus = last_loot_opened_object_id_list[1]
            table.remove(last_loot_opened_object_id_list, 1) -- Remove the first element
            last_loot_opened_object_id_next_change= 15 -- Reset the next change timer
        
    else 
        last_loot_opened_object_id_focus = nil -- Reset focus if list is empty
        last_loot_opened_object_id_next_change=0
    end
end)

function getColorForLootObjectIdFocus()
    -- Get the color for the focused loot object ID
    if last_loot_opened_object_id_focus then

        return getColorForLootObjectId(last_loot_opened_object_id_focus)
    else
        return 0,0,0 -- Default to black if no focus
    end
end
function getColorForLootObjectId(objectId)
    if objectId==nil or not objectId or type(objectId) ~= "number" then
        return 0,0,0 -- Default to black if no valid object ID
    end
    if objectId > 16777215 then
        return 1, 0, 0 -- Red for invalid object ID
    end
    -- Convert the object ID to a color
    local r = (objectId % 256) / 255.0
    local g = (math.floor(objectId / 256) % 256) / 255.0
    local b = (math.floor(objectId / (256 * 256)) % 256) / 255.0
    return r, g, b
end


createColorFrameLeft(0, -4 , function()
    return getColorForLootObjectIdFocus()
end)



createColorFrameLeft(0, -0 , function()
    return 0,1,0
end) 
createColorFrameLeft(0, -1 , function()
    return 0,1,0
end)

 


createColorFrameLeft(0, -6 , function()
    local r, g, b, _, _, _ = getPlayerAsColorFocus()
    return r, g, b
end)

createColorFrameLeft(0, -7 , function()
    local _, _, _, r, g, b = getPlayerAsColorFocus()
    return r, g, b
end)






createColorFrameLeft(0, -5 , function()
    local targetLifePercent01 = UnitHealth("target") / UnitHealthMax("target")
    local targetLevel = UnitLevel("target") /255.0
    local targetPower = UnitPower("target") / UnitPowerMax("target")
    -- local targetLoadingPower = (UnitCastingInfo("target") or UnitChannelInfo("target")) and 9 or 0
    -- local bFF = getPercentToF(targetPower)..getPercentToF(targetLoadingPower)
    local r1 = targetLifePercent01
    local g1 =  targetLevel
    local b1 = targetPower
    return r1, g1, b1
end)




index_integer_texture=0
last_push_integer=0
function push_out_integer_as_color(value)
    if value<0 then
        value = -value
    end

    last_push_integer = value
    local r, g, b = unsigned_integer_to_rgb_bytes(value)
    index_integer_texture = index_integer_texture + 1
    int_texture1:SetColorTexture(r, g, b)
    
end

function push_out_random_integer_as_color()
   
    local int = math.random(0, 16777215) -- Random integer between 0 and 16777215 (0xFFFFFF)
    push_out_integer_as_color(int)
end


-- Function to execute every 0.1 seconds
function periodicCheck()
    --push_out_random_integer_as_color()
    push_out_integer_as_color(-2501)
end

-- Set up a timer to call the function every 0.1 seconds
C_Timer.NewTicker(10, periodicCheck)

local withdPercentTextCoord =0.6
local heightPercentTextCoord =0.1

-- Create a frame to display player position
local positionFrame = CreateFrame("Frame", "PositionFrame", UIParent)
positionFrame:SetSize(GetScreenWidth() * withdPercentTextCoord, UIParent:GetHeight() * heightPercentTextCoord)
positionFrame:SetPoint("TOP", 0, -10)




-- Add an EditBox to the frame for text display
positionFrame.editBox = CreateFrame("EditBox", nil, positionFrame)
positionFrame.editBox:SetAllPoints(true)
positionFrame.editBox:SetMultiLine(true)
positionFrame.editBox:SetAutoFocus(false)
positionFrame.editBox:SetFont("Fonts\\FRIZQT__.TTF", 36, "OUTLINE")
positionFrame.editBox:SetJustifyH("CENTER")
positionFrame.editBox:EnableMouse(fales)  -- Enable mouse for the EditBox
positionFrame.editBox:SetScript("OnEscapePressed", function() positionFrame:Hide() end)

-- Function to set text in the EditBox
positionFrame.SetText = function(self, text)
    self.editBox:SetText(text)
    self.editBox:SetTextColor(1, 0, 0)  -- Set text color to red
end


-- Update the position text every frame
positionFrame:SetScript("OnUpdate", function(self, elapsed)
    self:SetText(getPlayerPosition())
end)

-- Show the frame
positionFrame:Show()





--------------------COLOR STOP
-- local textExport = "Bonjour, j'aime les frites."
-- local numPixelsPerRow = 800  -- Pixels per row
-- local textMaxSize= numberPixelsPerRow*3
-- local numRows = 3  -- Number of rows

-- local pixels = {}  -- Store pixel frames

-- -- Create pixels
-- for row = 0, numRows - 1 do
--     for i = 0, numPixelsPerRow - 1 do
--         local pixel = CreateFrame("Frame", nil, UIParent)
--         pixel:SetSize(1, 1)  -- Keep size 1x1
--         pixel:SetPoint("TOPLEFT", UIParent, "TOPLEFT", i, -row)  -- Position in grid
--         pixel:SetFrameStrata("TOOLTIP")  -- Set to highest priority

--         local texture = pixel:CreateTexture(nil, "ARTWORK")
--         texture:SetAllPoints()
--         pixel.texture = texture  -- Store reference for updates

--         table.insert(pixels, pixel)  -- Store in table
--     end
-- end

-- -- Function to update pixels every frame
-- local function UpdatePixels(self, elapsed)
--     for _, pixel in pairs(pixels) do
--         pixel.texture:SetColorTexture(math.random(), math.random(), math.random(), 1)  -- Random color
--     end
-- end





    -- Create an updater frame
    local updater = CreateFrame("Frame")
    updater:SetFrameStrata("TOOLTIP")  -- Highest priority for updater too


    updater:SetScript("OnUpdate", UpdatePixels)  -- Runs UpdatePixels every frame

------------------- COLOREND

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
            local displayGameIn=false
            if displayGameIn then
            DebugMemoryTextFrame:SetTextContent("GATE IN:\n"..gateInReceived .."\n\n\nGATE OUT:\n"..StaticMetaInfo.text )
            else
                DebugMemoryTextFrame:SetTextContent("\n\n"..StaticMetaInfo.text )
            end
            
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
    ELP.Print("Read me: https://github.com/EloiStree/2024_01_18_EloiLabWowAddon");
    ELP.EndLine("Cmd: /elhelp ");
end
    --||||||||    MANAGE SHORTCUT |||||||||
SLASH_ELOILABLIST1 = "/elhelp";
function SlashCmdList.ELOILABLIST(msg)

    ELP.Print("Read me: https://github.com/EloiStree/2024_01_18_EloiLabWowAddon");
    ELP.EndLine("- /elwrite : write a note to keep between players");
    ELP.EndLine("- /elshow : show info");
    ELP.EndLine("- /elhide : hide info");
    ELP.EndLine("- /elserver eu|us|?? : Set the server you are on for link generation");
    ELP.EndLine("- /elplayerinfoappend : Append in the clipboard information about the target and mouseover")
    ELP.EndLine("- /elplayerinfo : Set in the clipboard information about the target and mouseover")
    ELP.EndLine("- /elrtfm: Give links to \"Read the fucking manual\". :)- ")
    ELP.EndLine("MEMORY EXPORT (Advance topic)")
    ELP.EndLine("- /elcheck : display memory state");
    ELP.EndLine("- /elstart : Start to work and continue when you reload");
    ELP.EndLine("- /elstop : Stop to work and need start to continue after reload");
    ELP.EndLine("- /eltag : Put that address tag in the memory");
    ELP.EndLine("- /elindex : Put the index Tag in the memory");
    ELP.EndLine("- /eltype : Put the type in the memory");
    ELP.EndLine("- /elvalue : Put the value in the memory");
    ELP.EndLine("- /elautotagon : While modulo around 4 tag type value");
    ELP.EndLine("- /elautotagoff : Stop debug mode (require manual now)");

    
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
    ELP.Print("Anti-Bot RTFM: github.com/EloiStree/HelloWarcraftQAXR/issues?q=Anti-Bot\n" )
    ELP.EndLine("Code Addons: https://github.com/EloiStree/2024_01_18_EloiLabWowAddon\n")
    ELP.EndLine("Code Memory Reader: https://github.com/EloiStree/2023_12_31_ReadMemoryOfWow\n")
end




SLASH_ELOILABELOISETUP1 = "/eloisetup";
function SlashCmdList.ELOILABELOISETUP(msg)
    QuickTestRef.start()
end


SLASH_ELOILABELOIEDITLUAPRINT1 = "/eluaprintreturn";
function SlashCmdList.ELOILABELOIEDITLUAPRINT(msg)
    
    if msg==nil or msg=="" then
        ELP.Print("No code to execute")
        return
    else 
        ELP.Print(">"..ExecuteCodeAndPrintResult(msg))
        return 
    end

    --print(("Try Start"))
    ELP.Print(">"..ExecuteCodeAndPrintResult(ClipboardFunction:GetText()))
    --print(("Try End"))
end


SLASH_ELOILABELOIEDITLUA1 = "/elua";
function SlashCmdList.ELOILABELOIEDITLUA(msg)
    
    if msg==nil or msg=="" then
        ELP.Print("No code to execute")
        return
    else 
        ELP.Print(">"..ExecuteCodeAndPrintResult(msg))
        return 
    end

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

  
--

--------------------------------------------------------------------------[[
local fontPath = "Interface\\AddOns\\EloiLab\\Fonts\\free3of9.ttf"

-- Create the frame
local frameCode = CreateFrame("Frame", "BarcodeFrame", UIParent)
frameCode:SetSize(300, 60) -- 30% of screen width
frameCode:SetPoint("TOPLEFT", 30, -5) -- Position at top-left corner with 10px offset
frameCode:Show()

-- -- Background (optional)
frameCode.bg = frameCode:CreateTexture(nil, "BACKGROUND")
frameCode.bg:SetAllPoints()
frameCode.bg:SetColorTexture(1, 1, 1, 1) -- Slightly transparent white background

-- -- Create the text
frameCode.text = frameCode:CreateFontString(nil, "OVERLAY")
frameCode.text:SetFont(fontPath, 48, "") -- Use the font without additional effects
frameCode.text:SetText("Hello World 42 2501")
frameCode.text:SetTextColor(0, 0, 0) -- Set text color to black
frameCode.text:SetPoint("CENTER")

-- -- Add text in frameCode with total width and 5-pixel height
local textHeight = 12 -- Adjusted for better readability
local textWidth = frameCode:GetWidth()
local textString = frameCode:CreateFontString(nil, "OVERLAY")
textString:SetFont("Fonts\\ARIALN.TTF", textHeight) -- Using a more readable font
textString:SetPoint("TOP", frameCode, "TOP", 0, -5)
textString:SetText("Sample Text")
textString:SetTextColor(0, 0, 0, 1) -- Black color for the text



-- Adjust text width to fit within the frame
frameCode.text:SetWidth(frameCode:GetWidth() - 20) -- Add padding
frameCode.text:SetWordWrap(false) -- Disable word wrapping

-- Function to encode text into Code 128 format
local function encodeToBarcodeTFB(input)
    input = input:gsub(" ", "") -- Remove spaces from the input string
    input = input:gsub("-", "") -- Remove hyphens from the input string
    
    return '*'..input..'*'
end

-- Update the text every 0.5 seconds with the target's GUID info
C_Timer.NewTicker(0.5, function()
    if not frameCode or not frameCode.text then
        print("Error: frameCode or frameCode.text is not initialized.")
        return
    end
    local playerId = UnitGUID("player")
    local targetGUID = UnitGUID("mouseover") or UnitGUID("target")
    local isPlayer = UnitIsPlayer("mouseover") or UnitIsPlayer("target")

    

    if targetGUID and playerId ~= targetGUID and isPlayer then
        local encodedText = encodeToBarcodeTFB(targetGUID:gsub("Player%-", ""))

        textString:SetText("Code 39: " .. targetGUID) 

        frameCode.text:SetText(encodedText) 
        frameCode:Show()
    else
        frameCode:Hide()
    end
end)

-- MyAddon.lua

-- Create a frame
local LogoImage = CreateFrame("Frame", "LogoImage", UIParent)
LogoImage:SetSize(32, 32)
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

LogoImage:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -42, -42)

-- Set the strata and level
LogoImage:SetFrameStrata("HIGH")  -- Set the strata to "HIGH" to place it above most UI elements
LogoImage:SetFrameLevel(100)  -- Set the level to a high value

-- Set a tooltip for the image
LogoImage:SetScript("OnEnter", function(self)
    isMouseOverLogo=true
    GameTooltip:SetOwner(self, "ANCHOR_TOP")
    GameTooltip:SetText("Click L:Clear | M:Discord | R: Code | Both: Toggle Text")
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
        elseif isMouseMiddleOn then
            ClipboardFunction:SetText("Discord:\nhttps://discord.gg/WnmXsXHbSn")
        elseif isMouseLeftOn then
            LuaText.clipboardtext=""
            ClipboardFunction:SetText("")

        end
    else

        if isMouseRightOn then
            ClipboardFunction:SetText("Code:\nhttps://github.com/EloiStree/2024_01_18_EloiLabWowAddon")
         end 
        if isMouseMiddleOn then
            ClipboardFunction:SetText("Discord:\nhttps://discord.gg/WnmXsXHbSn")
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





-- local iconChanger = CreateFrame("Frame")
-- iconChanger:RegisterEvent("PLAYER_LOGIN")
-- iconChanger:RegisterEvent("MINIMAP_UPDATE_TRACKING")

-- local function UpdateTrackingIcon()
--     for i = 1, GetNumTrackingTypes() do
--         local name, texture, active, category = GetTrackingInfo(i)

--         if active and name then
--             if name:lower():find("herb") then
--                 MiniMapTrackingIcon:SetTexture("Interface\\AddOns\\EloiLab\\Images\\SquareYellow.tga")
--                 return
--             elseif name:lower():find("mineral") then
--                 MiniMapTrackingIcon:SetTexture("Interface\\AddOns\\EloiLab\\Images\\SquareYellow.tga")
--                 return
--             end
--         end
--     end
-- end

-- iconChanger:SetScript("OnEvent", function(self, event, ...)
--     if event == "PLAYER_LOGIN" or event == "MINIMAP_UPDATE_TRACKING" then
--         UpdateTrackingIcon()
--     end
-- end)


local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")

f:SetScript("OnEvent", function()
    if _G.PinkMinimapBorder then return end

    local border = CreateFrame("Frame", "PinkMinimapBorder", Minimap)
    border:SetAllPoints(Minimap)
    border:SetFrameStrata("MEDIUM")

    local thickness = 3

    -- Top
    local top = border:CreateTexture(nil, "OVERLAY")
    top:SetColorTexture(colorMapBorder.r, colorMapBorder.g, colorMapBorder.b, colorMapBorder.a)
    top:SetPoint("TOPLEFT", -thickness, thickness)
    top:SetPoint("TOPRIGHT", thickness, thickness)
    top:SetHeight(thickness)

    -- Bottom
    local bottom = border:CreateTexture(nil, "OVERLAY")
    bottom:SetColorTexture(colorMapBorder.r, colorMapBorder.g, colorMapBorder.b, colorMapBorder.a)
    bottom:SetPoint("BOTTOMLEFT", -thickness, -thickness)
    bottom:SetPoint("BOTTOMRIGHT", thickness, -thickness)
    bottom:SetHeight(thickness)

    -- Left
    local left = border:CreateTexture(nil, "OVERLAY")
    left:SetColorTexture(colorMapBorder.r, colorMapBorder.g, colorMapBorder.b, colorMapBorder.a)
    left:SetPoint("TOPLEFT", -thickness, thickness)
    left:SetPoint("BOTTOMLEFT", -thickness, -thickness)
    left:SetWidth(thickness)

    -- Right
    local right = border:CreateTexture(nil, "OVERLAY")
    right:SetColorTexture(colorMapBorder.r, colorMapBorder.g, colorMapBorder.b, colorMapBorder.a)
    right:SetPoint("TOPRIGHT", thickness, thickness)
    right:SetPoint("BOTTOMRIGHT", thickness, -thickness)
    right:SetWidth(thickness)
end)


-- add a pink square of 2 or 3 pixels in the middle of the minimap
local pinkSquare = CreateFrame("Frame", "PinkMinimapSquare", Minimap)
pinkSquare:SetSize(3, 3) -- Set size to 3x3 pixels
pinkSquare:SetPoint("CENTER", Minimap, "CENTER")
local pinkSquareTexture = pinkSquare:CreateTexture(nil, "OVERLAY")
pinkSquareTexture:SetColorTexture(colorMapBorder.r, colorMapBorder.g, colorMapBorder.b, colorMapBorder.a) -- Pink color
pinkSquareTexture:SetAllPoints(pinkSquare) -- Make the texture fill the frame






















local f = CreateFrame("Frame")

-- Listen for the loot opened event
f:RegisterEvent("LOOT_OPENED")

f:SetScript("OnEvent", function(self, event, ...)
    if event == "LOOT_OPENED" then
        local autoLoot = ...
        local sourceGUID = GetLootSourceInfo(1) -- Get first loot slot source GUID
        
        if sourceGUID then
            print("Loot received from GUID:", sourceGUID)
        else
            print("No source GUID found.")
        end
    end
end)

local f = CreateFrame("Frame")
f:RegisterEvent("LOOT_OPENED")

-- Example lists — extend as needed
local miningNodeIDs = {
    [1731] = true,   -- Copper Vein
    [1732] = true,   -- Tin Vein
    [2040] = true,   -- Mithril Deposit
    [175404] = true, -- Rich Thorium Vein
    -- Add more mining node object IDs
}

local herbNodeIDs = {
    [1617] = true,   -- Silverleaf
    [1618] = true,   -- Peacebloom
    [2041] = true,   -- Liferoot
    [142142] = true, -- Sungrass
    -- Add more herb node object IDs
}

local function getObjectIDFromGUID(guid)
    local parts = { strsplit("-", guid) }
    return tonumber(parts[6]) -- 6th part is the objectID
end

f:SetScript("OnEvent", function(self, event, ...)
    if event == "LOOT_OPENED" then
        for i = 1, GetNumLootItems() do
            local guid = GetLootSourceInfo(i)
            if guid then
                local guidType = strsplit("-", guid)
                if guidType == "GameObject" then
                    local objectID = getObjectIDFromGUID(guid)
                    -- add to list last_loot_opened_object_id_list
                    
                    table.insert(last_loot_opened_object_id_list, objectID)
                    
                    if miningNodeIDs[objectID] then
                        print("Mined node (ID:", objectID, ")")
                    elseif herbNodeIDs[objectID] then
                        print("Herb gathered (ID:", objectID, ")")
                    else
                        print("Gathered unknown object (ID:", objectID, ")")
                    end
                end
            end
        end
    end
end)




function IsCastingEquals(s)
    local castName, _, _, _, _, _, spellID = UnitCastingInfo("player")
    -- trim
    s = trimString(s)
    castName = castName and trimString(castName) or ""

    if castName == s then
        return true
    end
    return false
end

function IsGatheringHerbs()
    return IsCastingEquals("Herb Gathering ") -- Replace with actual herb gathering spell names/IDs
end

function IsGatheringMining()
    return IsCastingEquals("Mining") -- Replace with actual mining spell names/IDs
end

function IsFishing()
    return IsCastingEquals("Fishing") -- Replace with actual fishing spell names/IDs
end


function IsPlayerInCombat()
    return UnitAffectingCombat("player")
end


function IsPlayerSwimming()
    return IsSwimming() or IsSubmerged()
end

function IsPlayerFalling()
    return IsFalling()

end

function IsPlayerMounted()
    return IsMounted()
end

function IsPlayerFlying()
    return IsFlying() 
end

function IsPlayerBeathingUnderwater()
    return  IsSubmerged()
end


function HasTarget()
    return UnitExists("target") and not UnitIsDeadOrGhost("target")
end



function IsPlayerSteathing()
    return IsStealthed()
end

function IsUnderWater()
    return IsSwimming() and IsSubmerged()
end

function IsPlayerDeath()
    return UnitIsDeadOrGhost("player")
end

function IsCasting()
    return UnitCastingInfo("player") ~= nil
end

function turn_to_rgb24_bit_left_right(bitsArrayOf24MaxLenght, debugPreviousState)
    local red = 0
    local green = 0
    local blue = 0
    local isState = ""

    local bitsLenght = #bitsArrayOf24MaxLenght
    for i = 1, 24 do
        if i <= bitsLenght then
            isState = isState .. ((bitsArrayOf24MaxLenght[i] == 1 or bitsArrayOf24MaxLenght[i] == true) and "1" or "0")
        else
            isState = isState .. "0"
        end
    end

    for i = 1, 24 do
        local bitValue = bitsArrayOf24MaxLenght[i] or 0
        if bitValue == 1 or bitValue == true then
            if i == 1 then red = red + 128 end
            if i == 2 then red = red + 64 end
            if i == 3 then red = red + 32 end
            if i == 4 then red = red + 16 end
            if i == 5 then red = red + 8 end
            if i == 6 then red = red + 4 end
            if i == 7 then red = red + 2 end
            if i == 8 then red = red + 1 end

            if i == 9 then green = green + 128 end
            if i == 10 then green = green + 64 end
            if i == 11 then green = green + 32 end
            if i == 12 then green = green + 16 end
            if i == 13 then green = green + 8 end
            if i == 14 then green = green + 4 end
            if i == 15 then green = green + 2 end
            if i == 16 then green = green + 1 end

            if i == 17 then blue = blue + 128 end
            if i == 18 then blue = blue + 64 end
            if i == 19 then blue = blue + 32 end
            if i == 20 then blue = blue + 16 end
            if i == 21 then blue = blue + 8 end
            if i == 22 then blue = blue + 4 end
            if i == 23 then blue = blue + 2 end
            if i == 24 then blue = blue + 1 end
        end
    end
    red = red / 255
    green = green / 255
    blue = blue / 255
  

    if debugPreviousState ~= isState then
        debugPreviousState = isState
        
        bool_debug = true
        if bool_debug then
           
            print("New State: " .. isState)
        end
    end

    return red, green, blue, debugPreviousState
end

local function IsOnGround()
    return not IsFlying() and not IsFalling() and not IsSwimming() and not UnitOnTaxi("player")
end


local MIRRORTIMER_NUMTIMERS = 3  -- As of WoW 3.2, there are 3 possible mirror timers

-- Constants for mirror timer types (these are the strings returned by GetMirrorTimerInfo)
local TIMER_BREATH = "BREATH"
local TIMER_FATIGUE = "EXHAUSTION"  -- Note: The game calls it "EXHAUSTION" but it's the fatigue mechanic

local function GetMirrorTimerData(timerType)
    for i = 1, MIRRORTIMER_NUMTIMERS do
        local timer, initial, maxvalue, scale, paused, label = GetMirrorTimerInfo(i)
        if timer == timerType then
            return {
                current = GetMirrorTimerProgress(timer),
                max = maxvalue,
                paused = paused,
                label = label,
                initial = initial,
                scale = scale
            }
        end
    end
    return nil  -- Timer not active
end

local function GetBreathingPercent()
    local timerData = GetMirrorTimerData(TIMER_BREATH)
    if not timerData then
        return 100.0  -- Not underwater, consider breath full
    end
    return (timerData.current / timerData.max) * 100.0
end

local function GetFatiguePercent()
    local timerData = GetMirrorTimerData(TIMER_FATIGUE)
    if not timerData then
        return 100.0  -- No fatigue active, consider full
    end
    return (timerData.current / timerData.max) * 100.0
end

local function IsUnderPercentBreathing(value)
    if type(value) ~= "number" then
        error("IsUnderPercentBreathing: value must be a number")
    end
    local breathingPercent = GetBreathingPercent()
    return breathingPercent < value
end

local function IsUnderPercentFatigue(value)
    if type(value) ~= "number" then
        error("IsUnderPercentFatigue: value must be a number")
    end
    local fatiguePercent = GetFatiguePercent()
    return fatiguePercent < value
end




local function IsEnemyOneTargetingPlayer()


    if not UnitExists("player") then return false end
    local playerGUID = UnitGUID("player")
    if not playerGUID then return false end

    for i = 1, 40 do
        local unit = "nameplate"..i
        if UnitExists(unit) and UnitCanAttack("player", unit) then
            local targetGUID = UnitGUID(unit.."target")
            if targetGUID == playerGUID then
                return true
            end
        end
    end

    return false
end




local frame = CreateFrame("Frame")
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

frame:SetScript("OnEvent", function()
    local timestamp, subevent, _, sourceGUID, sourceName, _, _, destGUID, destName, _, _, spellId, spellName = CombatLogGetCurrentEventInfo()
    
    if destName == UnitName("player") then
        print(sourceName .. " used " .. spellName .. " on you!")
    end
end)


local function IsPetAlive()
    return UnitExists("pet") and not UnitIsDeadOrGhost("pet")
end




local previou24BitsMovingState = ""
-- Player state
createColorFrameLeft(0, -3, function()
  
   red,green,blue, previou24BitsMovingState = turn_to_rgb24_bit_left_right({
        IsCasting() and 1 or 0,                 -- 1 DONT CHANGE
        IsGatheringHerbs() and 1 or 0,          -- 2 DONT CHANGE
        IsGatheringMining() and 1 or 0,         -- 3 DONT CHANGE
        IsFishing() and 1 or 0,                 -- 4 DONT CHANGE
        IsOnGround() and 1 or 0,                -- 5 DONT CHANGE
        IsPlayerInCombat() and 1 or 0,          -- 6 DONT CHANGE
        IsPlayerMounted() and 1 or 0,           -- 7 DONT CHANGE
        IsPlayerFlying() and 1 or 0,            -- 8 DONT CHANGE
        IsPlayerFalling() and 1 or 0,           -- 9 DONT CHANGE
        IsPlayerSwimming() and 1 or 0,          -- 10 DONT CHANGE
        IsPlayerSteathing() and 1 or 0,         -- 11 DONT CHANGE
        IsPlayerDeath() and 1 or 0,             -- 12 DONT CHANGE
        IsUnderPercentBreathing(98) and 1 or 0,     -- 13 DONT CHANGE
        IsUnderPercentBreathing(20) and 1 or 0,     -- 14 DONT CHANGE
        IsUnderPercentFatigue(98) and 1 or 0,      -- 15 DONT CHANGE
        IsUnderPercentFatigue(20) and 1 or 0,      -- 16 DONT CHANGE
        HasDiscoveredZoneLastSeconds(1.5)  and 1 or 0, -- 17 DONT CHANGE
        IsPetAlive() and 1 or 0 , -- 18
        0 , -- 19
        0 , -- 20
        0 , -- 21
        0 , -- 22
        0 , -- 23
        0  -- 24
        
    }, previou24BitsMovingState)

    return red, green, blue
end)















-- Check if target has a debuff called "Corruption" using AuraUtil.FindAuraByName
local function IsTargetHasDebuff(debuffName)
    if not UnitExists("target") then return false end
    local aura = AuraUtil.FindAuraByName(debuffName, "target", "HARMFUL")
    return aura ~= nil
end


function HasTarget()
    return UnitExists("target") and not UnitIsDeadOrGhost("target")
end

function IsTargetPlayer()
    return UnitIsPlayer("target")
end
function IsTargetEnemy()
    return UnitCanAttack("player", "target")
end


function IsTargetHasCorruption()
    return IsTargetHasDebuff("Corruption")
end

function IsTargetHasAgony()
    return IsTargetHasDebuff("Agony") 
end


function IsTargetInCombat()
    return UnitAffectingCombat("target")
end
function IsTargetCasting()
    return UnitCastingInfo("target") ~= nil
end
function IsTargetDeath()
    return UnitIsDeadOrGhost("target")
end
function IsTargetFullLife()

    if not UnitExists("target") then return false end
    if not UnitHealthMax("target") or not UnitHealth("target") then return false end                                                                                                                    

    return UnitHealth("target") == UnitHealthMax("target")
end


function IsTargetInRange()                                                                          
    return UnitInRange("target") 
end

local function IsTargetWithinYards(value)
    local unit = "target"
    if UnitExists(unit) then
        return CheckInteractDistance(unit, value) -- 2 means ~10 yards
    else
        return false
    end
end
local function IsTargetWithin10Yards()
    return IsTargetWithinYards(2) or IsTargetWithinYards(3) 
end
local function IsTargetWithin30Yards()
    return IsTargetWithinYards(1) or IsTargetWithinYards(4)
end


local function IsGlobalCooldownActive()

    local spellID = 61304 
    local start, duration, enable = C_Spell.GetSpellCooldown(spellID)

    return enable == 1 
end


local function IsTargetFocusingPlayer()                                                                                                                                                                        
    if not UnitExists("target") then return false end
    local targetGUID = UnitGUID("target")
    local playerGUID = UnitGUID("player")
    if not targetGUID or not playerGUID then return false end

    local focusUnit = "focus"
    if UnitExists(focusUnit) and UnitGUID(focusUnit) == targetGUID then
        return true
    end                                                                                                                                                                     

    return false
end                                                                             





















local previou24BitsAttackState = ""
-- Target State Demoniste
createColorFrameLeft(0, -2, function()


    red, green, blue, previou24BitsAttackState =
    turn_to_rgb24_bit_left_right({
        -- RED
        HasTarget() and 1 or 0,                   --1 DONT CHANGE
        IsTargetPlayer() and 1 or 0,   --2 DONT CHANGE
        IsTargetEnemy() and 1 or 0,   --3  DONT CHANGE
        IsTargetInCombat() and 1 or 0,   --4  DONT CHANGE
        IsTargetCasting() and 1 or 0,   --5 DONT CHANGE
        IsTargetDeath() and 1 or 0,   --6 DONT CHANGE
        -- Green   --
        IsTargetFullLife() and 1 or 0,   --7 DONT CHANGE
        IsTargetWithin10Yards() and 1 or 0,   --8 DONT CHANGE
        IsTargetWithin30Yards() and 1 or 0,   --9 DONT CHANGE
        IsTargetFocusingPlayer() and 1 or 0,   --10 DONT CHANGE
        0,   --11
        0,   --12
        0,   --13
        0,   --14
        0,   --15
        0,   --16
        -- Blue   --
        IsGlobalCooldownActive() and 1 or 0 ,   --17 DONT CHANGE
        0,   --18
        0,   --19
        0,   --20
        0,   --21
        0,   --22
        IsTargetHasCorruption() and 1 or 0,   --23 DONT CHANGE
        IsTargetHasAgony() and 1 or 0,     --24 DONT CHANGE

    },previou24BitsAttackState)
    return red, green, blue
end)



