-- สร้าง ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- สร้าง Frame เพื่อบรรจุ ImageLabel
local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, 0) -- ขนาดของ Frame
frame.Position = UDim2.new(0, 0, 0, 0) -- ตำแหน่งของ Frame
frame.BackgroundTransparency = 1 -- ไม่ให้มีพื้นหลัง
frame.Parent = screenGui

-- สร้าง UIListLayout ใน Frame
local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Parent = frame
uiListLayout.FillDirection = Enum.FillDirection.Horizontal -- จัดเรียงในแนวนอน
uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left -- จัดเรียงไปทางซ้าย
uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
uiListLayout.Padding = UDim.new(0, 10) -- ระยะห่างระหว่าง ImageLabel

-- ฟังก์ชันสร้าง ImageLabel
local function createImageLabel(parent, imageId, size)
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Image = imageId
    imageLabel.Size = size
    imageLabel.BackgroundTransparency = 1 -- ปิดพื้นหลัง
    imageLabel.Parent = parent
end

-- ค่าของ imageId ตามชื่อ
local imageIdMap = {
    ["one"] = "rbxassetid://10981760905",
    ["two"] = "rbxassetid://10981760240",
    ["three"] = "rbxassetid://10981760034",
    ["four"] = "rbxassetid://10981760464",
    ["five"] = "rbxassetid://10981759411",
    ["six"] = "rbxassetid://10981758963",
    ["seven"] = "rbxassetid://10981759866",
    ["eight"] = "rbxassetid://10981761464",
    ["nine"] = "rbxassetid://10981760686",
    ["ten"] = "rbxassetid://10981759696",
    ["eleven"] = "rbxassetid://10981759169",
    ["twelve"] = "rbxassetid://10981761162"
}

-- ค้นหา Object และตรวจสอบค่า
local Card = game.Workspace.Section2.Objective.Cards
local cardNames = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve"}

-- สร้าง ImageLabel ใน Frame
for i, name in ipairs(cardNames) do
    local card = Card:FindFirstChild(name)
    if card then
        local imageId = imageIdMap[name]
        -- ขนาดที่ทำให้ภาพเรียวและยาว
        local size = UDim2.new(0.1, 0, 0.3, 0) -- ความกว้าง 10% และความสูง 30%
        -- สร้าง ImageLabel
        createImageLabel(frame, imageId, size)
    end
end
