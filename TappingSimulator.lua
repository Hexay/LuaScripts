--Contact Hexay#4488 if you want to add anything or to report bugs
--Don't skid this, it's a tapping game lol

--values
getgenv().autoTap = false
getgenv().autoRebirth = false
getgenv().autoRebirthAmount = 1
getgenv().autoOpen = false
getgenv().selectedEgg = "Starter"
getgenv().autoOpenEgg = false
getgenv().autoOpenEggNum = 1
getgenv().autoUseTaps = false
getgenv().autoUseLucky = false
getgenv().autoUpgradeRebirth = false
getgenv().autoUpgradeJumps = false
getgenv().autoUpgradeGems = false
getgenv().autoUpgradeStorage = false
getgenv().typeAutoTap = 1
getgenv().autoBoss = true
getgenv().invFullNotifier = false

-- functions

function invFull()
	spawn(function()
		while getgenv().invFullNotifier do
			l__ReplicatedStorage__1 = game:GetService("ReplicatedStorage");
			v15 = require(l__ReplicatedStorage__1.Classes.Player);
			l__LocalPlayer__32 = game:GetService("Players").LocalPlayer;
			u2 = v15.players[l__LocalPlayer__32]
			if u2:getStorage() == u2.data.storage then
				local MessageBox = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/NotificationGUI/main/source.lua"))()
				MessageBox.Show({Position = UDim2.new(0.5,0,0.5,0), Text = "Notification UI", Description = "Your inventory is full\nMade by : Hexay\n", MessageBoxIcon = "Question"})
			end
			wait(10)
		end
	end)
end

function autoUpgradeRebirth()
    spawn(function()
        while getgenv().autoUpgradeRebirth do
			game:GetService("ReplicatedStorage").Events.Upgrade:FireServer("rebirthUpgrades")
            wait(1)       
        end
    end)
end

function autoUpgradeJumps()
    spawn(function()
        while getgenv().autoUpgradeJumps do
			game:GetService("ReplicatedStorage").Events.Upgrade:FireServer("jumps")
            wait(1)       
        end
    end)
end

function autoUpgradeGems()
    spawn(function()
        while getgenv().autoUpgradeGems do
			game:GetService("ReplicatedStorage").Events.Upgrade:FireServer("gemMultiplierUpgrade")
            wait(1)       
        end
    end)
end

function autoUpgradeStorage()
    spawn(function()
        while getgenv().autoUpgradeStorage do
			game:GetService("ReplicatedStorage").Events.Upgrade:FireServer("storageUpgrade")
            wait(1)       
        end
    end)
end

function setUpgradeCost()
	local b = require(game:GetService("ReplicatedStorage").Data.UpgradeData)
	b.jumps.cost = function() return 0 end
	b.jumps.maxLevel = 1000
end

function allTele()
	spawn(function()
		local a = game:GetService("Workspace").Shops
		for i, v in pairs(a:GetChildren()) do
			if a:FindFirstChild(tostring(v)) then
				teleportTo(a:FindFirstChild(tostring(v)).Part.CFrame)
			end
			wait(0.35)
		end
	end)
end

function doTap()
    spawn(function()
        while getgenv().autoTap do
            game:GetService("ReplicatedStorage").Events.Tap:FireServer(getgenv().typeAutoTap)
            wait()
        end
    end)
end

function autoRebirth()
    spawn(function()
        while getgenv().autoRebirth do
            game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(getgenv().autoRebirthAmount)
            wait()       
        end
    end)
end

function openEgg()
    spawn(function()
        while getgenv().autoOpenEgg do
            game:GetService("ReplicatedStorage").Events.HatchEgg:InvokeServer({},getgenv().selectedEgg,getgenv().autoOpenEggNum)
            wait()
        end
    end) 
end

function autoEquipBestPet()
    spawn(function()
        while getgenv().autoEquipBestPet == true do
           print("hey this dont work yet")
		   wait(2)
        end
    end)
end

function teleportTo(placeCFrame)
    local player = game.Players.LocalPlayer;
    if player.Character then
        player.Character.HumanoidRootPart.CFrame = placeCFrame
    end
    return false
end

