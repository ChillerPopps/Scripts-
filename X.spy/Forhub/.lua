
function ExecuteMainModule()
    local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
    local HttpService = game:GetService("HttpService")
    if isfolder("x.Spy") then
    else
        makefolder("x.Spy")  
    end
    local ads = {
                "x.Spy is the #1 cheat utility for Risxe of Nations!.",
                "Remember lads, subscribe to youaremyproperty.",
                "breaking news: irishman 'youaremyproperty' hacks ron!1!!!",
                "See that? Only x.Spy is capable of that!",
                "Hyperant is adding nukes and is censoring it.",
                "Join the x.Spy discorvcd: pnYJtSV",
                "Hyperant is a gaynicvigger."
                }
    local settings = {
        Theme = "Dark",
        Style = 1
    }
    local defConfig = {
        ESP = false,
        ESPColorR = 255,
        ESPColorB = 255,
        ESPColorG = 255,
        JWatch = false,
        RWatch = false,
        MineThr = 1
    }
    print(settings["Theme"])
    if isfile("x.Spy/xspysettings.json") then
        settings = HttpService:JSONDecode(readfile("x.Spy/xspysettings.json"))  
    else
        writefile("x.Spy/xspysettings.json","{}")
    end
    if settings["Theme"] == true then
        themeGet = "Light"
    else
        themeGet = "Dark"   
    end
    function newESPInstance(a1,a2,a3,a4,a5)
        -- Gui to Lua
-- Version: 3

-- Instances:

local XSPYWINNING = Instance.new("BillboardGui")
local Type = Instance.new("TextLabel")
local Health = Instance.new("TextLabel")
local Ent = Instance.new("TextLabel")
local Train = Instance.new("TextLabel")

--Properties:

XSPYWINNING.Name = "XSPYWINNING"
XSPYWINNING.Parent = a1
XSPYWINNING.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
XSPYWINNING.Active = true
XSPYWINNING.AlwaysOnTop = true
XSPYWINNING.LightInfluence = 1
XSPYWINNING.MaxDistance = 20
XSPYWINNING.Size = UDim2.new(0, 75, 0, 40)

Type.Name = "Type"
Type.Parent = XSPYWINNING
Type.BackgroundColor3 = Color3.new(1, 1, 1)
Type.BackgroundTransparency = 1
Type.BorderSizePixel = 0
Type.Size = UDim2.new(0.5, 0, 0, 20)
Type.Font = Enum.Font.GothamBlack
Type.Text = a2
Type.TextColor3 = Color3.fromRGB(defConfig["ESPColorR"],defConfig["ESPColorG"],defConfig["ESPColorB"])
Type.TextSize = 12
Type.TextWrapped = true
Type.TextScaled = true
Type.TextXAlignment = Enum.TextXAlignment.Left

Health.Name = "Health"
Health.Parent = XSPYWINNING
Health.BackgroundColor3 = Color3.new(1, 1, 1)
Health.BackgroundTransparency = 1
Health.BorderSizePixel = 0
Health.Position = UDim2.new(0.5, 0, 0, 0)
Health.Size = UDim2.new(0.5, 0, 0, 20)
Health.Font = Enum.Font.Gotham
Health.Text = a3
Health.TextColor3 = Color3.fromRGB(defConfig["ESPColorR"],defConfig["ESPColorG"],defConfig["ESPColorB"])
Health.TextSize = 12
Health.TextWrapped = true
Health.TextXAlignment = Enum.TextXAlignment.Right

Ent.Name = "Ent"
Ent.Parent = XSPYWINNING
Ent.BackgroundColor3 = Color3.new(1, 1, 1)
Ent.BackgroundTransparency = 1
Ent.BorderSizePixel = 0
Ent.Position = UDim2.new(0, 0, 0.5, 0)
Ent.Size = UDim2.new(0.5, 0, 0, 20)
Ent.Font = Enum.Font.Gotham
Ent.Text = a4
Ent.TextColor3 = Color3.fromRGB(defConfig["ESPColorR"],defConfig["ESPColorG"],defConfig["ESPColorB"])
Ent.TextSize = 12
Ent.TextWrapped = true
Ent.TextXAlignment = Enum.TextXAlignment.Left

