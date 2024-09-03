local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local Show = loadstring(game:HttpGet("https://raw.githubusercontent.com/MerryXTrash/Vscose/main/Toggle.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Xervice HUB Beta",
    SubTitle = "by JajaEngkubb",
    TabWidth = 160,
    Size = UDim2.fromOffset(460, 300),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Log = Window:AddTab({ Title = "Update Log", Icon = "hash" }),
    General = Window:AddTab({ Title = "General", Icon = "table-of-contents" }),
    Misc = Window:AddTab({ Title = "Miscellaneous", Icon = "align-left" }),
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

    Tabs.General:AddButton({
        Title = "Button",
        Description = "Very important button",
        Callback = function()
            Window:Dialog({
                Title = "Dialog Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Dialog confirmed.")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Dialog cancelled.")
                        end
                    }
                }
            })
        end
    })

    local Toggle = Tabs.General:AddToggle("MyToggle", {Title = "Toggle", Default = false})

    Toggle:OnChanged(function()
        print("Toggle changed:", Options.MyToggle.Value)
    end)

    Options.MyToggle:SetValue(false)

    local Slider = Tabs.General:AddSlider("Slider", {
        Title = "Slider",
        Description = "This is a slider",
        Default = 2,
        Min = 0,
        Max = 5,
        Rounding = 1,
        Callback = function(Value)
            print("Slider was changed:", Value)
        end
    })

    Slider:OnChanged(function(Value)
        print("Slider changed:", Value)
    end)

    Slider:SetValue(3)

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

    local MultiDropdown = Tabs.General:AddDropdown("MultiDropdown", {
        Title = "MultiDropdown",
        Description = "You can select multiple values.",
        Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
        Multi = true,
        Default = {"seven", "twelve"}
    })

    MultiDropdown:SetValue({
        three = true,
        five = true,
        seven = false
    })

    MultiDropdown:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        print("MultiDropdown changed:", table.concat(Values, ", "))
    end)

    SaveManager:SetLibrary(Fluent)
    InterfaceManager:SetLibrary(Fluent)

    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({})
    InterfaceManager:SetFolder("FluentScriptHub")
    SaveManager:SetFolder("FluentScriptHub/specific-game")

    InterfaceManager:BuildInterfaceSection(Tabs.Settings)
    SaveManager:BuildConfigSection(Tabs.Settings)

    Window:SelectTab(1)

    Fluent:Notify({
        Title = "จ๊ะจ๊าเองจ้า",
        Content = "ใช้สคริปต์ระวังโดนแบนกันด้วยน้าา",
        Duration = 5
    })

    SaveManager:LoadAutoloadConfig()
end