function claimCodes()
	local codes = {"release", "update4", "update2", "update3", "secret", "magma", "20M", "spooky", "30M", "35M", "40M", "update11ty", "upd12", "fantasy", "45M", "50M", "upd15", "upd16", "space", "50mvisits", "60M", "ididntexpectyoutobeabletoreadbackwards", "15KLIKESTHANKYOU"}
	for i=1,#codes do
		game:GetService("ReplicatedStorage").Events.ClaimCode:FireServer(codes[i])
	end
end

function autoBoss()
	spawn(function()
		while getgenv().autoBoss do
			game:GetService("ReplicatedStorage").Events.StartBossFight:FireServer()
			wait(1)
		end
	end)
end


--Teleport locations
locations = {}
locations["Spawn Island"] = game:GetService("Workspace").Shops.Starter.Part
locations["Forest Island"] = game:GetService("Workspace").Shops["Forest Egg"].Part
locations["Flower Island"] = game:GetService("Workspace").Shops["Flower Egg Robux"].Part
locations["Swamp Island"] = game:GetService("Workspace").Shops["Swamp Egg"].Part
locations["Snow Island"] = game:GetService("Workspace").Shops["Snow Egg"].Part
locations["Desert Island"] = game:GetService("Workspace").Shops["Desert Egg"].Part
locations["Death Island"] = game:GetService("Workspace").Shops["Death Egg"].Part
locations["Beach Island"] = game:GetService("Workspace").Shops["Beach Egg"].Part
locations["Mines Island"] = game:GetService("Workspace").Shops["Mine Egg"].Part
locations["Cloud Island"] = game:GetService("Workspace").Shops["Cloud Egg"].Part
locations["Coral Island"] = game:GetService("Workspace").Shops["Coral Egg"].Part
locations["Darkheart Island"] = game:GetService("Workspace").Shops["Dark Egg"].Part

flameworldIsland = {}
flameworldIsland["Flame World Island Spawn"] = game:GetService("Workspace").Shops["Molten Egg"].Part
flameworldIsland["Molten Island"] = game:GetService("Workspace").Shops["Magma Egg"].Part
flameworldIsland["Blue Magma Island"] = game:GetService("Workspace").Shops["Blue Magma Egg"].Part
flameworldIsland["Purple Magma Island"] = game:GetService("Workspace").Shops["Purple Magma Egg"].Part
flameworldIsland["Yellow Magma Island"] = game:GetService("Workspace").Shops["Yellow Magma Egg"].Part
flameworldIsland["Red Magma Island"] = game:GetService("Workspace").Shops["Red Magma Egg"].Part

fantasyIsland = {}
fantasyIsland["Fantasy Island Spawn"] = game:GetService("Workspace").Shops["Holy Bee Egg"].Part
fantasyIsland["Castle"] = game:GetService("Workspace").Shops["Castle Egg"].Part
fantasyIsland["Candy Island"] = game:GetService("Workspace").Shops["Candy Egg"].Part
fantasyIsland["Festival Island"] = game:GetService("Workspace").Shops["Festival Egg"].Part
fantasyIsland["Japanese Fall"] = game:GetService("Workspace").Shops["Japan Egg"].Part

halloweenIsland = {}
halloweenIsland["Halloween Hub"] = game:GetService("Workspace").Shops["Halloween Egg"].Part
halloweenIsland["Spooky Island"] = game:GetService("Workspace").Shops["Spooky Egg"].Part
halloweenIsland["Nightmare Island"] = game:GetService("Workspace").Shops["Halloween Dominus Egg"].Part
halloweenIsland["Pumpkin Island"] = game:GetService("Workspace").Shops["Pumpkin Egg"].Part

space = {}
space["Space hub"] = game:GetService("Workspace").Shops["Alien Egg"].Part
space["Frost Space"] = game:GetService("Workspace").Shops["Frost Alien Egg"].Part
space["Toxic Planet"] = game:GetService("Workspace").Shops["Toxic Alien Egg"].Part
space["Asteroid Space"] = game:GetService("Workspace").Shops["Asteroid Egg"].Part
space["Scrapyard"] = game:GetService("Workspace").Shops["Scrapyard Egg"].Part

machines = {}
machines["Rainbow Machine"] = game:GetService("Workspace").Proximity.RainbowMachine
machines["Shiny Machine"] = game:GetService("Workspace").Proximity.ShinyMachine

spawnKeys = {}
for i in pairs(locations) do
    index = table.getn(spawnKeys)+1
    spawnKeys[index] = i
end


flameKeys = {}
for i in pairs(flameworldIsland) do
    index = table.getn(flameKeys)+1
    flameKeys[index] = i
