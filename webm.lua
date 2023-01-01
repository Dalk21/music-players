--[[
Made by Dalk with help from Gui2Lua
This script supports all executors with getcustomasset or getsynasset.
Script is not made to be used via loadstring !!!
Down below where it says 'local SongFile = "name.webm"', replace it with your file's name.

]]--
-- Instances:

local FileName = "name.webm"

-- you don't have to touch anything below here

local ScreenGui = Instance.new("ScreenGui")
local UI = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UICorner2 = Instance.new("UICorner")
local X = Instance.new("TextButton")
local Action_Play = Instance.new("ImageButton")
local Action_Pause = Instance.new("ImageButton")
local Video = Instance.new('VideoFrame')

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

UI.Name = "UI"
UI.Parent = ScreenGui
UI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UI.BackgroundTransparency = 1.000
UI.Position = UDim2.new(0.0455275849, 0, 0.257264972, 0)
UI.Size = UDim2.new(0, 854, 0, 489)

Title.Name = "Title"
Title.Parent = UI
Title.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
Title.Position = UDim2.new(-0.00833658781, 0, 0.897137046, 0)
Title.Size = UDim2.new(0, 854, 0, 114)
Title.Font = Enum.Font.SourceSans
Title.Text = "MSH Video Player: " .. FileName
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

UICorner.Parent = Title

X.Name = "X"
X.Parent = UI
X.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
X.BackgroundTransparency = 1.000
X.Position = UDim2.new(0.948477745, 0, 0.906841397, 0)
X.Size = UDim2.new(0, 36, 0, 45)
X.Font = Enum.Font.SourceSans
X.Text = "X"
X.TextColor3 = Color3.fromRGB(255, 0, 0)
X.TextScaled = true
X.TextSize = 14.000
X.TextWrapped = true

Action_Play.Name = "Action_Play"
Action_Play.Parent = UI
Action_Play.BackgroundTransparency = 1.000
Action_Play.LayoutOrder = 6
Action_Play.Position = UDim2.new(-0.00936768204, 0, 1.02760732, 0)
Action_Play.Size = UDim2.new(0, 50, 0, 50)
Action_Play.ZIndex = 2
Action_Play.Image = "rbxassetid://3926307971"
Action_Play.ImageRectOffset = Vector2.new(764, 244)
Action_Play.ImageRectSize = Vector2.new(36, 36)

Action_Pause.Name = "Action_Pause"
Action_Pause.Parent = UI
Action_Pause.BackgroundTransparency = 1.000
Action_Pause.Position = UDim2.new(0.0491803251, 0, 1.02760732, 0)
Action_Pause.Size = UDim2.new(0, 50, 0, 50)
Action_Pause.ZIndex = 2
Action_Pause.Image = "rbxassetid://3926307971"
Action_Pause.ImageRectOffset = Vector2.new(804, 124)
Action_Pause.ImageRectSize = Vector2.new(36, 36)

Video.Name = "Video"
Video.Parent = UI
Video.BackgroundTransparency = 0 
Video.Position = UDim2.new(-0.008, 0,-0.002, 0)
Video.Size = UDim2.new(0, 854,0, 440)
Video.ZIndex = 2

local getasset = syn and getsynasset or getcustomasset
Video.Video = getasset(FileName)
	
UICorner2.Parent = Video


-- Scripts:

local function OEKPIY_fake_script() -- X.Close 
	local script = Instance.new('LocalScript', X)

	script.Parent.MouseButton1Down:Connect(function()
		script.Parent.Parent:Destroy()
	end)
end
coroutine.wrap(OEKPIY_fake_script)()
local function DYFM_fake_script() -- Action_Play.Play 
	local script = Instance.new('LocalScript', Action_Play)

	script.Parent.MouseButton1Down:Connect(function()
		if script.Parent.Parent.Video.Playing == false then
			script.Parent.Parent.Video:Play()
		else
			print('Already playing')
		end
	end)
end
coroutine.wrap(DYFM_fake_script)()
local function YLSD_fake_script() -- Action_Pause.Pause 
	local script = Instance.new('LocalScript', Action_Pause)

	script.Parent.MouseButton1Down:Connect(function()
		if script.Parent.Parent.Video.Playing == true then
			script.Parent.Parent.Video:Pause()
		else
			print('Already paused')
		end
	end)
end
coroutine.wrap(YLSD_fake_script)()
local function KQWC_fake_script() -- UI.Dragify 
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
coroutine.wrap(KQWC_fake_script)()
