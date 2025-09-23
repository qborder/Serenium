return {
	Name = "Gold",
	Accent = Color3.fromRGB(212, 175, 55), -- Softer luxury gold (champagne tone)

	AcrylicMain = Color3.fromRGB(15, 15, 15), -- Obsidian base
	AcrylicBorder = Color3.fromRGB(70, 60, 40), -- Muted gold-brown border
	AcrylicGradient = ColorSequence.new(Color3.fromRGB(30, 25, 20), Color3.fromRGB(10, 10, 10)), -- Dark gradient
	AcrylicNoise = 0.85,

	TitleBarLine = Color3.fromRGB(120, 100, 60), -- Subtle gold line
	Tab = Color3.fromRGB(190, 170, 120), -- Softer gold for tabs

	Element = Color3.fromRGB(35, 35, 35), 
	ElementBorder = Color3.fromRGB(90, 75, 55), -- Muted brown-gold border
	InElementBorder = Color3.fromRGB(150, 130, 90), -- Softer gold focus
	ElementTransparency = 0.9,

	ToggleSlider = Color3.fromRGB(190, 160, 90), -- Less yellow, more warm gold
	ToggleToggled = Color3.fromRGB(0, 0, 0), -- Black inside

	SliderRail = Color3.fromRGB(80, 70, 50), -- Neutral track

	DropdownFrame = Color3.fromRGB(40, 40, 40),
	DropdownHolder = Color3.fromRGB(25, 25, 25),
	DropdownBorder = Color3.fromRGB(90, 80, 60),
	DropdownOption = Color3.fromRGB(190, 170, 120),

	Keybind = Color3.fromRGB(200, 180, 130), -- Softer highlight

	Input = Color3.fromRGB(50, 50, 50),
	InputFocused = Color3.fromRGB(25, 20, 15), -- Darker focus
	InputIndicator = Color3.fromRGB(200, 170, 110), -- Champagne gold instead of neon yellow

	Dialog = Color3.fromRGB(30, 30, 30),
	DialogHolder = Color3.fromRGB(25, 25, 25),
	DialogHolderLine = Color3.fromRGB(80, 70, 50),
	DialogButton = Color3.fromRGB(40, 40, 40),
	DialogButtonBorder = Color3.fromRGB(140, 120, 90),
	DialogBorder = Color3.fromRGB(120, 100, 70),
	DialogInput = Color3.fromRGB(45, 45, 45),
	DialogInputLine = Color3.fromRGB(210, 185, 120), -- Champagne gold underline

	Text = Color3.fromRGB(240, 240, 240), -- White text
	SubText = Color3.fromRGB(180, 180, 180),
	Hover = Color3.fromRGB(220, 200, 150), -- Soft gold hover
	HoverChange = 0.05,
}
