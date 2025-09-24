local Root = script.Parent.Parent
local Creator = require(Root.Creator)

local New = Creator.New
local Components = Root.Components

local Element = {}
Element.__index = Element
Element.__type = "Label"

function Element:New(Idx, Config)
	local Library = self.Library
	assert(Config.Title, "Label - Missing Title")
	
	local Label = {
		Value = Config.Text or "Label Text",
		Type = "Label",
	}

	local LabelFrame = require(Components.Element)(Config.Title, Config.Description, self.Container, false)
	
	Label.SetTitle = LabelFrame.SetTitle
	Label.SetDesc = LabelFrame.SetDesc

	local DisplayLabel = New("TextLabel", {
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
		Text = Label.Value,
		TextColor3 = Color3.fromRGB(240, 240, 240),
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Right,
		Size = UDim2.new(0, 120, 0, 14),
		Position = UDim2.new(1, -10, 0.5, 0),
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundTransparency = 1,
		Parent = LabelFrame.Frame,
		ThemeTag = {
			TextColor3 = "Text",
		},
	})

	function Label:SetText(Text)
		Label.Value = Text
		DisplayLabel.Text = Text
	end

	function Label:Destroy()
		LabelFrame:Destroy()
		Library.Options[Idx] = nil
	end

	Library.Options[Idx] = Label
	return Label
end

return Element
