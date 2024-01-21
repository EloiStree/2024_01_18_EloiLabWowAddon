

--||||||||      MANAGER OF THE TEXT TO MEMORY WITH MOD      |||||||||


--USE THIS VALUE TO FIND ALL THE ADDRESS OF THIS ADDON
-- ALLOW TO TOUCH
tagInjectionGeneric=1231231

--BE CAREFUL WITH THIS ONE DONT USE TO MUCH
-- ALLOW TO TOUCH
maxtextvalue =4000



-- USE TO GIVE SOME TYPE CONTEXT TO VALUE STORE IN MEMORY
Type_0_Unkown=0
Type_1_Char=1
Type_2_Unkown=2
Type_3_OnChanged=3
Type_4_AddonsState=4
Type_5_DoubleValue=5
Type_6_DummyBoolean=6
Type_7_BitBoolean=7
Type_8_Bit0To9=8
Type_9_FiveCharInDouble=9

Mod_0_Tag=0
Mod_1_Type=1
Mod_2_Index=2
Mod_3_Value=3

-------- ARRAYS TO USE
-- STORE THE ADDON STATE IF SOME NEED TO READ IT 
AddonStateInMemory = {}
-- ARRAY USE TO STORE THE TEXT TO MEMORY
TextInMemory={}
-- STORE THE METHODE THAT MANAGE THE TEXT TO MEMORY
MemoryFunction={}

-- STORE THE METHODE THAT MANAGE THE TEXT TO MEMORY
EventArray={}

-------- ARRAYS INIT
EventArray.onChangedValue=0
AddonStateInMemory[0]=0

------SOME STANDARD FIXED BY THE DEVELOPER.
-- Tag mode type ID
--// TAG Index Type Value
--// Tyoe=0 Reserver for later
--// Tyoe=1 Char 00000255
--// Tyoe=2 Reserver for later
--// Type=3 OnChange RandomValue 54645  // This address change every time a value changed. 
--// Type=4 Addons State Value  99990000012  // Value that allow 
--// Type=5 Double  546541681814684618
--// Type=6 DummyBoolean // True or false store in a double losing lot's of space 000000000001
--// Type=7 BitBoolean // A double where every 1 0 are boolean  10100101
--// Type=8 Bit0To9 // A double where every 0-9 are short value between 0-9   21646103
--// Type=9 Double Five Char 0.1234567812345678
--// Type=10N = Custom value in double to be parse by other developers
-- '0': return "Tag";
-- '1': return "Type";
-- '2': return "Index";
-- '3': return "Value";



--TICK USE TO DEBUG WITH AUTO TICK TAG
-- DONT TOUCH
useAddressTagInjection=true;
tickModulo=4
tickRangeInSecond=6
tickId=1


MemoryFunction.BeforeGetCustomText= function ()
    --print("BeforeGetCustomText()")

end

MemoryFunction.AfterGetCustomText= function(text)
    --print("AfterGetCustomText()")
    print ("D:"..(text==nil and text or "Null"))


    RefreshTheTickValue()
    --Reset all to 0
    --SetTextMemoryToZero(0)
    if(MEMO.GET_USEDEBUGAUTORUNTAG())then
        SetTagWithTick()
    end

    if MEMO.IsTagMode("Tag") then
        SetAllTextMemoryToValueFloored(tagInjectionGeneric)
    elseif MEMO.IsTagMode("Index") then
        SetAllTextMemoryToIndex()
    elseif MEMO.IsTagMode("Type") then
        SetAllTextMemoryToValueFloored(Type_1_Char)
    else
        SetMemoryTextWithGivenString(text)
    end

    -- Notify THAT SOME VALUE CHANGED
    SetHasChangedIncrement()
    RefreshOnChangedAddress()

    -- ADDON STATE ALLOWS TO KNOW WHERE WE ARE IN THE ADDON FROM OUTSIDE
    RefreshAddonStateAndUpdateOnChanged()
    
    print("CustomText Pushed")

end

function RefreshTheTickValue()
    local time= GetTime()
    tickId =math.floor((time/tickRangeInSecond)%tickModulo)
end

function SetTagWithTick()

    if tickId==0 then MEMO.SetTagMode("Tag") 
    elseif tickId==1 then  MEMO.SetTagMode("Index") 
    elseif tickId==2 then  MEMO.SetTagMode("Type") 
    else  MEMO.SetTagMode("Value")  end

end


function SetHasChangedIncrement()
    EventArray.onChangedValue  =EventArray.onChangedValue +1
end
function RefreshOnChangedAddress()

    if MEMO.IsTagMode("Tag") then
        AddonStateInMemory[0]=tagInjectionGeneric
    elseif MEMO.IsTagMode("Type") then 
        AddonStateInMemory[0]=Type_3_OnChanged
    elseif MEMO.IsTagMode("Index") then 
        AddonStateInMemory[0]=0
    else
        AddonStateInMemory[0]=EventArray.onChangedValue 
    end
end


function  RefreshAddonStateAndUpdateOnChanged() 
    -- We want to minimize the time in cheat engine.
    -- So I want a address for the OnValueChange and some info about the addon.
    -- 111100000000 1111 are the value on changed 00000000 are 0-9 value represnting addon state 
    -- If 0000001 index 0000002 value   00000 tag mode
    if MEMO.IsTagMode("Tag") then
        AddonStateInMemory[0]=tagInjectionGeneric
    else if MEMO.IsTagMode("Type") then 
        AddonStateInMemory[0]=Type_4_AddonsState
    else
        local value = ((GetTime()*1000)%1000)*1000000000
        
        if MEMO.IsTagMode(1) then 
            value= value+2
        elseif MEMO.IsTagMode(2) then 
            value= value+3
        else
        
        end

        if MEMO.GET_WINDOWOPEN() then 
            value= value + 10
        end
        AddonStateInMemory[0]=value
    end

    end
end



---------------- MANAGE TEXT MEMORY FUNCTION



function SetAllTextMemoryToZero()
    for i=1,maxtextvalue do
        --TextInMemory[i]=math.floor(2501000+(i%255))
        TextInMemory[i]=0
        --TextInMemory[i]=-9999999
    end
end
function SetAllTextMemoryToIndex()
    for i=1,maxtextvalue do
        TextInMemory[i]=i
        --TextInMemory[i]=0
    end
end


function SetAllTextMemoryToValueFloored(value)
    for i=1,maxtextvalue do
        TextInMemory[i]=math.floor(value)
        --TextInMemory[i]=0
    end
end
function SetAllTextMemoryToValue(value)
    for i=1,maxtextvalue do
        TextInMemory[i]=value
        --TextInMemory[i]=0
    end
end


function SetMemoryTextWithGivenString(text)

    for i = 1, maxtextvalue do
        if(i>maxtextvalue or text==nil) then
            TextInMemory[i] =0
        else
            if(i<=#text)then
               TextInMemory[i] = math.floor(string.byte(text, i))
            else 
                TextInMemory[i] =0
            end
        end
    end
end

--------------