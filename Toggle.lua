-- Version: 3.2

-- Instances:
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")

-- Properties:
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BackgroundTransparency = 1.000

-- ขนาดของปุ่มและตำแหน่ง
ImageButton.Size = UDim2.new(0.07, 0, 0.15, 0)  -- ขนาดปุ่ม: 10% ของขนาดหน้าจอ
ImageButton.Position = UDim2.new(0.95, -95, 0, 0)  -- ตำแหน่ง: มุมขวาบนของหน้าจอ โดยมีการเลื่อนเข้าไป 100 pixels

ImageButton.Image = "rbxassetid://134754092492795"  -- ใส่ ID ของภาพที่คุณต้องการใช้
ImageButton.ImageTransparency = 0.000
ImageButton.Active = true
ImageButton.Draggable = true

-- Adding UICorner (สำหรับมุมโค้ง)
UICorner.Parent = ImageButton
UICorner.CornerRadius = UDim.new(0.1, 0)  -- สามารถปรับเปลี่ยนค่าตามต้องการได้

-- Adding UIStroke (สำหรับขอบ)
UIStroke.Parent = ImageButton
UIStroke.Color = Color3.fromRGB(85, 0, 255)
UIStroke.Thickness = 2  -- ความหนาของขอบ

ImageButton.MouseButton1Down:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "One", false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "LeftControl", false, game)
    end)
