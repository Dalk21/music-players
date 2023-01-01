--[[
Made by Dalk with help from Gui2Lua
Part of the Swift Script Series
How it works:
Instructions no longer needed, you can just run the script.

"Bad Apple!!" is the sixth track in the soundtrack of the 1998 bullet hell video game Lotus Land Story, the fourth entry in the Touhou Project series created by Team Shanghai Alice.
This is a remix of the song from 2007/08.

]]--

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local UI = Instance.new("Frame")
local X = Instance.new("TextButton")
local Pl = Instance.new("TextButton")
local Pa = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UICorner2 = Instance.new("UICorner")
local Re = Instance.new("TextButton")
local Video = Instance.new('VideoFrame')
local getasset = syn and getsynasset or getcustomasset

if getasset then
    if not isfile('bad_apple.webm') then
        print('downloading video file...')
        writefile('bad_apple.webm',game:HttpGet('https://github.com/Dalk21/music-players/raw/main/bad-apple/bad_apple.webm'))
        repeat task.wait() until isfile('bad_apple.webm')
    end
    repeat pcall(function() Video.Video = getasset('bad_apple.webm') end) until pcall(function() Video.Video = getasset('bad_apple.webm') end)
end

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

UI.Name = "UI"
UI.Parent = ScreenGui
UI.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
UI.Position = UDim2.new(0.372679681, 0, 0.216867477, 0)
UI.Size = UDim2.new(0, 959, 0, 762)

X.Name = "X"
X.Parent = UI
X.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
X.BackgroundTransparency = 1.000
X.Position = UDim2.new(0.973197997, 0, 0.944572926, 0)
X.Size = UDim2.new(0, 24, 0, 42)
X.Font = Enum.Font.SourceSans
X.Text = "X"
X.TextColor3 = Color3.fromRGB(255, 0, 0)
X.TextScaled = true
X.TextSize = 14.000
X.TextWrapped = true

Pl.Name = "Pl"
Pl.Parent = UI
Pl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Pl.BackgroundTransparency = 1.000
Pl.Position = UDim2.new(-0.00104275288, 0, 0.943367362, 0)
Pl.Size = UDim2.new(0, 89, 0, 43)
Pl.Font = Enum.Font.SourceSans
Pl.Text = "Play"
Pl.TextColor3 = Color3.fromRGB(255, 255, 255)
Pl.TextScaled = true
Pl.TextSize = 14.000
Pl.TextWrapped = true

Pa.Name = "Pa"
Pa.Parent = UI
Pa.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Pa.BackgroundTransparency = 1.000
Pa.Position = UDim2.new(0.0917622522, 0, 0.943367362, 0)
Pa.Size = UDim2.new(0, 89, 0, 43)
Pa.Font = Enum.Font.SourceSans
Pa.Text = "Pause"
Pa.TextColor3 = Color3.fromRGB(255, 255, 255)
Pa.TextScaled = true
Pa.TextSize = 14.000
Pa.TextWrapped = true

UICorner.Parent = UI

Re.Name = "Re"
Re.Parent = UI
Re.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Re.BackgroundTransparency = 1.000
Re.Position = UDim2.new(0.201251298, 0, 0.943367362, 0)
Re.Size = UDim2.new(0, 110, 0, 43)
Re.Font = Enum.Font.SourceSans
Re.Text = "Restart"
Re.TextColor3 = Color3.fromRGB(255, 255, 255)
Re.TextScaled = true
Re.TextSize = 14.000
Re.TextWrapped = true

Video.Name = "Video"
Video.Parent = UI
Video.BackgroundTransparency = 0 
Video.Position = UDim2.new(0,0,-0.002,0)
Video.Size = UDim2.new(0, 959,0, 720)
Video.ZIndex = 2

UICorner2.Parent = Video

-- Scripts:

local function YFAH_fake_script() -- X.Close 
	local script = Instance.new('LocalScript', X)

	script.Parent.MouseButton1Down:Connect(function()
		script.Parent.Parent:Destroy()
	end)
end
coroutine.wrap(YFAH_fake_script)()
local function XHMFZSS_fake_script() -- Pl.Pla 
	local script = Instance.new('LocalScript', Pl)

	script.Parent.MouseButton1Down:Connect(function()
		script.Parent.Parent.Video:Play()
	end)
end
coroutine.wrap(XHMFZSS_fake_script)()
local function IGDDCBW_fake_script() -- UI.Dragify 
	local script = Instance.new('LocalScript', UI)

	local UIS = game:GetService("UserInputService")
	function dragify(Frame)
		dragToggle = nil
		dragSpeed = 0.15
		dragInput = nil
		dragStart = nil
		dragPos = nil
		function updateInput(input)
			Delta = input.Position - dragStart
			Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.15), {Position = Position}):Play()
		end
		Frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
				dragToggle = true
				dragStart = input.Position
				startPos = Frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
		Frame.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if input == dragInput and dragToggle then
				updateInput(input)
			end
		end)
	end
	dragify(script.Parent)
	
end
coroutine.wrap(IGDDCBW_fake_script)()
local function JQOI_fake_script() -- Pa.Pau 
	local script = Instance.new('LocalScript', Pa)

	script.Parent.MouseButton1Down:Connect(function()
		script.Parent.Parent.Video:Pause()
	end)
end
coroutine.wrap(JQOI_fake_script)()
local function NSAJXEI_fake_script() -- Re.Res 
	local script = Instance.new('LocalScript', Re)

	script.Parent.MouseButton1Down:Connect(function()
		script.Parent.Parent.Video.TimePosition = 0
	end)
end
coroutine.wrap(NSAJXEI_fake_script)()