end

fantasyKeys = {}
for i in pairs(fantasyIsland) do
    index = table.getn(fantasyKeys)+1
    fantasyKeys[index] = i
end

halKeys = {}
for i in pairs(halloweenIsland) do
    index = table.getn(halKeys)+1
    halKeys[index] = i
end

spaceKeys = {}
for i in pairs(space) do
    index = table.getn(spaceKeys)+1
    spaceKeys[index] = i
end

macKeys = {}
for i in pairs(machines) do
    index = table.getn(macKeys)+1
    macKeys[index] = i
end
--ui
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Tapping Simulator", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local Tab = Window:MakeTab({
    Name = "Main farming",
    Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local FarmTab = Tab:AddSection({
	Name = "Farming"
})

FarmTab:AddToggle({
	Name = "Auto Tap",
	Default = false,
	Callback = function(Value)
		getgenv().autoTap = Value
        doTap()
	end    
})

typesTap = {}
typesTap["Normal Taps"] = 1
typesTap["Flame World Coins"] = 2
typesTap["Fantasy Coins"] = 3
typesTap["Space Coins"] = 4
typesTap["Candy"] = 5

FarmTab:AddDropdown({
	Name = "Types of tap",
	Default = "1",
	Options = {"Normal Taps", "Flame World Coins", "Fantasy Coins", "Space Coins", "Candy"},
	Callback = function(Value)
		getgenv().typeAutoTap = typesTap[Value]
	end    
})

local rebirth = Tab:AddSection({
	Name = "Auto Rebirth"
})

rebirth:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		getgenv().autoRebirth = Value
        autoRebirth()
	end    
})

rebirth:AddTextbox({
	Name = "Rebirth Amount (highest one in rebirth tab)",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		getgenv().autoRebirthAmount = Value
	end	  
})

rebirth:AddButton({
	Name = "Current auto rebirth number",
	Callback = function()
      		print(getgenv().autoRebirthAmount)
  	end    
})

FarmTab:AddToggle({
	Name = "Debug menu",
	Default = false,
	Callback = function(Value)
		debug1 = require(game:GetService("ReplicatedStorage").Classes.DebugMenu)
		if Value then
			debug1.new()
		else
			debug1.close()
		end
	end
})

FarmTab:AddButton({
	Name = "Claim Daily Reward",
	Default = false,
	Callback = function(Value)
		game:GetService("ReplicatedStorage").Events.OpenDailyReward:InvokeServer()
	end
})

FarmTab:AddButton({
	Name = "Infinite 3x coin boost",
	Default = false,
	Callback = function(Value)
		game:GetService("ReplicatedStorage").Events.VerifyTwitterBoost:FireServer("asd")
	end
})

FarmTab:AddButton({
	Name = "Claim all codes",
	Default = false,
	Callback = function(Value)
		claimCodes()
	end
})


local AutoBoss = Tab:AddSection({
	Name = "AutoBoss"
})

AutoBoss:AddToggle({
	Name = "Auto start boss (costs 50b gems)",
	Default = false,
	Callback = function(Value)
		getgenv().autoBoss = Value
		autoBoss()
	end    
})

