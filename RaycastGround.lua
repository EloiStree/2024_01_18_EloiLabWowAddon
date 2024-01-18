-- Create a frame
local MyFrame = CreateFrame("Frame", "MyFrame", UIParent, "InputBoxTemplate")
MyFrame:SetPoint("CENTER")
MyFrame:SetSize(UIParent:GetWidth() / 2, 200) -- Set width to half of the screen width, and minimum height to 200

-- Set up the frame attributes
MyFrame:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
MyFrame:SetBackdropColor(0, 0, 0, 1)

-- Add text to the frame
MyFrame.text = MyFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
MyFrame.text:SetPoint("TOPLEFT", 5, -5)
MyFrame.text:SetText("Editable Text")

-- Create an edit box for user input
MyFrame.editBox = CreateFrame("EditBox", nil, MyFrame, "InputBoxTemplate")
MyFrame.editBox:SetMultiLine(true)
MyFrame.editBox:SetMaxLetters(256) -- Set a reasonable maximum number of letters
MyFrame.editBox:EnableMouse(true)
MyFrame.editBox:SetAutoFocus(false)
MyFrame.editBox:SetPoint("TOPLEFT", MyFrame.text, "BOTTOMLEFT", 0, -5)
MyFrame.editBox:SetWidth(MyFrame:GetWidth() - 10)
MyFrame.editBox:SetHeight(MyFrame:GetHeight() - MyFrame.text:GetHeight() - 15)

-- Enable the frame for keyboard input
MyFrame.editBox:SetScript("OnEscapePressed", function(self)
    self:ClearFocus()
end)

-- Set up a function to handle copying text
MyFrame.editBox:SetScript("OnTextChanged", function(self)
    local text = self:GetText()
    ChatEdit_InsertLink(text)
end)
