local TweenService = game:GetService("TweenService")
local Root = script.Parent.Parent
local Creator = require(Root.Creator)

local New = Creator.New
local Components = Root.Components

local Element = {}
Element.__index = Element
Element.__type = "Checkbox"

function Element:New(Idx, Config)
	local Library = self.Library
	assert(Config.Title, "Checkbox - Missing Title")

	local Checkbox = {
		Value = Config.Default or false,
		Callback = Config.Callback or function(Value) end,
		Type = "Checkbox",
	}

	local CheckboxFrame = require(Components.Element)(Config.Title, Config.Description, self.Container, true)
	
	Checkbox.SetTitle = CheckboxFrame.SetTitle
	Checkbox.SetDesc = CheckboxFrame.SetDesc

	local CheckIcon = New("Frame", {
		Size = UDim2.fromOffset(20, 20),
		Position = UDim2.new(1, -30, 0.5, 0),
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundColor3 = Color3.fromRGB(40, 42, 50),
		Parent = CheckboxFrame.Frame,
		ThemeTag = {
			BackgroundColor3 = "Input",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 4),
		}),
		New("UIStroke", {
			Transparency = 0.5,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			ThemeTag = {
				Color = "InElementBorder",
			},
		}),
		New("ImageLabel", {
			Size = UDim2.fromOffset(14, 14),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Image = "rbxassetid://10709755989",
			ImageTransparency = Checkbox.Value and 0 or 1,
			ThemeTag = {
				ImageColor3 = "Accent",
			},
		}),
	})

	local function UpdateCheckbox()
		local CheckImage = CheckIcon.ImageLabel
		if Checkbox.Value then
			TweenService:Create(CheckImage, TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
				ImageTransparency = 0
			}):Play()
			Creator.OverrideTag(CheckIcon, { 
				BackgroundColor3 = "Accent" 
			})
		else
			TweenService:Create(CheckImage, TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
				ImageTransparency = 1
			}):Play()
			Creator.OverrideTag(CheckIcon, { 
				BackgroundColor3 = "Input" 
			})
		end
	end

	Creator.AddSignal(CheckboxFrame.Frame.MouseButton1Click, function()
		Checkbox.Value = not Checkbox.Value
		UpdateCheckbox()
		Library:SafeCallback(Checkbox.Callback, Checkbox.Value)
		Library:SafeCallback(Checkbox.Changed, Checkbox.Value)
	end)

	function Checkbox:OnChanged(Func)
		Checkbox.Changed = Func
		Func(Checkbox.Value)
	end

	function Checkbox:SetValue(NewValue)
		Checkbox.Value = NewValue
		UpdateCheckbox()
		Library:SafeCallback(Checkbox.Callback, Checkbox.Value)
		Library:SafeCallback(Checkbox.Changed, Checkbox.Value)
	end

	function Checkbox:Destroy()
		CheckboxFrame:Destroy()
		Library.Options[Idx] = nil
	end

	UpdateCheckbox()

	Library.Options[Idx] = Checkbox
	return Checkbox
end

return Element
