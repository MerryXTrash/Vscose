-- ตัวแปรสำหรับเก็บค่าการตั้งค่าเริ่มต้น
local Lighting = game:GetService("Lighting")

-- เก็บค่าการตั้งค่าเริ่มต้น
local defaultSettings = {
    ClockTime = Lighting.ClockTime,
    Ambient = Lighting.Ambient,
    Brightness = Lighting.Brightness,
    ColorCorrection = nil
}

-- ตรวจสอบและเพิ่ม ColorCorrectionEffect ถ้าไม่มีอยู่
local function storeDefaultColorCorrection()
    local ColorCorrection = Lighting:FindFirstChild("ColorCorrectionEffect")
    if ColorCorrection then
        defaultSettings.ColorCorrection = {
            Brightness = ColorCorrection.Brightness,
            Contrast = ColorCorrection.Contrast,
            TintColor = ColorCorrection.TintColor,
            Enabled = ColorCorrection.Enabled
        }
    end
end

-- ฟังก์ชันเพื่อเปิดการใช้งาน fullbright
local function EnableFullbright()
    -- บันทึกการตั้งค่าเริ่มต้นของ ColorCorrectionEffect
    storeDefaultColorCorrection()
    
    -- ตั้งค่าแสงในเกมสำหรับ fullbright
    Lighting.ClockTime = 12
    Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    Lighting.Brightness = 10

    -- เพิ่ม ColorCorrectionEffect ถ้าไม่มีอยู่
    local ColorCorrection = Lighting:FindFirstChild("ColorCorrectionEffect")
    if not ColorCorrection then
        ColorCorrection = Instance.new("ColorCorrectionEffect")
        ColorCorrection.Name = "ColorCorrectionEffect"
        ColorCorrection.Parent = Lighting
    end

    -- ตั้งค่าการปรับสี
    ColorCorrection.Brightness = 0.2
    ColorCorrection.Contrast = 0
    ColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
    ColorCorrection.Enabled = true
end

-- ฟังก์ชันเพื่อปิดการใช้งาน fullbright
local function DisableFullbright()
    -- คืนค่าแสงในเกมกลับสู่ค่าเริ่มต้น
    Lighting.ClockTime = defaultSettings.ClockTime
    Lighting.Ambient = defaultSettings.Ambient
    Lighting.Brightness = defaultSettings.Brightness

    -- คืนค่า ColorCorrectionEffect ถ้ามีอยู่
    local ColorCorrection = Lighting:FindFirstChild("ColorCorrectionEffect")
    if ColorCorrection then
        ColorCorrection.Brightness = defaultSettings.ColorCorrection.Brightness
        ColorCorrection.Contrast = defaultSettings.ColorCorrection.Contrast
        ColorCorrection.TintColor = defaultSettings.ColorCorrection.TintColor
        ColorCorrection.Enabled = defaultSettings.ColorCorrection.Enabled
    end
end

-- การตั้งค่าตัวแปร global
_G.FULLBRIGHT = true -- เปิดใช้งาน fullbright

-- ตรวจสอบค่า _G.FULLBRIGHT และปรับการตั้งค่าตามนั้น
local function UpdateLighting()
    if _G.FULLBRIGHT then
        EnableFullbright()
        print("Fullbright ถูกเปิดใช้งาน")
    else
        DisableFullbright()
        print("Fullbright ถูกปิดใช้งาน")
    end
end

-- เรียกใช้ฟังก์ชันเพื่ออัปเดตการตั้งค่าแสง
UpdateLighting()
