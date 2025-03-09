-- KeyToMorseCall.lua

-- Initialize global variables
local EloiLab = {
    gameTimes = {},
    morse_stack = {},
    use_debug_print_in_morse = true,
}

local function DPrint(message)
    if EloiLab.use_debug_print_in_morse then
        print(message)
    end
end

-- Function to execute Lua code and print the result
local function ExecuteCodeAndPrintResult(code)
    local success, result = pcall(function()
        local func, err = loadstring(code)
        if not func then
            error(err)
        end
        return func()
    end)

    if success then
        print("Result:", result)
    else
        print("Error:", result)
    end
end

-- Clear the recorded timings
local function ClearGameTimes()
    EloiLab.gameTimes = {}
end

-- Morse code to Lua code mapping
local morse_code_to_lua = {
    ["..."] = "ReloadUI()",  -- Reloads the UI
    ["---"] = "DoEmote('dance')",  -- Makes the character dance
    ["...---..."] = "UseItemByName('Hearthstone')",  -- Uses the Hearthstone
    ["...."] = "AcceptResurrect()",  -- Accept resurrection (you'll need to check if it's valid to accept a resurrection)
    ["....."] = "FollowUnit('target')",  -- Follow target
    ["..-"] = 'RunMacro("Bot")',  
    [".-"] = 'RunMacro("Bots")', 
    ["."]= '/run C_ReportSystem.OpenReportPlayerDialog(PLAYER_REPORT_TYPE_SPAM, UnitName("target"), PlayerLocation:CreateFromUnit("target"))',
    
}
-- "TargetUnit('Boris')"  is block by Blizzard API
-- RunMacro("Bots") is block by Blizzard API
-- ??? /run C_ReportSystem.OpenReportPlayerDialog(PLAYER_REPORT_TYPE_CHEATING, UnitName(“target”), PlayerLocation:CreateFromUnit(“target”))
-- https://eu.forums.blizzard.com/en/wow/t/how-to-report/267690/6
-- https://wowpedia.fandom.com/wiki/API_C_ReportSystem.OpenReportPlayerDialog


-- Key bindings
local key_dot = "NUMPADMINUS"
local key_dash = "NUMPADPLUS"
local key_submit = "NUMPADDIVIDE"

-- Create a frame to handle key events
local frame = CreateFrame("Frame", nil, UIParent)
frame:SetSize(100, 100)
frame:SetPoint("CENTER")
frame:EnableMouse(true)
frame:EnableKeyboard(true)
frame:SetPropagateKeyboardInput(true)

-- Function to record game time (placeholder)
local function RecordGameTime()
    table.insert(EloiLab.gameTimes, GetTime())
end

-- Set the OnKeyDown script
frame:SetScript("OnKeyDown", function(self, key)
    if key == key_dot then
        RecordGameTime()
        table.insert(EloiLab.morse_stack, ".")
    elseif key == key_dash then
        RecordGameTime()
        table.insert(EloiLab.morse_stack, "-")
    elseif key == key_submit then
        local morseCode = table.concat(EloiLab.morse_stack)
        print("Morse:", morseCode)
        if morse_code_to_lua[morseCode] then
            ExecuteCodeAndPrintResult(morse_code_to_lua[morseCode])
            DPrint("Detected Morse to Lua: " .. morse_code_to_lua[morseCode])
        else
            DPrint("No Lua code mapped for Morse Code: " .. morseCode)
        end
        EloiLab.morse_stack = {}
    end
end)
