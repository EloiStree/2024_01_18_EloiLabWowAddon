If you want to have a barcode in your game to report bot in video.
I am going to do an addon with only that in a near future without my lab around.

![image](https://github.com/user-attachments/assets/76bd93a7-d449-47bc-a224-4228af36949c)

Font: https://www.barcodesinc.com/free-barcode-font/?srsltid=AfmBOooZFbRyx-zB0XoD9dr5mElMiwp8A_x97C_10Z9xzgxvpkQu821l
[![image](https://github.com/user-attachments/assets/abb6c6bd-de79-41d8-8415-73f315b0b9f9)](https://www.barcodesinc.com/free-barcode-font/?srsltid=AfmBOooZFbRyx-zB0XoD9dr5mElMiwp8A_x97C_10Z9xzgxvpkQu821l)


``` lua


--------------------------------------------------------------------------[[
local fontPath = "Interface\\AddOns\\EloiLab\\Fonts\\free3of9.ttf"

-- Create the frame
local frameCode = CreateFrame("Frame", "BarcodeFrame", UIParent)
frameCode:SetSize(300, 60) -- 30% of screen width
frameCode:SetPoint("TOPLEFT", 10, -10) -- Position at top-left corner with 10px offset
frameCode:Show()

-- Background (optional)
frameCode.bg = frameCode:CreateTexture(nil, "BACKGROUND")
frameCode.bg:SetAllPoints()
frameCode.bg:SetColorTexture(1, 1, 1, 1) -- Slightly transparent white background

-- Create the text
frameCode.text = frameCode:CreateFontString(nil, "OVERLAY")
frameCode.text:SetFont(fontPath, 48, "") -- Use the font without additional effects
frameCode.text:SetText("Hello World 42 2501")
frameCode.text:SetTextColor(0, 0, 0) -- Set text color to black
frameCode.text:SetPoint("CENTER")

-- Add text in frameCode with total width and 5-pixel height
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
    if targetGUID and playerId ~= targetGUID and UnitIsPlayer("mouseover") then
        local encodedText = encodeToBarcodeTFB(targetGUID:gsub("Player%-", ""))

        textString:SetText("Code 39: " .. targetGUID) -- Set the encoded text as the frame's text

        frameCode.text:SetText(encodedText) -- Set the encoded text as the frame's text
        frameCode:Show()
    else
        frameCode:Hide()
    end
end)


```
