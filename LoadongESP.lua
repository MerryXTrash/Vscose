-- สร้าง ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- ฟังก์ชันสร้าง ImageLabel
local function createImageLabel(parent, imageId, position, size)
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Image = imageId
    imageLabel.Position = position
    imageLabel.Size = size
    imageLabel.Parent = parent
end

-- ค้นหา Object และตรวจสอบค่า
local Card = game.Workspace.Section2.Objective.Cards
local cardNames = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve"}

-- ฟังก์ชันสำหรับการตั้งค่าตำแหน่งของ ImageLabel ตามลำดับ
local function getImagePosition(index)
    local xOffset = 0.1
    local yOffset = 0.1 + (index - 1) * (0.2 + spacing)
    return UDim2.new(xOffset, 0, yOffset, 0)
end

-- ค่าระยะห่างระหว่างรูปภาพ
local spacing = 0.3

-- ตรวจสอบและสร้าง ImageLabel ตามชื่อของลูกของ Card
for i, name in ipairs(cardNames) do
    local card = Card:FindFirstChild(name)
    if card then
        local imageId = "rbxassetid://10981760905" -- ใช้ภาพเดียวสำหรับตัวอย่างนี้
        -- กำหนด ImageId ตามชื่อ
        if name == "one" then
            imageId = "rbxassetid://10981760905"
        elseif name == "two" then
            imageId = "rbxassetid://10981760240"
        elseif name == "three" then
            imageId = "rbxassetid://10981760034"
        elseif name == "four" then
            imageId = "rbxassetid://10981760464"
        elseif name == "five" then
            imageId = "rbxassetid://10981759411"
        elseif name == "six" then
            imageId = "rbxassetid://10981758963"
        elseif name == "seven" then
            imageId = "rbxassetid://10981759866"
        elseif name == "eight" then
            imageId = "rbxassetid://10981761464"
        elseif name == "nine" then
            imageId = "rbxassetid://10981760686"
        elseif name == "ten" then
            imageId = "rbxassetid://10981759696"
        elseif name == "eleven" then
            imageId = "rbxassetid://10981759169"
        elseif name == "twelve" then
            imageId = "rbxassetid://10981761162"
        end

        -- สร้าง ImageLabel
        createImageLabel(screenGui, imageId, getImagePosition(i), UDim2.new(0.2, 0, 0.2, 0))
    end
end
