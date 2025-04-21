_G.AutoBubble = true
_G.AutoSell = true
_G.AutoCollectables = true
_G.AutoTimeRewards = true
_G.AutoFreeWheelSpin = true

function AutoBubble()
    while _G.AutoBubble == true do
        local ohString1 = "BlowBubble"
        game:GetService("ReplicatedStorage").Shared.Framework.Network.Remote.Event:FireServer(ohString1)
        wait(0.5)
    end
end
function AutoSell()
    while _G.AutoSell == true do
        local ohString1 = "SellBubble"
        game:GetService("ReplicatedStorage").Shared.Framework.Network.Remote.Event:FireServer(ohString1)
        wait(1)
    end
end
function AutoCollectables()
    while _G.AutoCollectables == true do
        local folder = workspace.Rendered:GetChildren()[14]
        for _, coin in ipairs(folder:GetChildren()) do
            if coin:IsA("Model") then
                game:GetService("ReplicatedStorage").Remotes.Pickups.CollectPickup:FireServer(coin.Name)
                coin:Destroy()
            end
        end
        wait(0.5)
    end
end

function AutoTimeRewards()
    while _G.AutoTimeRewards do
        for i = 1, 9 do
            local ohString1 = "ClaimPlaytime"
            local ohNumber2 = i
            pcall(function()
                game:GetService("ReplicatedStorage").Shared.Framework.Network.Remote.Function:InvokeServer(ohString1, ohNumber2)
            end)
            wait(0.2)
        end
        wait(10)
    end
end

function AutoFreeWheelSpin()
    while _G.AutoFreeWheelSpin do
        local ohString1 = "ClaimFreeWheelSpin"
        game:GetService("ReplicatedStorage").Shared.Framework.Network.Remote.Event:FireServer(ohString1)
        wait(30)
    end
end





local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()

local Window = WindUI:CreateWindow({
    Title = "OxyHub b.0",
    Icon = "door-open",
    Author = "Bubble Gum Simulator INFINITY",
    Folder = "OxyHub",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    UserEnabled = false,
    SideBarWidth = 200,
    HasOutline = true,
    KeySystem = { 
        Key = { "1234", "5678" },
        Note = "Example Key System. \n\nThe Key is '1234' or '5678",
        URL = "https://github.com/Footagesus/WindUI", -- remove this if the key is not obtained from the link.
        SaveKey = true, -- optional
    },
})

local Home = Window:Tab({
    Title = "Home",
    Icon = "house",
})
local Farming = Window:Tab({
    Title = "Farming",
    Icon = "bolt",
})

local Auto = Window:Tab({
    Title = "Auto",
    Icon = "badge",
})

local Misc = Window:Tab({
    Title = "Misc",
    Icon = "badge",
})

local AutoBubble = Farming:Toggle({
    Title = "Auto Bubble",
    Desc = "auto bubble? idk",
    Icon = "badge-check",
    Value = false,
    Callback = function(state)
        _G.AutoBubble = state
        AutoBubble()
    end,
})

local AutoSell = Farming:Toggle({
    Title = "Auto Sell",
    Desc = "",
    Icon = "badge-check",
    Value = false,
    Callback = function(state)
        _G.AutoSell = state
        AutoSell()
    end,
})

local AutoCollectables = Farming:Toggle({
    Title = "Auto Collectables",
    Desc = "",
    Icon = "badge-check",
    Value = false,
    Callback = function(state)
        _G.AutoCollectables = state
        AutoCollectables()
    end,
})


-----

local AutoTimeRewards = Auto:Toggle({
    Title = "Auto Time Rewards",
    Desc = "",
    Icon = "badge-check",
    Value = false,
    Callback = function(state)
        _G.AutoTimeRewards = state
        AutoTimeRewards()
    end,
})

local AutoFreeWheelSpin = Auto:Toggle({
    Title = "Auto Free Wheel Spin",
    Desc = "",
    Icon = "badge-check",
    Value = false,
    Callback = function(state)
        _G.AutoFreeWheelSpin = state
        AutoFreeWheelSpin()
    end,
})

local Button = Misc:Button({
    Title = "Unlock All Islands",
    Desc = "It may not work the first time, you can press it several times.",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local positions = {
            Vector3.new(13.468178749084473, 419.5645751953125, 172.32684326171875),
            Vector3.new(13.468178749084473, 2657.522216796875, -21.623199462890625),
            Vector3.new(15.468177795410156, 10138.1259765625, 84.57681274414062),
            Vector3.new(-61.83951950073242, 6859.0283203125, 79.18429565429688),
            Vector3.new(15.869709014892578, 15969.40234375, -34.507904052734375)
        }
        for _, pos in ipairs(positions) do
            humanoidRootPart.CFrame = CFrame.new(pos)
            wait(1)
        end
    end,
})
