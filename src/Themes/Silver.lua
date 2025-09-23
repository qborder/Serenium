return {
	Name = "Silver",
	Accent = Color3.fromRGB(200, 200, 200), -- Clean silver accent

	AcrylicMain = Color3.fromRGB(15, 15, 15), -- Dark obsidian base
	AcrylicBorder = Color3.fromRGB(90, 90, 90), -- Neutral silver border
	AcrylicGradient = ColorSequence.new(Color3.fromRGB(30, 30, 30), Color3.fromRGB(10, 10, 10)), -- Subtle gradient
	AcrylicNoise = 0.85,

	TitleBarLine = Color3.fromRGB(120, 120, 120), -- Brighter silver line
	Tab = Color3.fromRGB(180, 180, 180), -- Light silver tab

	Element = Color3.fromRGB(35, 35, 35), -- Dark but slightly lighter than base
	ElementBorder = Color3.fromRGB(110, 110, 110), -- Soft silver outline
	InElementBorder = Color3.fromRGB(170, 170, 170), -- Bright silver on hover/focus
	ElementTransparency = 0.9,

	ToggleSlider = Color3.fromRGB(200, 200, 200), -- Silver toggle accent
	ToggleToggled = Color3.fromRGB(0, 0, 0), -- Black inner fill for contrast

	SliderRail = Color3.fromRGB(80, 80, 80), -- Neutral track

	DropdownFrame = Color3.fromRGB(40, 40, 40),
	DropdownHolder = Color3.fromRGB(25, 25, 25),
	DropdownBorder = Color3.fromRGB(100, 100, 100),
	DropdownOption = Color3.fromRGB(190, 190, 190),

	Keybind = Color3.fromRGB(220, 220, 220), -- Bright silver

	Input = Color3.fromRGB(50, 50, 50),
	InputFocused = Color3.fromRGB(20, 20, 20),
	InputIndicator = Color3.fromRGB(200, 200, 200), -- Silver indicator

	Dialog = Color3.fromRGB(30, 30, 30),
	DialogHolder = Color3.fromRGB(25, 25, 25),
	DialogHolderLine = Color3.fromRGB(100, 100, 100),
	DialogButton = Color3.fromRGB(40, 40, 40),
	DialogButtonBorder = Color3.fromRGB(140, 140, 140),
	DialogBorder = Color3.fromRGB(120, 120, 120),
	DialogInput = Color3.fromRGB(45, 45, 45),
	DialogInputLine = Color3.fromRGB(200, 200, 200),

	Text = Color3.fromRGB(240, 240, 240), -- Clean white text
	SubText = Color3.fromRGB(170, 170, 170),
	Hover = Color3.fromRGB(220, 220, 220), -- Silver hover effect
	HoverChange = 0.05, -- Smooth hover
}
