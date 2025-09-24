local UserInputService = game:GetService("UserInputService")
local Root = script.Parent.Parent
local Creator = require(Root.Creator)

local New = Creator.New
local Components = Root.Components

local Element = {}
Element.__index = Element
Element.__type = "RangeSlider"

function Element:New(Idx, Config)
	local Library = self.Library
	assert(Config.Title, "RangeSlider - Missing Title.")
	assert(Config.Default, "RangeSlider - Missing default value.")
	assert(Config.Min, "RangeSlider - Missing minimum value.")
	assert(Config.Max, "RangeSlider - Missing maximum value.")
	assert(Config.Rounding, "RangeSlider - Missing rounding value.")

	local RangeSlider = {
		Value = Config.Default or {Config.Min, Config.Max},
		Min = Config.Min,
		Max = Config.Max,
		Rounding = Config.Rounding,
		Callback = Config.Callback or function(Value) end,
		Type = "RangeSlider",
	}

	local DraggingMin = false
	local DraggingMax = false

	local SliderFrame = require(Components.Element)(Config.Title, Config.Description, self.Container, false)
	SliderFrame.DescLabel.Size = UDim2.new(1, -170, 0, 14)

	RangeSlider.SetTitle = SliderFrame.SetTitle
	RangeSlider.SetDesc = SliderFrame.SetDesc

	local MinSliderDot = New("ImageLabel", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, -7, 0.5, 0),
		Size = UDim2.fromOffset(14, 14),
		Image = "http://www.roblox.com/asset/?id=12266946128",
		ThemeTag = {
			ImageColor3 = "Accent",
		},
	})

	local MaxSliderDot = New("ImageLabel", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(1, -7, 0.5, 0),
		Size = UDim2.fromOffset(14, 14),
		Image = "http://www.roblox.com/asset/?id=12266946128",
		ThemeTag = {
			ImageColor3 = "Accent",
		},
	})

	local SliderRail = New("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(7, 0),
		Size = UDim2.new(1, -14, 1, 0),
	}, {
		MinSliderDot,
		MaxSliderDot,
	})

	local SliderFill = New("Frame", {
		Size = UDim2.new(0, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		ThemeTag = {
			BackgroundColor3 = "Accent",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(1, 0),
		}),
	})

	local SliderDisplay = New("TextLabel", {
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
		Text = "0 - 100",
		TextSize = 12,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Right,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 100, 0, 14),
		Position = UDim2.new(0, -4, 0.5, 0),
		AnchorPoint = Vector2.new(1, 0.5),
		ThemeTag = {
			TextColor3 = "SubText",
		},
	})

	local SliderInner = New("Frame", {
		Size = UDim2.new(1, 0, 0, 4),
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -10, 0.5, 0),
		BackgroundTransparency = 0.4,
		Parent = SliderFrame.Frame,
		ThemeTag = {
			BackgroundColor3 = "SliderRail",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(1, 0),
		}),
		New("UISizeConstraint", {
			MaxSize = Vector2.new(150, math.huge),
		}),
		SliderDisplay,
		SliderFill,
		SliderRail,
	})

	Creator.AddSignal(MinSliderDot.InputBegan, function(Input)
		if
			Input.UserInputType == Enum.UserInputType.MouseButton1
			or Input.UserInputType == Enum.UserInputType.Touch
		then
			DraggingMin = true
		end
	end)

	Creator.AddSignal(MinSliderDot.InputEnded, function(Input)
		if
			Input.UserInputType == Enum.UserInputType.MouseButton1
			or Input.UserInputType == Enum.UserInputType.Touch
		then
			DraggingMin = false
		end
	end)

	Creator.AddSignal(MaxSliderDot.InputBegan, function(Input)
		if
			Input.UserInputType == Enum.UserInputType.MouseButton1
			or Input.UserInputType == Enum.UserInputType.Touch
		then
			DraggingMax = true
		end
	end)

	Creator.AddSignal(MaxSliderDot.InputEnded, function(Input)
		if
			Input.UserInputType == Enum.UserInputType.MouseButton1
			or Input.UserInputType == Enum.UserInputType.Touch
		then
			DraggingMax = false
		end
	end)

	Creator.AddSignal(UserInputService.InputChanged, function(Input)
		if
			(DraggingMin or DraggingMax)
			and (
				Input.UserInputType == Enum.UserInputType.MouseMovement
				or Input.UserInputType == Enum.UserInputType.Touch
			)
		then
			local SizeScale =
				math.clamp((Input.Position.X - SliderRail.AbsolutePosition.X) / SliderRail.AbsoluteSize.X, 0, 1)
			local NewValue = RangeSlider.Min + ((RangeSlider.Max - RangeSlider.Min) * SizeScale)
			
			if DraggingMin then
				local MaxValue = RangeSlider.Value[2]
				NewValue = math.min(NewValue, MaxValue)
				RangeSlider:SetValue({NewValue, MaxValue})
			elseif DraggingMax then
				local MinValue = RangeSlider.Value[1]
				NewValue = math.max(NewValue, MinValue)
				RangeSlider:SetValue({MinValue, NewValue})
			end
		end
	end)

	function RangeSlider:OnChanged(Func)
		RangeSlider.Changed = Func
		Func(RangeSlider.Value)
	end

	function RangeSlider:SetValue(Value)
		local MinVal = Library:Round(math.clamp(Value[1], RangeSlider.Min, RangeSlider.Max), RangeSlider.Rounding)
		local MaxVal = Library:Round(math.clamp(Value[2], RangeSlider.Min, RangeSlider.Max), RangeSlider.Rounding)
		
		if MinVal > MaxVal then
			MinVal, MaxVal = MaxVal, MinVal
		end
		
		RangeSlider.Value = {MinVal, MaxVal}
		
		local MinScale = (MinVal - RangeSlider.Min) / (RangeSlider.Max - RangeSlider.Min)
		local MaxScale = (MaxVal - RangeSlider.Min) / (RangeSlider.Max - RangeSlider.Min)
		
		MinSliderDot.Position = UDim2.new(MinScale, -7, 0.5, 0)
		MaxSliderDot.Position = UDim2.new(MaxScale, -7, 0.5, 0)
		
		SliderFill.Position = UDim2.fromScale(MinScale, 0)
		SliderFill.Size = UDim2.fromScale(MaxScale - MinScale, 1)
		
		SliderDisplay.Text = tostring(MinVal) .. " - " .. tostring(MaxVal)

		Library:SafeCallback(RangeSlider.Callback, RangeSlider.Value)
		Library:SafeCallback(RangeSlider.Changed, RangeSlider.Value)
	end

	function RangeSlider:Destroy()
		SliderFrame:Destroy()
		Library.Options[Idx] = nil
	end

	RangeSlider:SetValue(RangeSlider.Value)

	Library.Options[Idx] = RangeSlider
	return RangeSlider
end

return Element
