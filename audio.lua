--[[
Made by Dalk with help from Gui2Lua
This is not meant to be used via loadstring !!!
Down below where it says 'local SongFile = "name.mp3"', replace it with your audio file's name and extension.

]]--

-- Instances:

local SongFile = "name.mp3"

-- you don't have to touch anything below here

local ScreenGui = Instance.new("ScreenGui")
local UI = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Action_Play = Instance.new("ImageButton")
local Action_Pause = Instance.new("ImageButton")
local SongTitle = Instance.new("TextLabel")
local Top = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Name = Instance.new("TextLabel")
local X = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

UI.Name = "UI"
UI.Parent = ScreenGui
UI.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
UI.Position = UDim2.new(0.589716077, 0, 0.332478642, 0)
UI.Size = UDim2.new(0, 320, 0, 303)

UICorner.Parent = UI

Action_Play.Name = "Action_Play"
Action_Play.Parent = UI
Action_Play.BackgroundTransparency = 1.000
Action_Play.LayoutOrder = 6
Action_Play.Position = UDim2.new(0.221875012, 0, 0.665016532, 0)
Action_Play.Size = UDim2.new(0, 50, 0, 50)
Action_Play.ZIndex = 2
Action_Play.Image = "rbxassetid://3926307971"
Action_Play.ImageRectOffset = Vector2.new(764, 244)
Action_Play.ImageRectSize = Vector2.new(36, 36)

Action_Pause.Name = "Action_Pause"
Action_Pause.Parent = UI
Action_Pause.BackgroundTransparency = 1.000
Action_Pause.Position = UDim2.new(0.618749976, 0, 0.665016472, 0)
Action_Pause.Size = UDim2.new(0, 50, 0, 50)
Action_Pause.ZIndex = 2
Action_Pause.Image = "rbxassetid://3926307971"
Action_Pause.ImageRectOffset = Vector2.new(804, 124)
Action_Pause.ImageRectSize = Vector2.new(36, 36)

SongTitle.Name = "SongTitle"
SongTitle.Parent = UI
SongTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SongTitle.BackgroundTransparency = 1.000
SongTitle.Position = UDim2.new(0.0843750015, 0, 0.280528069, 0)
SongTitle.Size = UDim2.new(0, 266, 0, 79)
SongTitle.Font = Enum.Font.Merriweather
SongTitle.Text = SongFile
SongTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SongTitle.TextScaled = true
SongTitle.TextSize = 14.000
SongTitle.TextWrapped = true

Top.Name = "Top"
Top.Parent = UI
Top.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
Top.Size = UDim2.new(0, 320, 0, 49)

UICorner_2.Parent = Top

Name.Name = "Name"
Name.Parent = Top
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.Position = UDim2.new(0, 0, 0.0816326514, 0)
Name.Size = UDim2.new(0, 200, 0, 40)
Name.Font = Enum.Font.Bodoni
Name.Text = "MSH Player"
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.TextScaled = true
Name.TextSize = 14.000
Name.TextWrapped = true

X.Name = "X"
X.Parent = Top
X.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
X.BackgroundTransparency = 1.000
X.Position = UDim2.new(0.859375, 0, 0, 0)
X.Size = UDim2.new(0, 45, 0, 50)
X.Font = Enum.Font.SourceSans
X.Text = "X"
X.TextColor3 = Color3.fromRGB(255, 0, 0)
X.TextScaled = true
X.TextSize = 14.000
X.TextWrapped = true

Song.Name = "Song"
Song.Parent = UI
local getasset = syn and getsynasset or getcustomasset
Song.SoundId = getasset(SongFile)

-- Scripts:

local function IHLU_fake_script() -- Action_Play.Play 
	local script = Instance.new('LocalScript', Action_Play)

	script.Parent.MouseButton1Down:Connect(function()
		if script.Parent.Parent.Song.IsPlaying == true then
			print('Already playing')
		else
			script.Parent.Parent.Song:Play()
		end
	
	end)
end
coroutine.wrap(IHLU_fake_script)()
local function VABVSG_fake_script() -- Action_Pause.Pause 
	local script = Instance.new('LocalScript', Action_Pause)

	script.Parent.MouseButton1Down:Connect(function()
		if script.Parent.Parent.Song.IsPaused == true then
		print('Already paused')
		else
		script.Parent.Parent.Song:Pause()
		end
		
	end)
end
coroutine.wrap(VABVSG_fake_script)()
local function WOGQKH_fake_script() -- X.LocalScript 
	local script = Instance.new('LocalScript', X)

	script.Parent.MouseButton1Down:Connect(function()
		script.Parent.Parent.Parent.Parent:Destroy()
	end)
end
coroutine.wrap(WOGQKH_fake_script)()
local function PJNUJNC_fake_script() -- UI.Dragify 
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
coroutine.wrap(PJNUJNC_fake_script)()
