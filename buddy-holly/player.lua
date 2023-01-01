--[[
Made by Dalk with help from Gui2Lua
This script works with all exploits that support getsynasset and getcustomasset.
Part of the Swift Script Series
How it works:
Load the script, it will download the video and play.

This script replicates a Windows 95 Media Player with the Buddy Holly video from Weezer open.
In the 90's, this was actually a reality.
On the Windows 95 Installation CD there was a folder called "FUNSTUFF".
In this folder, contained the music video.
This is rumored to be a part of their success.
It was special that they had their biggest success on their debut album.
Fun fact: The album was untitled, but Geffen had to name it, so they chose "Weezer".

]]--
-- Instances:

-- you don't have to touch anything below here

local ScreenGui = Instance.new("ScreenGui")
local UI = Instance.new("ImageLabel")
local X = Instance.new("TextButton")
local Action_Play = Instance.new("ImageButton")
local Action_Stop = Instance.new("ImageButton")
local Video = Instance.new('VideoFrame')
local getasset = syn and getsynasset or getcustomasset

if getasset then
    if not isfile('buddy_holly.webm') then
        print('downloading video file...')
        writefile('buddy_holly.webm',game:HttpGet('https://github.com/Dalk21/music-players/raw/main/buddy-holly/Buddy_Holly-Weezer.webm'))
        repeat task.wait() until isfile('buddy_holly.webm')
    end
    repeat pcall(function() Video.Video = getasset('buddy_holly.webm') end) until pcall(function() Video.Video = getasset('buddy_holly.webm') end)
end

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

UI.Name = "UI"
UI.Parent = ScreenGui
UI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UI.Position = UDim2.new(0.0417782553, 0, 0.256410271, 0)
UI.Size = UDim2.new(0, 559, 0, 519)
UI.Image = "http://www.roblox.com/asset/?id=11340155950"

X.Name = "X"
X.Parent = UI
X.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
X.BackgroundTransparency = 1.000
X.Position = UDim2.new(0.937744379, 0, 0.0128144426, 0)
X.Size = UDim2.new(0, 26, 0, 22)
X.Font = Enum.Font.SourceSans
X.Text = " "
X.TextColor3 = Color3.fromRGB(255, 0, 0)
X.TextScaled = true
X.TextSize = 14.000
X.TextWrapped = true

Action_Play.Name = "Action_Play"
Action_Play.Parent = UI
Action_Play.BackgroundTransparency = 1
Action_Play.LayoutOrder = 6
Action_Play.Position = UDim2.new(0.138625771, 0, 0.931268275, 0)
Action_Play.Size = UDim2.new(0, 27, 0, 29)
Action_Play.ZIndex = 2
Action_Play.Image = "rbxassetid://3926307971"
Action_Play.ImageRectOffset = Vector2.new(764, 244)
Action_Play.ImageRectSize = Vector2.new(36, 36)
Action_Play.ImageTransparency = 1.000

Action_Stop.Name = "Action_Stop"
Action_Stop.Parent = UI
Action_Stop.BackgroundTransparency = 1.000
Action_Stop.LayoutOrder = 6
Action_Stop.Position = UDim2.new(0.197659761, 0, 0.931268275, 0)
Action_Stop.Size = UDim2.new(0, 24, 0, 29)
Action_Stop.ZIndex = 2
Action_Stop.Image = "rbxassetid://3926307971"
Action_Stop.ImageRectOffset = Vector2.new(764, 244)
Action_Stop.ImageRectSize = Vector2.new(36, 36)
Action_Stop.ImageTransparency = 1.000

Video.Name = "Video"
Video.Parent = UI
Video.BackgroundTransparency = 0 
Video.Position = UDim2.new(0.012, 0,0.072, 0)
Video.Size = UDim2.new(0, 544,0, 360)
Video.ZIndex = 2

-- Scripts:

local function DJVNI_fake_script() -- X.Close 
	local script = Instance.new('LocalScript', X)

	script.Parent.MouseButton1Down:Connect(function()
		script.Parent.Parent:Destroy()
	end)
end
coroutine.wrap(DJVNI_fake_script)()
local function IHERM_fake_script() -- Action_Play.Play 
	local script = Instance.new('LocalScript', Action_Play)

	script.Parent.MouseButton1Down:Connect(function()
		if script.Parent.Parent.Video.Playing == false then
			script.Parent.Parent.Video:Play()
		else
			script.Parent.Parent.Video:Pause()
		end
	end)
end
coroutine.wrap(IHERM_fake_script)()
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
local function GZQW_fake_script() -- Action_Stop.Play 
	local script = Instance.new('LocalScript', Action_Stop)

	script.Parent.MouseButton1Down:Connect(function()
		script.Parent.Parent.Video.TimePosition = 0
	end)
end
coroutine.wrap(GZQW_fake_script)()
