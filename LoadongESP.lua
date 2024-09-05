-- สร้างโฟลเดอร์ใน Workspace
local folder = Instance.new("Folder")
folder.Name = "HighlightsFolder"
folder.Parent = game.Workspace

-- สร้าง Highlight แม่แบบ
local highlightTemplate = Instance.new("Highlight")
highlightTemplate.Name = "HighlightTemplate"
highlightTemplate.Enabled = true
highlightTemplate.FillTransparency = 0.5
highlightTemplate.OutlineTransparency = 0
highlightTemplate.Parent = folder

-- ฟังก์ชันในการตั้งค่า Highlight สำหรับ Mob
local function setupHighlightForMob(mob)
    local mobHighlight = highlightTemplate:Clone()
    mobHighlight.Name = "MobESP"
    mobHighlight.FillColor = Color3.fromRGB(255, 0, 0)
    mobHighlight.FillTransparency = 0.8
    mobHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    mobHighlight.Parent = mob
end

-- ฟังก์ชันในการตั้งค่า Highlight สำหรับ Player
local function setupHighlightForPlayer(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local playerHighlight = highlightTemplate:Clone()
    playerHighlight.Name = "PlayerESP"
    playerHighlight.FillColor = Color3.fromRGB(0, 0, 255)
    playerHighlight.FillTransparency = 0.5
    playerHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    playerHighlight.Parent = character
end

-- ตั้งค่า Highlight สำหรับผู้เล่นที่มีอยู่แล้ว
local Players = game.Players
for _, player in pairs(Players:GetPlayers()) do
    setupHighlightForPlayer(player)
end

-- ฟังก์ชันที่จะทำงานเมื่อผู้เล่นใหม่เข้ามา
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        setupHighlightForPlayer(player)
    end)
end)
