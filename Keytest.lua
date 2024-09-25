local TweenService = game:GetService("TweenService")
local Header = "Overflow - Version 4.0"
local Description = "Join Discord for Key"
local CorrectKey = "key"

local function updateKeyBasedOnDay()
    local dayOfWeek = os.date("*t").wday

    if dayOfWeek == 1 then
        CorrectKey = "Sunday"
    elseif dayOfWeek == 2 then
        CorrectKey = "Monday"
    elseif dayOfWeek == 3 then
        CorrectKey = "Tuesday"
    elseif dayOfWeek == 4 then
        CorrectKey = "Wednesday"
    elseif dayOfWeek == 5 then
        CorrectKey = "Thursday"
    elseif dayOfWeek == 6 then  -- Fixed typo here
        CorrectKey = "Friday"
    elseif dayOfWeek == 7 then
        CorrectKey = "Saturday"
    end
end

updateKeyBasedOnDay()
print(CorrectKey)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 300)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

-- Add gradient
local uiGradient = Instance.new("UIGradient")
uiGradient.Parent = Frame
uiGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 80, 80)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 40))
})

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 10)
FrameCorner.Parent = Frame

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 40, 0, 40)
Close.Position = UDim2.new(1, -40, 0, 0)
Close.BackgroundTransparency = 1
Close.Text = "×"
Close.TextScaled = true
Close.TextColor3 = Color3.fromRGB(150, 150, 150)
Close.Parent = Frame
Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0.05, 0)
Title.Text = Header
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Parent = Frame

local Instructions = Instance.new("TextLabel")
Instructions.Size = UDim2.new(1, 0, 0, 30)
Instructions.Position = UDim2.new(0, 0, 0.2, 0)
Instructions.Text = Description
Instructions.TextSize = 15
Instructions.TextColor3 = Color3.fromRGB(150, 150, 150)
Instructions.BackgroundTransparency = 1
Instructions.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.8, 0, 0.2, 0)
TextBox.Position = UDim2.new(0.1, 0, 0.4, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextBox.PlaceholderText = "Enter Key..."
TextBox.Text = ""
TextBox.TextSize = 18
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Parent = Frame

local uiGradient1 = Instance.new("UIGradient")
uiGradient1.Parent = TextBox
uiGradient1.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 80, 80))
})

local TextBoxCorner = Instance.new("UICorner")
TextBoxCorner.CornerRadius = UDim.new(0, 5)
TextBoxCorner.Parent = TextBox

local GetKey = Instance.new("TextButton")
GetKey.Size = UDim2.new(0.35, 0, 0.15, 0)
GetKey.Position = UDim2.new(0.1, 0, 0.7, 0)
GetKey.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
GetKey.Text = "Copy Link"
GetKey.TextSize = 18
GetKey.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKey.Parent = Frame

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 5)
GetKeyCorner.Parent = GetKey

local CheckKey = Instance.new("TextButton")
CheckKey.Size = UDim2.new(0.35, 0, 0.15, 0)
CheckKey.Position = UDim2.new(0.55, 0, 0.7, 0)
CheckKey.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
CheckKey.Text = "Enter"
CheckKey.TextSize = 18
CheckKey.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckKey.Parent = Frame

local CheckKeyCorner = Instance.new("UICorner")
CheckKeyCorner.CornerRadius = UDim.new(0, 5)
CheckKeyCorner.Parent = CheckKey

GetKey.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/AXvTNJdGCz")
end)

local function validateKey(key)
    return key == CorrectKey
end

CheckKey.MouseButton1Click:Connect(function()
    local enteredKey = TextBox.Text
    if validateKey(enteredKey) then
        TextBox.PlaceholderText = "Correct"
        TextBox.Text = ""

        -- Zoom out animation for UI elements before destroying
        local TweenOut = TweenService:Create(Frame, TweenInfo.new(0.5), {Size = UDim2.new(0, 0, 0, 0)})
        TweenOut:Play()

        -- Tween for text elements
        local TweenTextOut = TweenService:Create(Title, TweenInfo.new(0.5), {TextTransparency = 1})
        local TweenInstructionsOut = TweenService:Create(Instructions, TweenInfo.new(0.5), {TextTransparency = 1})
        local TweenTextBoxOut = TweenService:Create(TextBox, TweenInfo.new(0.5), {TextTransparency = 1})
        local TweenGetKeyOut = TweenService:Create(GetKey, TweenInfo.new(0.5), {TextTransparency = 1})
        local TweenCheckKeyOut = TweenService:Create(CheckKey, TweenInfo.new(0.5), {TextTransparency = 1})

        TweenTextOut:Play()
        TweenInstructionsOut:Play()
        TweenTextBoxOut:Play()
        TweenGetKeyOut:Play()
        TweenCheckKeyOut:Play()

        TweenOut.Completed:Wait() -- Wait for the tween to finish
        ScreenGui:Destroy()
        print("Key is correct!")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MerryXTrash/Main.lua/refs/heads/main/Testk.lua"))()
    else
        TextBox.PlaceholderText = "Invalid"
        TextBox.Text = ""
        wait(1)
        TextBox.PlaceholderText = "Enter"
        TextBox.Text = ""
    end
end)

-- Zoom in animation when the GUI is created
local TweenIn = TweenService:Create(Frame, TweenInfo.new(0.5), {Size = UDim2.new(0, 400, 0, 300)})
TweenIn:Play()

-- Tween for text elements on zoom in
local TweenTitleIn = TweenService:Create(Title, TweenInfo.new(0.5), {TextTransparency = 0})
local TweenInstructionsIn = TweenService:Create(Instructions, TweenInfo.new(0.5), {TextTransparency = 0})
local TweenTextBoxIn = TweenService:Create(TextBox, TweenInfo.new(0.5), {TextTransparency = 0})
local TweenGetKeyIn = TweenService:Create(GetKey, TweenInfo.new(0.5), {TextTransparency = 0})
local TweenCheckKeyIn = TweenService:Create(CheckKey, TweenInfo.new(0.5), {TextTransparency = 0})

-- Start with text elements transparent
Title.TextTransparency = 1
Instructions.TextTransparency = 1
TextBox.TextTransparency = 1
GetKey.TextTransparency = 1
CheckKey.TextTransparency = 1

-- Tween for text elements on zoom in (continued)
TweenTitleIn:Play()
TweenInstructionsIn:Play()
TweenTextBoxIn:Play()
TweenGetKeyIn:Play()
TweenCheckKeyIn:Play()

-- Start with a small size for the frame
Frame.Size = UDim2.new(0, 1, 0, 1) -- Initial size for zoom-in effect

-- Wait for all the tweens to complete before allowing interaction
TweenIn.Completed:Wait()
Title.TextTransparency = 0
Instructions.TextTransparency = 0
TextBox.TextTransparency = 0
GetKey.TextTransparency = 0
CheckKey.TextTransparency = 0

-- Ensure the TextBox is focused when the GUI opens
TextBox.Focus()

-- Additional Cleanup Function (Optional)
local function cleanup()
    ScreenGui:Destroy()
end

-- Connect to the close button again in case it's needed
Close.MouseButton1Click:Connect(cleanup)