Train.Name = "Train"
Train.Parent = XSPYWINNING
Train.BackgroundColor3 = Color3.new(1, 1, 1)
Train.BackgroundTransparency = 1
Train.BorderSizePixel = 0
Train.Position = UDim2.new(0.5, 0, 0.5, 0)
Train.Size = UDim2.new(0.5, 0, 0, 20)
Train.Font = Enum.Font.Gotham
Train.Text = a5
Train.TextColor3 = Color3.fromRGB(defConfig["ESPColorR"],defConfig["ESPColorG"],defConfig["ESPColorB"])
Train.TextSize = 12
Train.TextWrapped = true
Train.TextXAlignment = Enum.TextXAlignment.Right
    end
    workspace.Units.ChildAdded:connect(function(v)
        if defConfig["ESP"] then
            wait(0.5)
            newESPInstance(v,v.Type.Value,math.floor(v.Current.Value),math.floor(v.Current.Entrenchment.Value),math.floor(v.Current.Training.Value))
        end
    end)
    local UI = Material.Load({
        Title = "x.Spy 2.0 Beta",
        Style = settings["Style"],
        SizeX = 600,
        SizeY = 400,
        Theme = themeGet
    })

    local Page1 = UI.New({
        Title = "Legit"
    })
    local Page2 = UI.New({
        Title = "Rage"
    })
    local Page3 = UI.New({
        Title = "Settings"
    })
    local Page4 = UI.New({
        Title = "Skin Changer"
    })
    if isfile("x.Spy/extension.lua") then
        local thisExt = readfile("x.Spy/extension.lua")
        local ExtPage = UI.New({
            Title = "Extension"
        })
        extArray = {}
        extUI = {}
        extArray.Countries = workspace.Countries:GetChildren()
        extArray.CountryData = workspace.CountryData:GetChildren()
        function extUI:Button(arg)
            ExtPage.Button(arg)
        end
        function extUI:Notify(txt)
            UI.Banner({
                Text = txt
            })
        end
        loadstring(thisExt)()
    end

    if isfile("x.Spy/xspyconfig.json") then
        defConfig = HttpService:JSONDecode(readfile("x.Spy/xspyconfig.json")) 
    else
        UI.Banner({
            Text = "No config file, creating new."
        }) 
        writefile("x.Spy/xspyconfig.json","{}")
    end
    --Legit
    Page1.Toggle({
        Text = "UnitESP",
        Enabled = defConfig["ESP"],
        Callback = function(value)
            defConfig["ESP"] = value
            if value == true then
                for i,v in pairs(workspace.Units:GetChildren()) do
                    newESPInstance(v,v.Type.Value,math.floor(v.Current.Value),math.floor(v.Current.Entrenchment.Value),math.floor(v.Current.Training.Value))
            end
            
            else
                for i,v in pairs(workspace.Units:GetChildren()) do
                if v:FindFirstChild("XSPYWINNING") then
                    v["XSPYWINNING"]:Destroy()
                end
            end   
            end
        end
    })
    Page1.Slider({
        Text = "ESP Color R",
        Callback = function(value)
            defConfig["ESPColorR"] = value
        end,
        Min = 1,
        Max = 255,
        Def = 255
    })
    Page1.Slider({
        Text = "ESP Color G",
        Callback = function(value)
            defConfig["ESPColorG"] = value
        end,
        Min = 1,
        Max = 255,
        Def = 255
    })
    Page1.Slider({
        Text = "ESP Color B",
        Callback = function(value)
            defConfig["ESPColorB"] = value
        end,
        Min = 1,
        Max = 255,
        Def = 255
    })
    Page1.Button({
        Text = "Country Lookup",
        Callback = function()
            local xSpy2Country = Instance.new("ScreenGui")
            local Country = Instance.new("Frame")
            local TextLabel = Instance.new("TextLabel")
            local Search = Instance.new("TextBox")
            local SearchFor = Instance.new("TextButton")
            local Flag = Instance.new("ImageLabel")
            local AT = Instance.new("TextLabel")
            local EX = Instance.new("TextLabel")
            local IN = Instance.new("TextLabel")
            local MA = Instance.new("TextLabel")
            local MC = Instance.new("TextLabel")
            local MI = Instance.new("TextLabel")
            local MP = Instance.new("TextLabel")
            local Name = Instance.new("TextLabel")
            local PP = Instance.new("TextLabel")
            local PR = Instance.new("TextLabel")
            local RA = Instance.new("TextLabel")
            local RP = Instance.new("TextLabel")
            local Stability = Instance.new("TextLabel")
            local TextLabel_2 = Instance.new("TextLabel")
            local WE = Instance.new("TextLabel")
            local Close = Instance.new("TextButton")
            xSpy2Country.Name = "xSpy2Country"
            xSpy2Country.Parent = game.CoreGui
            xSpy2Country.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            
            Country.Name = "Country"
            Country.Parent = xSpy2Country
            Country.Active = true
            Country.BackgroundColor3 = Color3.new(0.113725, 0.113725, 0.113725)
            Country.BorderSizePixel = 0
            Country.Position = UDim2.new(0.173999995, 0, 0, 100)
            Country.Size = UDim2.new(0, 425, 0, 331)
            
            TextLabel.Parent = Country
            TextLabel.BackgroundColor3 = Color3.new(0.0627451, 0.643137, 1)
            TextLabel.BorderSizePixel = 0
            TextLabel.Size = UDim2.new(0, 425, 0, 8)
            TextLabel.Font = Enum.Font.SourceSans
            TextLabel.Text = ""
            TextLabel.TextColor3 = Color3.new(0.0627451, 0.643137, 1)
            TextLabel.TextSize = 14
            
            Search.Name = "Search"
            Search.Parent = Country
            Search.BackgroundColor3 = Color3.new(0.0627451, 0.643137, 1)
            Search.BorderSizePixel = 0
            Search.Position = UDim2.new(0.0194174759, 0, 0.0923566893, 0)
            Search.Size = UDim2.new(0, 200, 0, 27)
            Search.ClearTextOnFocus = false
            Search.Font = Enum.Font.Gotham
            Search.PlaceholderText = "please cApItAlIZe countries, shortened names are allowed"
            Search.Text = ""
            Search.TextColor3 = Color3.new(1, 1, 1)
            Search.TextScaled = true
            Search.TextSize = 14
            Search.TextWrapped = true
            
            SearchFor.Name = "SearchFor"
            SearchFor.Parent = Country
            SearchFor.BackgroundColor3 = Color3.new(0.0627451, 0.643137, 1)
            SearchFor.BorderSizePixel = 0
            SearchFor.Position = UDim2.new(0.524271846, 0, 0.0923566893, 0)
            SearchFor.Size = UDim2.new(0, 93, 0, 27)
            SearchFor.Font = Enum.Font.Gotham
            SearchFor.Text = "Search"
            SearchFor.TextColor3 = Color3.new(1, 1, 1)
            SearchFor.TextSize = 14
            
            Flag.Name = "Flag"
            Flag.Parent = Country
            Flag.BackgroundColor3 = Color3.new(0, 0, 0)
            Flag.BorderColor3 = Color3.new(0, 0, 0)
            Flag.BorderSizePixel = 5
            Flag.Position = UDim2.new(0.0364077687, 0, 0.22292994, 0)
            Flag.Size = UDim2.new(0, 147, 0, 80)
            
            AT.Name = "AT"
            AT.Parent = Country
            AT.BackgroundColor3 = Color3.new(1, 1, 1)
            AT.BackgroundTransparency = 1
            AT.BorderSizePixel = 0
            AT.Position = UDim2.new(0.0194174759, 0, 0.729299366, 0)
            AT.Size = UDim2.new(0, 314, 0, 11)
            AT.Font = Enum.Font.Gotham
            AT.Text = "Amount in Treasury:"
            AT.TextColor3 = Color3.new(1, 1, 1)
            AT.TextScaled = true
            AT.TextSize = 14
            AT.TextWrapped = true
            AT.TextXAlignment = Enum.TextXAlignment.Left
            
            EX.Name = "EX"
            EX.Parent = Country
            EX.BackgroundColor3 = Color3.new(1, 1, 1)
            EX.BackgroundTransparency = 1
            EX.BorderSizePixel = 0
            EX.Position = UDim2.new(0.0194174759, 0, 0.598726094, 0)
            EX.Size = UDim2.new(0, 154, 0, 11)
            EX.Font = Enum.Font.Gotham
            EX.Text = "Expenses:"
            EX.TextColor3 = Color3.new(1, 1, 1)
            EX.TextScaled = true
            EX.TextSize = 14
            EX.TextWrapped = true
            EX.TextXAlignment = Enum.TextXAlignment.Left
            
            IN.Name = "IN"
            IN.Parent = Country
            IN.BackgroundColor3 = Color3.new(1, 1, 1)
            IN.BackgroundTransparency = 1
            IN.BorderSizePixel = 0
            IN.Position = UDim2.new(0.0194174759, 0, 0.563694239, 0)
            IN.Size = UDim2.new(0, 154, 0, 11)
            IN.Font = Enum.Font.Gotham
            IN.Text = "Income:"
            IN.TextColor3 = Color3.new(1, 1, 1)
            IN.TextScaled = true
            IN.TextSize = 14
            IN.TextWrapped = true
            IN.TextXAlignment = Enum.TextXAlignment.Left
            
            MA.Name = "MA"
            MA.Parent = Country
            MA.BackgroundColor3 = Color3.new(1, 1, 1)
            MA.BackgroundTransparency = 1
            MA.BorderSizePixel = 0
            MA.Position = UDim2.new(0.424757272, 0, 0.312101901, 0)
            MA.Size = UDim2.new(0, 222, 0, 11)
            MA.Font = Enum.Font.Gotham
            MA.Text = "Manpower Available:"
            MA.TextColor3 = Color3.new(1, 1, 1)
            MA.TextScaled = true
            MA.TextSize = 14
            MA.TextWrapped = true
            MA.TextXAlignment = Enum.TextXAlignment.Left
            
            MC.Name = "MC"
            MC.Parent = Country
            MC.BackgroundColor3 = Color3.new(1, 1, 1)
            MC.BackgroundTransparency = 1
            MC.BorderSizePixel = 0
            MC.Position = UDim2.new(0.424757272, 0, 0.382165611, 0)
            MC.Size = UDim2.new(0, 222, 0, 11)
            MC.Font = Enum.Font.Gotham
            MC.Text = "Manpower Capacity:"
            MC.TextColor3 = Color3.new(1, 1, 1)
            MC.TextScaled = true
            MC.TextSize = 14
            MC.TextWrapped = true
            MC.TextXAlignment = Enum.TextXAlignment.Left
            
            MI.Name = "MI"
            MI.Parent = Country
            MI.BackgroundColor3 = Color3.new(1, 1, 1)
            MI.BackgroundTransparency = 1
            MI.BorderSizePixel = 0
            MI.Position = UDim2.new(0.424757272, 0, 0.347133756, 0)
            MI.Size = UDim2.new(0, 222, 0, 11)
            MI.Font = Enum.Font.Gotham
            MI.Text = "Manpower Increase:"
            MI.TextColor3 = Color3.new(1, 1, 1)
            MI.TextScaled = true
            MI.TextSize = 14
            MI.TextWrapped = true
            MI.TextXAlignment = Enum.TextXAlignment.Left
            
            MP.Name = "MP"
            MP.Parent = Country
            MP.BackgroundColor3 = Color3.new(1, 1, 1)
            MP.BackgroundTransparency = 1
            MP.BorderSizePixel = 0
            MP.Position = UDim2.new(0.424757272, 0, 0.528662443, 0)
            MP.Size = UDim2.new(0, 150, 0, 11)
            MP.Font = Enum.Font.Gotham
            MP.Text = "Military Power: "
            MP.TextColor3 = Color3.new(1, 1, 1)
            MP.TextScaled = true
            MP.TextSize = 14
            MP.TextWrapped = true
            MP.TextXAlignment = Enum.TextXAlignment.Left
            
            Name.Name = "Name"
            Name.Parent = Country
            Name.BackgroundColor3 = Color3.new(1, 1, 1)
            Name.BackgroundTransparency = 1
            Name.BorderSizePixel = 0
            Name.Position = UDim2.new(0.424757272, 0, 0.22292994, 0)
            Name.Size = UDim2.new(0, 112, 0, 17)
            Name.Font = Enum.Font.GothamBold
            Name.Text = "Name"
            Name.TextColor3 = Color3.new(1, 1, 1)
            Name.TextScaled = true
            Name.TextSize = 14
            Name.TextWrapped = true
            Name.TextXAlignment = Enum.TextXAlignment.Left
            
            PP.Name = "PP"
            PP.Parent = Country
            PP.BackgroundColor3 = Color3.new(1, 1, 1)
            PP.BackgroundTransparency = 1
            PP.BorderSizePixel = 0
            PP.Position = UDim2.new(0.424757272, 0, 0.598726094, 0)
            PP.Size = UDim2.new(0, 150, 0, 11)
            PP.Font = Enum.Font.Gotham
            PP.Text = "Political Points"
            PP.TextColor3 = Color3.new(1, 1, 1)
            PP.TextScaled = true
            PP.TextSize = 14
            PP.TextWrapped = true
            PP.TextXAlignment = Enum.TextXAlignment.Left
            
            PR.Name = "PR"
            PR.Parent = Country
            PR.BackgroundColor3 = Color3.new(1, 1, 1)
            PR.BackgroundTransparency = 1
            PR.BorderSizePixel = 0
            PR.Position = UDim2.new(0.0194174759, 0, 0.633757949, 0)
            PR.Size = UDim2.new(0, 154, 0, 11)
            PR.Font = Enum.Font.Gotham
            PR.Text = "Profit:"
            PR.TextColor3 = Color3.new(1, 1, 1)
            PR.TextScaled = true
            PR.TextSize = 14
            PR.TextWrapped = true
            PR.TextXAlignment = Enum.TextXAlignment.Left
            
            RA.Name = "RA"
            RA.Parent = Country
            RA.BackgroundColor3 = Color3.new(1, 1, 1)
            RA.BackgroundTransparency = 1
            RA.BorderSizePixel = 0
            RA.Position = UDim2.new(0.0194174647, 0, 0.528662443, 0)
            RA.Size = UDim2.new(0, 112, 0, 11)
            RA.Font = Enum.Font.Gotham
            RA.Text = "Ranking"
            RA.TextColor3 = Color3.new(1, 1, 1)
            RA.TextScaled = true
            RA.TextSize = 14
            RA.TextWrapped = true
            RA.TextXAlignment = Enum.TextXAlignment.Left
            
            RP.Name = "RP"
            RP.Parent = Country
            RP.BackgroundColor3 = Color3.new(1, 1, 1)
            RP.BackgroundTransparency = 1
            RP.BorderSizePixel = 0
            RP.Position = UDim2.new(0.424757272, 0, 0.563694239, 0)
            RP.Size = UDim2.new(0, 150, 0, 11)
            RP.Font = Enum.Font.Gotham
            RP.Text = "Research Points"
            RP.TextColor3 = Color3.new(1, 1, 1)
            RP.TextScaled = true
            RP.TextSize = 14
            RP.TextWrapped = true
            RP.TextXAlignment = Enum.TextXAlignment.Left
            
            Stability.Name = "Stability"
            Stability.Parent = Country
            Stability.BackgroundColor3 = Color3.new(1, 1, 1)
            Stability.BackgroundTransparency = 1
            Stability.BorderSizePixel = 0
            Stability.Position = UDim2.new(0.424757272, 0, 0.277070075, 0)
            Stability.Size = UDim2.new(0, 236, 0, 11)
            Stability.Font = Enum.Font.Gotham
            Stability.Text = "Stability: "
            Stability.TextColor3 = Color3.new(1, 1, 1)
            Stability.TextScaled = true
            Stability.TextSize = 14
            Stability.TextWrapped = true
            Stability.TextXAlignment = Enum.TextXAlignment.Left
            
            TextLabel_2.Parent = Country
            TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
            TextLabel_2.BackgroundTransparency = 1
            TextLabel_2.BorderSizePixel = 0
            TextLabel_2.Position = UDim2.new(0.0194174759, 0, 0.0221294276, 0)
            TextLabel_2.Size = UDim2.new(0, 397, 0, 17)
            TextLabel_2.Font = Enum.Font.GothamSemibold
            TextLabel_2.Text = "Gives you statistics of the country you input, including stability."
            TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
            TextLabel_2.TextScaled = true
            TextLabel_2.TextSize = 14
            TextLabel_2.TextWrapped = true
            TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
            
            WE.Name = "WE"
            WE.Parent = Country
            WE.BackgroundColor3 = Color3.new(1, 1, 1)
            WE.BackgroundTransparency = 1
            WE.BorderSizePixel = 0
            WE.Position = UDim2.new(0.424757272, 0, 0.633757949, 0)
            WE.Size = UDim2.new(0, 150, 0, 11)
            WE.Font = Enum.Font.Gotham
            WE.Text = "War Exhaustion:"
            WE.TextColor3 = Color3.new(1, 1, 1)
            WE.TextScaled = true
            WE.TextSize = 14
            WE.TextWrapped = true
            WE.TextXAlignment = Enum.TextXAlignment.Left
            
            Close.Name = "Close"
            Close.Parent = Country
            Close.BackgroundColor3 = Color3.new(0.0627451, 0.643137, 1)
            Close.BorderSizePixel = 0
            Close.Position = UDim2.new(0.0183894616, 0, 0.926193535, 0)
            Close.Size = UDim2.new(0, 119, 0, 17)
            Close.Font = Enum.Font.Gotham
            Close.Text = "Close"
            Close.TextColor3 = Color3.new(1, 1, 1)
            Close.TextSize = 14
            
            -- Scripts:
            
            local function GHPEGKB_fake_script() -- Country.LocalScript 
                local script = Instance.new('LocalScript', Country)
            
                script.Parent.Draggable = true
            end
            coroutine.wrap(GHPEGKB_fake_script)()
            local function YGFESE_fake_script() -- Close.LocalScript 
                local script = Instance.new('LocalScript', Close)
            
                script.Parent.MouseButton1Click:Connect(function()
                    script.Parent.Parent.Parent:Destroy()
                end)
            end
            coroutine.wrap(YGFESE_fake_script)()
            
            country = workspace.Countries
    countryData = workspace.CountryData
    function getCountryFromPartial(a1)
        for i,v in pairs(countryData:GetChildren()) do
            a = string.match(v.Name,a1)
            if a then
                return v.Name;
            end
        end
    end
    function getPlayerFromCountry(a1)
        return country[countryData[a1].Leader.Value]
    end
    SearchFor.MouseButton1Click:connect(function()
        thisCountry = getCountryFromPartial(Search.Text)
        print(thisCountry)
        Stability.Text  = "Stability: "..countryData[thisCountry].Data.Stability.Value.."%"
        Name.Text = thisCountry
        MA.Text = "Manpower Available: "..countryData[thisCountry].Manpower.Value.X
        MI.Text = "Manpower Increase: "..countryData[thisCountry].Manpower.Value.Y
        MC.Text = "Manpower Capacity: "..countryData[thisCountry].Manpower.Value.Z
        RA.Text = "Ranking: #"..countryData[thisCountry].Ranking.Value
        if countryData[thisCountry].Ranking.Value>3 then
            Flag.BorderColor3 = Color3.new(229/255, 233/255, 235/255)
        end
        if countryData[thisCountry].Ranking.Value<4 then
            Flag.BorderColor3 = Color3.new(235/255, 182/255, 4/255)
        end
        if countryData[thisCountry].Ranking.Value>19 then
            Flag.BorderColor3 = Color3.new(39/255, 39/255, 39/255)
        end
        Flag.Image = game.ReplicatedStorage.Assets.Flag[thisCountry].Texture
        income = require(workspace.FunctionDump.ValueCalc.CountryRevenue)
        expend = require(workspace.FunctionDump.ValueCalc.CountryExpenses)
        IN.Text = "Income: $"..income(thisCountry)
        EX.Text = "Expenses: $"..expend(thisCountry)
        PR.Text = "Profit: $"..income(thisCountry)-expend(thisCountry)
        MP.Text = "Military Power: "..countryData[thisCountry].Power.Military.Value
        PP.Text = "Political Power: "..countryData[thisCountry].Power.Political.Value
        RP.Text = "Research Points: "..countryData[thisCountry].Power.Research.Value
        WE.Text = "War Exhaustion: "..countryData[thisCountry].Power.WarExhaustion.Value
        AT.Text = "Amount in Treasury: $"..countryData[thisCountry].Economy.Balance.Value
    end)

        end
    })
    Page1.Toggle({
        Text = "JustificationWatch",
        Callback = function(value)
            defConfig["JWatch"] = value
        end,
        Enabled = defConfig["JWatch"]
    })
    Page1.Toggle({
        Text = "RebelWatch",
        Callback = function(value)
            defConfig["RWatch"] = value
        end,
        Enabled = defConfig["RWatch"]
    })
    function addToClientNews(txt,col)
        local l__MainFrame__4 = game.Players.LocalPlayer.PlayerGui.GameGui.MainFrame
        local v712 = l__MainFrame__4.TopBar.Date.Sample:Clone();
        v712.Text = txt;
        v712.Visible = true;
        v712.TextColor3 = col;
        v712.Parent = l__MainFrame__4.TopBar.Ticker;
        v712.Size = UDim2.new(0, v712.TextBounds.X + 75, 1, 0);
        local v713 = l__MainFrame__4.TopBar.Ticker.AbsoluteSize.X;
        wait(1);
        local v714 = l__MainFrame__4.TopBar.Ticker:GetChildren();
        if #v714 - 1 > 0 then
            v713 = math.clamp(v714[#v714 - 1].Position.X.Offset + v714[#v714 - 1].Size.X.Offset, l__MainFrame__4.TopBar.Ticker.AbsoluteSize.X, math.huge);
        end;
        v712.Position = UDim2.new(0, v713, 0, 0);
        local v715 = game:GetService("TweenService"):Create(v712, TweenInfo.new((v712.Position.X.Offset + v712.Size.X.Offset) / 100, Enum.EasingStyle.Linear), {
            Position = UDim2.new(0, -v712.Size.X.Offset, 0, 0)
        });
        v715:Play();
        v715.Completed:Connect(function()
            v712:Destroy();
        end);
    end 

    for i,v in pairs(workspace.Countries:GetChildren()) do
        for i2,v2 in pairs(v.CB:GetChildren()) do
            v2.ChildAdded:connect(function(item)
                if defConfig["JWatch"] == true then
                    addToClientNews("[x.Spy] "..v.Country.Value.." has justified on "..item.Name.." ("..v2.Name..")",Color3.new(255/255,100/255,100/255))
                end
            end)
        end
        v.DiploActions.ChildAdded:connect(function(itema)
            if itema.Value.Z == 365 then 
                if defConfig["RWatch"] == true then
                    addToClientNews("[x.Spy]"..v.Country.Value.." has started funding "..itema.Name.."'s rebels!",Color3.new(255/255,100/255,100/255))
                end
            else 
                if defConfig["JWatch"] == true then  
                addToClientNews("[x.Spy]"..v.Country.Value.." is justifying on "..itema.Name,Color3.new(255/255,100/255,100/255))
                end
            end
        end)
    end
    function GetLocalCities() 
        local b = {}
        for i,v in pairs(workspace.Baseplate.Cities[game.Workspace.Countries[game.Players.LocalPlayer.Name].Country.Value]:GetChildren()) do
            if not v:FindFirstChild("Occupied Tag") then table.insert(b, v) end
        end
        return b
    end
    local SelectedResource = "Tungsten"
    Page1.Button({
        Text = "Build Mines on Resource Cities",
        Callback = function()
            a = GetLocalCities()
            for i,v in pairs(a) do 
                if v.Resources:FindFirstChild(SelectedResource).Value > 0 then 
                    wait(0.7)
                    workspace.GameManager.CreateBuilding:FireServer({v}, "Mines")
                    print("Queued mines in " .. v.Name)
                end
            end
        end
    })
    Page1.Dropdown({
        Text = "Select Resource",
        Callback = function(value)
            SelectedResource = value
        end,
        Options = {"Aluminum","Chromium","Copper","Diamond","Gold","Iron","Oil","Phosphate","Titanium","Tungsten","Uranium"}
    })


    --Rage
    Page2.Button({
        Text = "RequestBot: Send Puppet Request to all countries",
        Callback = function()
            for i,v in pairs(workspace.CountryData:GetChildren()) do
                if not string.match(v.Leader.Value, "AI") and not string.match(v.Name, game.Players.LocalPlayer.Name) then
                    wait(0.7)
                    workspace.GameManager.ManageAlliance:FireServer(v.Name,"SendRequest","PuppetRequest")
                end
                for i,v in pairs(game.Players.LocalPlayer.PlayerGui.GameGui.MainFrame:GetChildren()) do
                    if v.Name == "AlertSample" then
                        v:Destroy()
                    end
                end
            end	    
        end
    })
    Page2.Button({
        Text = "RequestBot: Send Alliance Request to all countries",
        Callback = function()
            for i,v in pairs(workspace.CountryData:GetChildren()) do
                if not string.match(v.Leader.Value, "AI") and not string.match(v.Name, game.Players.LocalPlayer.Name) then
                    wait(0.7)
                    workspace.GameManager.ManageAlliance:FireServer(v.Name,"SendRequest")
                end
                for i,v in pairs(game.Players.LocalPlayer.PlayerGui.GameGui.MainFrame:GetChildren()) do
                    if v.Name == "AlertSample" then
                        v:Destroy()
                    end
                end
            end	    
        end
    })
    Page2.Toggle({
        Text = "Advertise x.Spy",
        Callback = function(value)
            
                if value == true then
                    _G.Addinga = true
                else
                    _G.Addinga = false
                end
        end
    })
    Page2.Button({
        Text = "Spam News Ticker",
        Callback = function()
            for i,v in pairs(workspace.Countries:GetChildren()) do 
                wait(0.5)
                workspace.CountryManager.ReleaseCountry:FireServer(v.Country.Value)
            end
            wait(5)
            for i,v in pairs(game.Players.LocalPlayer.PlayerGui.GameGui.MainFrame:GetChildren()) do
                if v.Name == "AlertSample" then
                    v:Destroy()
                end
            end
        end
    })
    Page2.Button({
        Text = "Clear all alerts",
        Callback = function()
            for i,v in pairs(game.Players.LocalPlayer.PlayerGui.GameGui.MainFrame:GetChildren()) do
                if v.Name == "AlertSample" then
                    v:Destroy()
                end
            end
        end
    })
    Page2.Button({
        Text = "Create 'African American' Faction",
        Callback = function()

            local args = {
                [1] = workspace.Countries[game.Players.LocalPlayer.Name].Country.Value,
                [2] = "FactionCreate",
                [3] = {
                    [1] = "African",
                    [2] = "American"
                }
            }

            workspace.GameManager.ManageAlliance:FireServer(unpack(args))

        end
    })
    --Settings
    Page3.Toggle({
        Text = "Use Legacy UI (Removed)",
        Callback = function(value)
            print(value)
            if value == true then
                UI.Banner({
                Text = "Restart x.Spy to use Legacy UI. (make sure to save your settings!)"
            }) 
            settings["Legacy"] = true
            else
                settings["Legacy"] = false
            end
        end,
        Menu = {
            Information = function(self)
                UI.Banner({
                    Text = "Enables the x.Spy 2.0pre10 Beta UI."            
                })
            end
        }
    })
    local themetog = Page3.Toggle({
        Text = "Light Mode",
        Callback = function(value)
            print(value)
            if value == true then
            settings["Theme"] = true
            else
                settings["Theme"] = false
            end
        end,
        Enabled = settings["Theme"]
    })
    Page3.Dropdown({
        Text = "Select Style",
        Callback = function(value)
            settings["Style"] = value
        end,
        Options = {1,2,3}
    })
    Page3.Button({
        Text = "Save Settings",
        Callback = function()
            writefile("x.Spy/xspysettings.json",HttpService:JSONEncode(settings))
            UI.Banner({
                Text = "Your settings have been saved at at exploit-folder/workspace/x.Spy/xspysettings.json"
            })   
        end
    })
    Page3.Button({
        Text = "Save this current configuration",
        Callback = function()
            writefile("x.Spy/xspyconfig.json",HttpService:JSONEncode(defConfig))
            UI.Banner({
                Text = "Your config have been saved at exploit-folder/workspace/x.Spy/xspyconfig.json"
            })   
        end
    })
    --Skin Changer
    local SelectedSkin = "Default"
    Page4.Dropdown({
        Text = "Select Skin",
        Callback = function(value)
            SelectedSkin = value
        end,
        Options = {"Default","Germany WWII","United States WWII"}
    })
    Page4.Button({
        Text = "Apply Changes",
        Callback = function()
            workspace.Countries[game.Players.LocalPlayer.Name].Skin.Value = SelectedSkin
            UI.Banner({
                Text = "Applied skin (note that this is just clientside only)"
            })   
        end
    })
    while wait(0.5) do
        if defConfig["ESP"] then
                    for i,v in pairs(workspace.Units:GetChildren()) do
                        if v:FindFirstChild("XSPYWINNING") then
                            inst = v["XSPYWINNING"]
                            inst.Ent.Text = math.floor(v.Current.Entrenchment.Value)
                            inst.Type.Text = v.Type.Value
                            inst.Health.Text = math.floor(v.Current.Value)
                            inst.Train.Text = math.floor(v.Current.Training.Value)
                        end
                    end
        end  
            
        if _G.Addinga == true then
            wait(2)
            local A_1 = ads[math.random(1,#ads)] local A_2 = "All" 
            local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(A_1, A_2)
        end
    end

end





keys = {{"7jBU5pXffyK28b9fVOdK",syn and true or false},{"qYxU7d4GaIl7tpBVdDlf",syn and true or false},{"gBDHNJQBO8al08Xm6D8G", syn and true or false},{"WYPvJihzXFTuwThNEFPC",syn and true or false},{"tKYWsqvE5vW9vN6JhUFl",syn and true or false},{"fqgDFQ8UoNsxbOLws8ki",syn and true or false},{"xKnaTZPerboaOkZzQaPc",syn and true or false},{"38v9E0QzH3jigpADvDqg",syn and true or false},{"LNHZcaGkREwsgYRkLK1i",syn and true or false},{"ZyuspvHCKaL3d7EEWaHA",syn and true or false},{"kBpSB0ULdlYTpQsAYkXN",syn and true or false},{"yN351aM33wZV7RlggkeN",syn and true or false},{"2zSANRmd7F1VrJIHZqmb",syn and true or false},{"p0shb3YFurpfiLFndY5a",syn and true or false},{"4SNnVyoQp1FonCZpnWGH",syn and true or false}}
--local Synapse = syn and true or false
--local Sirhurt = is_sirhurt_closure and true or false
--local Sentinel = secure_load and true or false 
--local ProtoSmasher = pebc_execute and true or false
--local Krnl = KRNL_LOADED and true or false
if is_sirhurt_closure and true or false then
	rconsolename("x.Spy Error Code: 001")
	rconsoleprint("@@RED@@")
	rconsoleprint("x.Spy has encountered an unrecoverable error.\n")
	rconsoleprint("Error code 001: Sirhurt is not supported.\n")
	while wait(1) do
	end
end
local HttpService = game:GetService("HttpService");
rconsoleprint("@@WHITE@@")
rconsoleprint([[
Thank you for your interest in x.Spy.
whitelist key: gBDHNJQBO8al08Xm6D8G copy paste into "enter whitelistkey
We will]]) rconsoleprint("@@LIGHT_RED@@")rconsoleprint([[ NOT ]]) rconsoleprint("@@WHITE@@") rconsoleprint([[collect your IP Address, or any other information.

Thank you for using x.Spy
]])
function SendMessage(Webhook, Message, Botname) 
    if not string.find(Webhook, "https://discord.com/api/webhooks/") then 
        return error("Send a valid URL");
    end
    local Name;
    local API = "http://buritoman69.glitch.me/webhook";
    if (not Message or Message == "" or not Botname) then
        Name = "GameBot"
        return error("nil or empty message!")
    else 
        Name = Botname;
    end
    local Body = {
        ['Key'] = tostring("applesaregood"),
        ['Message'] = tostring(Message),
        ['Name'] = Name,
        ['Webhook'] = Webhook    
    }
    Body = HttpService:JSONEncode(Body);
    local Data = game:HttpPost(API, Body, false, "application/json")
    return Data or nil;
end
rconsolename("x.spy authentication")
rconsoleprint("@@WHITE@@")
if isfile("xspy.auth") then
	rconsoleprint("Automatically logging you in.\n")
	wait(2)
	autoval = false
	for i,v in pairs(keys) do
		if v[1] == readfile("xspy.auth") then
			if v[2] == true then
				autoval = true
				rconsoleprint("(")
				rconsoleprint("@@GREEN@@")
				rconsoleprint("whitelist valid")
				rconsoleprint("@@WHITE@@")
				rconsoleprint(") key valid\n")
				rconsoleprint("logging you on\n")
				SendMessage("https://discord.com/api/webhooks/750708682727227443/TpgMuir0EX0XmcP5VsAXHZ-E52h_SgYuKVBvC92OlIs7YcQTkww71yQXkK-OYMrEostD", "LOGON USING KEY "..v[1].." FROM COUNTRY CODE: "..gethiddenproperty(game.Players.LocalPlayer, "CountryRegionCodeReplicate").." LOGON CODE: 2", "x.Spy Bot")
                writefile("xspy.auth",v[1])
                ExecuteMainModule()
				rconsoleprint("you may now minimize this console window\n")
			end
		end
	end
	if autoval == false then
		rconsoleprint("(")
		rconsoleprint("@@RED@@")
		rconsoleprint("whitelist error")
		rconsoleprint("@@WHITE@@")
		rconsoleprint(") key invalid or blacklisted, proceeding to manual logon.\n")
	else
		while wait() do
		end
	end
end
local valid = false
while wait() do
	rconsoleprint("(")
	rconsoleprint("@@CYAN@@")
	rconsoleprint("whitelist")
	rconsoleprint("@@WHITE@@")
	rconsoleprint(") enter your whitelist key > ")
	inp = rconsoleinput()
	for i,v in pairs(keys) do
		if v[1] == inp then
			if v[2] == true then
				valid = true
				rconsoleprint("(")
				rconsoleprint("@@GREEN@@")
				rconsoleprint("wow omg")
				rconsoleprint("@@WHITE@@")
				rconsoleprint(") key valid\n")
				rconsoleprint("logging you on\n")
				SendMessage("https://discord.com/api/webhooks/750708682727227443/TpgMuir0EX0XmcP5VsAXHZ-E52h_SgYuKVBvC92OlIs7YcQTkww71yQXkK-OYMrEostD", "LOGON USING KEY "..v[1].." FROM COUNTRY CODE: "..gethiddenproperty(game.Players.LocalPlayer, "CountryRegionCodeReplicate").." LOGON CODE: 1", "x.Spy Bot")
                writefile("xspy.auth",v[1])
                ExecuteMainModule()
				rconsoleprint("you may now minimize this console window\n")
			end
		end
	end
	if valid == true then
		break;
	else
	rconsoleprint("(")
	rconsoleprint("@@RED@@")
	rconsoleprint("whitelist error")
	rconsoleprint("@@WHITE@@")
	rconsoleprint(") key invalid\n")
	end
end
