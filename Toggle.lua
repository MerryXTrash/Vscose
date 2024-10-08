-- Version: 3.2

-- Instances:
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")

-- Properties:
ScreenGui.Parent = game.CoreGui
  -- ป้องกันไม่ให้ UI หายไปเมื่อผู้เล่นตาย
ImageButton.ZIndex = 1  -- ตั้งค่า ZIndex ให้เป็น 1

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BackgroundTransparency = 1.000
ImageButton.Size = UDim2.new(0.07, 0, 0.15, 0)
ImageButton.Position = UDim2.new(0.95, -95, 0, 0)
ImageButton.Image = "rbxassetid://134204200422920"
ImageButton.ImageTransparency = 0.000
ImageButton.Active = true
ImageButton.Draggable = true

-- Adding UICorner (สำหรับมุมโค้ง)
UICorner.Parent = ImageButton
UICorner.CornerRadius = UDim.new(0.1, 0)

-- Adding UIStroke (สำหรับขอบ)
UIStroke.Parent = ImageButton
UIStroke.Color = Color3.fromRGB(56, 182, 255)
UIStroke.Thickness = 1

-- การตั้งค่า ZIndex ของ ImageButton
ImageButton.ZIndex = 1  -- ตั้งค่า ZIndex ของปุ่มให้เป็น 1

-- การจับคลิกปุ่ม
ImageButton.MouseButton1Down:Connect(function()
    local virtualInputManager = game:GetService("VirtualInputManager")
    virtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
    virtualInputManager:SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
end)
