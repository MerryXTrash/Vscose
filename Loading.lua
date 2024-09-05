local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local Show = loadstring(game:HttpGet("https://raw.githubusercontent.com/MerryXTrash/Vscose/main/Toggle.lua"))()
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/MerryXTrash/Vscose/main/LoadongESP.lua"))()

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
    ESP = Window:AddTab({ Title = "Visual", Icon = "eye" }),
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

    Tabs.Log:AddParagraph({
        Title = "+ Add",
        Content = "Visual"
    })

    Tabs.General:AddParagraph({
        Title = "Book 1",
        Content = "Chapter 1"
    })

    Tabs.General:AddButton({
        Title = "Skip",
        Description = "Continue",
        Callback = function()
            Window:Dialog({
                Title = "Skip",
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
                            local Lighting = game.Lighting
                            Time.ClockTime = 12
                            Lighting.Brightness = 2
    Lighting.ClockTime = 14
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = false
    Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
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
    
    local Toggle = Tabs.ESP:AddToggle("MyToggle", {Title = "Player ESP", Default = false})

    Toggle:OnChanged(function(value)
        if value then
ToggleHighlighting(true)
        else
ToggleHighlighting(false)
        end
    end)

    Options.MyToggle:SetValue(false)

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
