return {
	Name = "Obsidian",
	Accent = Color3.fromRGB(255, 225, 150), -- Gold accent

	AcrylicMain = Color3.fromRGB(10, 10, 10), -- Darker, more solid obsidian base
	AcrylicBorder = Color3.fromRGB(70, 60, 40),
	AcrylicGradient = ColorSequence.new(Color3.fromRGB(20, 20, 20), Color3.fromRGB(5, 5, 5)), -- Deep gradient
	AcrylicNoise = 0.7, -- less noise = cleaner look

	TitleBarLine = Color3.fromRGB(120, 100, 60),
	Tab = Color3.fromRGB(190, 170, 120),

	Element = Color3.fromRGB(25, 25, 25), -- Darker UI blocks
	ElementBorder = Color3.fromRGB(90, 75, 55),
	InElementBorder = Color3.fromRGB(150, 130, 90),
	ElementTransparency = 0.8, -- more opaque (was 0.9)

	ToggleSlider = Color3.fromRGB(190, 160, 90),
	ToggleToggled = Color3.fromRGB(0, 0, 0),

	SliderRail = Color3.fromRGB(80, 70, 50),

	DropdownFrame = Color3.fromRGB(30, 30, 30),
	DropdownHolder = Color3.fromRGB(20, 20, 20),
	DropdownBorder = Color3.fromRGB(90, 80, 60),
	DropdownOption = Color3.fromRGB(190, 170, 120),

	Keybind = Color3.fromRGB(200, 180, 130),

	Input = Color3.fromRGB(40, 40, 40),
	InputFocused = Color3.fromRGB(15, 15, 15), -- Very dark when focused
	InputIndicator = Color3.fromRGB(200, 170, 110),

	Dialog = Color3.fromRGB(25, 25, 25),
	DialogHolder = Color3.fromRGB(15, 15, 15),
	DialogHolderLine = Color3.fromRGB(80, 70, 50),
	DialogButton = Color3.fromRGB(35, 35, 35),
	DialogButtonBorder = Color3.fromRGB(140, 120, 90),
	DialogBorder = Color3.fromRGB(120, 100, 70),
	DialogInput = Color3.fromRGB(30, 30, 30),
	DialogInputLine = Color3.fromRGB(210, 185, 120),

	Text = Color3.fromRGB(240, 240, 240),
	SubText = Color3.fromRGB(180, 180, 180),
	Hover = Color3.fromRGB(220, 200, 150),
	HoverChange = 0.05,
}