Tab:AddLabel("Made by Hexay#4488")
local PetsTab = Window:MakeTab({
    Name = "Pets",
    Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

PetsTab:AddParagraph("Must have enough to buy the egg","*There are different currencies*")

local openeggs = PetsTab:AddSection({
	Name = "Eggs"
})

openeggs:AddToggle({
	Name = "Auto Open Egg",
	Default = false,
	Callback = function(Value)
		getgenv().autoOpenEgg = Value
        openEgg()
	end    
})

openeggs:AddToggle({
	Name = "3 egg gamepass",
	Default = false,
	Callback = function(Value)
		if Value then
			getgenv().autoOpenEggNum = 3
		else
			getgenv().autoOpenEggNum = 1
		end
        openEgg()
	end    
})

openeggs:AddToggle({
	Name = "4 egg gamepass",
	Default = false,
	Callback = function(Value)
		if Value then
			getgenv().autoOpenEggNum = 4
		else
			getgenv().autoOpenEggNum = 1
		end
        openEgg()
	end    
})

b = {}
for i, v in pairs(game:GetService("Workspace").Shops:GetChildren()) do
    b[i] = tostring(v)
end

openeggs:AddDropdown({
	Name = "Select egg",
	Default = "1",
	Options = b,
	Callback = function(Value)
		getgenv().selectedEgg = Value
	end    
})

local invNotifier = PetsTab:AddSection({
	Name = "Help"
})

invNotifier:AddToggle({
	Name = "Inventory Full Notifier",
	Default = false,
	Callback = function(Value)
		getgenv().invFullNotifier = Value
		invFull()
	end    
})

PetsTab:AddLabel("Made by Hexay#4488")

local Teleports = Window:MakeTab({
    Name = "Teleports",
    Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Teleports:AddParagraph("Go to scrap land (in space) for high area multi","Go spawn islands for upgrades")

local AllTele = Teleports:AddSection({
	Name = "Teleport to all (unlock all)"
})

AllTele:AddButton({
	Name = "Tele all",
	Default = false,
	Callback = function(Value)
        allTele()
	end    
})


local Spawn = Teleports:AddSection({
	Name = "Spawn"
})
Spawn:AddDropdown({
	Name = "Spawn Island",
	Default = "1",
	Options = spawnKeys,
	Callback = function(Value)
        CFrame = locations[Value].CFrame
        teleportTo(CFrame)
		print(Value)
	end    
})

local Flame = Teleports:AddSection({
	Name = "Flame"
})
Flame:AddDropdown({
	Name = "Flame World Island",
	Default = "1",
	Options = flameKeys,
	Callback = function(Value)
        CFrame = flameworldIsland[Value].CFrame
        teleportTo(CFrame)
		print(Value)
	end    
})

local Fantasy = Teleports:AddSection({
	Name = "Fantasy"
})
Fantasy:AddDropdown({
	Name = "Fantasy Island",
	Default = "1",
	Options = fantasyKeys,
	Callback = function(Value)
        CFrame = fantasyIsland[Value].CFrame
        teleportTo(CFrame)
		print(Value)
	end    
})

local Halloween = Teleports:AddSection({
	Name = "Halloween"
})
Halloween:AddDropdown({
	Name = "Halloween Island",
	Default = "1",
	Options = halKeys,
	Callback = function(Value)
        CFrame = halloweenIsland[Value].CFrame
        teleportTo(CFrame)
		print(Value)
	end    
})

local Space = Teleports:AddSection({
	Name = "Space"
})

Space:AddDropdown({
	Name = "Space Island",
	Default = "1",
	Options = spaceKeys,
	Callback = function(Value)
        CFrame = space[Value].CFrame
        teleportTo(CFrame)
		print(Value)
	end    
})

local Machine = Teleports:AddSection({
	Name = "Machines"
})

Machine:AddDropdown({
	Name = "Machines (use space hub tele for all ^^)",
	Default = "1",
	Options = macKeys,
	Callback = function(Value)
        CFrame = machines[Value].CFrame
        teleportTo(CFrame)
		print(Value)
	end    
})
Teleports:AddLabel("Made by Hexay#4488")
local UpgradeBypass = Window:MakeTab({
    Name = "Upgrade",
    Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

UpgradeBypass:AddParagraph("Infinite amount of Jumps","Upgrades cost 0")

local Jump = UpgradeBypass:AddSection({
	Name = "Free Upgrade"
})

Jump:AddButton({
	Name = "Set the cost of jump to 0",
	Callback = function()
      		setUpgradeCost()
  	end    
})
UpgradeBypass:AddParagraph("Upgrades do go through","But you need to relog for them to show")

local Autos = UpgradeBypass:AddSection({
	Name = "Auto upgrades"
})

Autos:AddToggle({
	Name = "Auto upgrade rebirth amount",
	Callback = function(Value)
		getgenv().autoUpgradeRebirth = Value
		autoUpgradeRebirth()
	end
})

Autos:AddToggle({
	Name = "Auto upgrade jumps",
	Callback = function(Value)
		getgenv().autoUpgradeJumps = Value
		autoUpgradeJumps()
	end
})

Autos:AddToggle({
	Name = "Auto upgrade gems",
	Callback = function(Value)
		getgenv().autoUpgradeGems = Value
		autoUpgradeGems()
	end
})

Autos:AddToggle({
	Name = "Auto upgrade storage",
	Callback = function(Value)
		getgenv().autoUpgradeStorage = Value
		autoUpgradeStorage()
	end
})

UpgradeBypass:AddLabel("Made by Hexay#4488")


OrionLib:Init()

