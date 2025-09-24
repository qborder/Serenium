local TweenService = game:GetService("TweenService")
local Root = script.Parent.Parent
local Creator = require(Root.Creator)

local New = Creator.New
local Components = Root.Components

local Element = {}
Element.__index = Element
Element.__type = "MultiCheckbox"

function Element:New(Idx, Config)
	local Library = self.Library
	assert(Config.Title, "MultiCheckbox - Missing Title")
	assert(Config.Options, "MultiCheckbox - Missing Options table")

	local MultiCheckbox = {
		Value = Config.Default or {},
		Options = Config.Options,
		Callback = Config.Callback or function(Value) end,
		Type = "MultiCheckbox",
	}

	local CheckboxFrame = require(Components.Element)(Config.Title, Config.Description, self.Container, false)

	MultiCheckbox.SetTitle = CheckboxFrame.SetTitle
	MultiCheckbox.SetDesc = CheckboxFrame.SetDesc

	-- Container for all checkboxes
	local CheckboxContainer = New("Frame", {
		Size = UDim2.new(1, -20, 0, 0),
		Position = UDim2.new(0, 10, 0, 0.5),
		BackgroundTransparency = 1,
		Parent = CheckboxFrame.Frame,
		AutomaticSize = Enum.AutomaticSize.Y,
	}, {
		New("UIListLayout", {
			Padding = UDim.new(0, 6),
			SortOrder = Enum.SortOrder.LayoutOrder,
		}),
	})

	local CheckboxButtons = {}

	local function CreateCheckbox(OptionText, Index)
		local IsChecked = MultiCheckbox.Value[OptionText] or false

		local CheckboxButton = New("TextButton", {
			Size = UDim2.new(1, 0, 0, 24),
			BackgroundTransparency = 1,
			Text = "",
			LayoutOrder = Index,
			Parent = CheckboxContainer,
		})

		local CheckIcon = New("Frame", {
			Size = UDim2.fromOffset(18, 18),
			Position = UDim2.new(0, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = Color3.fromRGB(40, 42, 50),
			Parent = CheckboxButton,
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
				Size = UDim2.fromOffset(12, 12),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Image = "rbxassetid://10709755989",
				ImageTransparency = IsChecked and 0 or 1,
				ThemeTag = {
					ImageColor3 = "Accent",
				},
			}),
		})

		local OptionLabel = New("TextLabel", {
			Position = UDim2.new(0, 26, 0, 0),
			Size = UDim2.new(1, -26, 1, 0),
			BackgroundTransparency = 1,
			Text = OptionText,
			FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			Parent = CheckboxButton,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		local function UpdateCheckbox()
			local IsChecked = MultiCheckbox.Value[OptionText] or false
			local CheckImage = CheckIcon.ImageLabel
			if IsChecked then
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

		Creator.AddSignal(CheckboxButton.MouseButton1Click, function()
			local CurrentState = MultiCheckbox.Value[OptionText] or false
			if CurrentState then
				MultiCheckbox.Value[OptionText] = nil
			else
				MultiCheckbox.Value[OptionText] = true
			end

			UpdateCheckbox()
			Library:SafeCallback(MultiCheckbox.Callback, MultiCheckbox.Value)
			Library:SafeCallback(MultiCheckbox.Changed, MultiCheckbox.Value)
		end)

		-- Hover effects
		local Motor, SetTransparency = Creator.SpringMotor(1, CheckboxButton, "BackgroundTransparency")
		Creator.AddSignal(CheckboxButton.MouseEnter, function()
			SetTransparency(0.95)
		end)
		Creator.AddSignal(CheckboxButton.MouseLeave, function()
			SetTransparency(1)
		end)

		UpdateCheckbox()
		CheckboxButtons[OptionText] = { Update = UpdateCheckbox, Button = CheckboxButton }
	end

	-- Create checkboxes for all options
	for Index, Option in ipairs(MultiCheckbox.Options) do
		CreateCheckbox(Option, Index)
	end

	function MultiCheckbox:OnChanged(Func)
		MultiCheckbox.Changed = Func
		Func(MultiCheckbox.Value)
	end

	function MultiCheckbox:SetValue(NewValue)
		MultiCheckbox.Value = NewValue or {}
		for OptionText, Data in pairs(CheckboxButtons) do
			Data.Update()
		end
		Library:SafeCallback(MultiCheckbox.Callback, MultiCheckbox.Value)
		Library:SafeCallback(MultiCheckbox.Changed, MultiCheckbox.Value)
	end

	function MultiCheckbox:GetSelected()
		local Selected = {}
		for Option, IsSelected in pairs(MultiCheckbox.Value) do
			if IsSelected then
				table.insert(Selected, Option)
			end
		end
		return Selected
	end

	function MultiCheckbox:SetOptions(NewOptions)
		MultiCheckbox.Options = NewOptions
		-- Clear existing checkboxes
		for _, Child in pairs(CheckboxContainer:GetChildren()) do
			if not Child:IsA("UIListLayout") then
				Child:Destroy()
			end
		end
		CheckboxButtons = {}

		-- Create new checkboxes
		for Index, Option in ipairs(NewOptions) do
			CreateCheckbox(Option, Index)
		end
	end

	function MultiCheckbox:Destroy()
		CheckboxFrame:Destroy()
		Library.Options[Idx] = nil
	end

	Library.Options[Idx] = MultiCheckbox
	return MultiCheckbox
end

return Element
