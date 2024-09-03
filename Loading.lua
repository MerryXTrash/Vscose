local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local Show = loadstring(game:HttpGet("https://raw.githubusercontent.com/MerryXTrash/Vscose/main/Toggle.lua"))()

local FillColor = Color3.fromRGB(175, 25, 255)
local DepthMode = "AlwaysOnTop"
local FillTransparency = 0.5
local OutlineColor = Color3.fromRGB(255, 255, 255)
local OutlineTransparency = 0

local CoreGui = game:FindService("CoreGui")
local Players = game:FindService("Players")
local connections = {}

local Storage = Instance.new("Folder")
Storage.Parent = CoreGui
Storage.Name = "Highlight_Storage"

local Enabled = true -- Variable to toggle highlighting on and off

local function ToggleHighlighting(state)
    Enabled = state
    
    if not Enabled then
        -- Remove all highlights and disconnect events
        for _, highlight in ipairs(Storage:GetChildren()) do
            highlight:Destroy()
        end
        for plr, conn in pairs(connections) do
            conn:Disconnect()
            connections[plr] = nil
        end
    else
        -- Apply highlighting to all players
        for _, plr in ipairs(Players:GetPlayers()) do
            Highlight(plr)
        end
    end
end

local function Highlight(plr)
    if not Enabled then return end
    
    local highlight = Instance.new("Highlight")
    highlight.Name = plr.Name
    highlight.FillColor = FillColor
    highlight.DepthMode = DepthMode
    highlight.FillTransparency = FillTransparency
    highlight.OutlineColor = OutlineColor
    highlight.OutlineTransparency = OutlineTransparency
    highlight.Parent = Storage
    
    local plrchar = plr.Character
    if plrchar then
        highlight.Adornee = plrchar
    end

    connections[plr] = plr.CharacterAdded:Connect(function(char)
        highlight.Adornee = char
    end)
end

Players.PlayerAdded:Connect(Highlight)

for _, plr in ipairs(Players:GetPlayers()) do
    Highlight(plr)
end

Players.PlayerRemoving:Connect(function(plr)
    local plrname = plr.Name
    if Storage:FindFirstChild(plrname) then
        Storage[plrname]:Destroy()
    end
    if connections[plr] then
        connections[plr]:Disconnect()
        connections[plr] = nil
    end
end)

local Window = Fluent:CreateWindow({
    Title = "Xervice HUB Beta",
    SubTitle = "by JajaEngkubb",
    TabWidth = 160,
    Size = UDim2.fromOffset(460, 300),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.One
})

local Tabs = {
    Log = Window:AddTab({ Title = "Update Log", Icon = "hash" }),
    General = Window:AddTab({ Title = "General", Icon = "align-left" }),
    Misc = Window:AddTab({ Title = "Miscellaneous", Icon = "layout-grid" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "JajaCutecute",
        Content = "Thank you for using my script <3",
        SubContent = "ขอบคุณที่ใช้สคริปต์น่ะค่ะ จุ๊บๆ <3",
        Duration = 5
    })

    Tabs.Log:AddParagraph({
        Title = "+ Add",
        Content = "Jigoku Event"
    })

    Tabs.General:AddParagraph({
        Title = "Book 1",
        Content = "Chapter 1"
    })

    Tabs.General:AddButton({
        Title = "Continue",
        Description = "Continue",
        Callback = function()
            Window:Dialog({
                Title = "Fullbright",
                Content = "Do you want to skip this Part?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            print("Dialog confirmed.")
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            print("Dialog cancelled.")
                        end
                    }
                }
            })
        end
    })

    Tabs.Misc:AddButton({
        Title = "Fullbright",
        Description = "If you're scared of the dark",
        Callback = function()
            Window:Dialog({
                Title = "Fullbright",
                Content = "Do you want to enable Fullbright?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            local Time = game.Lighting
                            Time.ClockTime = 12
                            Time.Ambient = Color3.new(1, 1, 1)
                            Time.Brightness = 10
                            ColorCorrection.Brightness = 0.2
                            ColorCorrection.Contrast = 0
                            ColorCorrection.TintColor = Color3.new(1, 1, 1)
                            ColorCorrection.Enabled = true
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            print("NO")
                        end
                    }
                }
            })
        end
    })
    
    local Toggle = Tabs.Misc:AddToggle("MyToggle", {Title = "Player ESP", Default = false})

    Toggle:OnChanged(function(value)
        if value then
ToggleHighlighting(true)
        else
ToggleHighlighting(false)
        end
    end)

    Options.MyToggle:SetValue(false)

    local Dropdown = Tabs.General:AddDropdown("Dropdown", {
        Title = "Dropdown",
        Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
        Multi = false,
        Default = 1
    })

    Dropdown:SetValue("four")

    Dropdown:OnChanged(function(Value)
        print("Dropdown changed:", Value)
    end)

    SaveManager:SetLibrary(Fluent)

    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({})
    SaveManager:SetFolder("FluentScriptHub/specific-game")

    SaveManager:BuildConfigSection(Tabs.Settings)

    Window:SelectTab(1)

    Fluent:Notify({
        Title = "จ๊ะจ๊าเองจ้า",
        Content = "ใช้สคริปต์ระวังโดนแบนกันด้วยน้าา",
        Duration = 5
    })

    SaveManager:LoadAutoloadConfig()
end
