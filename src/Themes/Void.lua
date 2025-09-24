return {
	Name = "Void",
	-- Dynamic RGB accent that shifts
	Accent = Color3.fromRGB(255, 100, 200),

	-- Absolute void black base
	AcrylicMain = Color3.fromRGB(2, 2, 3),
	AcrylicBorder = Color3.fromRGB(20, 25, 30),
	AcrylicGradient = ColorSequence.new(Color3.fromRGB(8, 10, 12), Color3.fromRGB(1, 1, 2)),
	AcrylicNoise = 0.70,

	-- Void lines with subtle RGB tint
	TitleBarLine = Color3.fromRGB(45, 50, 60),
	Tab = Color3.fromRGB(140, 150, 170),

	-- Void elements with RGB highlights
	Element = Color3.fromRGB(15, 18, 22),
	ElementBorder = Color3.fromRGB(40, 45, 55),
	InElementBorder = Color3.fromRGB(80, 90, 110),
	ElementTransparency = 0.92,

	-- RGB-lit toggle
	ToggleSlider = Color3.fromRGB(100, 110, 130),
	ToggleToggled = Color3.fromRGB(2, 2, 3),

	-- Void slider rail
	SliderRail = Color3.fromRGB(55, 65, 80),

	-- Void dropdown with RGB accents
	DropdownFrame = Color3.fromRGB(22, 27, 35),
	DropdownHolder = Color3.fromRGB(8, 10, 15),
	DropdownBorder = Color3.fromRGB(50, 60, 75),
	DropdownOption = Color3.fromRGB(160, 170, 190),

	-- RGB keybind glow
	Keybind = Color3.fromRGB(180, 120, 200),

	-- Void input with RGB focus
	Input = Color3.fromRGB(18, 22, 28),
	InputFocused = Color3.fromRGB(5, 6, 8),
	InputIndicator = Color3.fromRGB(255, 100, 200),

	-- Void dialogs with RGB borders
	Dialog = Color3.fromRGB(12, 15, 20),
	DialogHolder = Color3.fromRGB(5, 6, 8),
	DialogHolderLine = Color3.fromRGB(40, 50, 65),
	DialogButton = Color3.fromRGB(20, 25, 32),
	DialogButtonBorder = Color3.fromRGB(70, 80, 100),
	DialogBorder = Color3.fromRGB(60, 70, 90),
	DialogInput = Color3.fromRGB(15, 20, 28),
	DialogInputLine = Color3.fromRGB(255, 100, 200),

	-- Pure void text
	Text = Color3.fromRGB(255, 255, 255),
	SubText = Color3.fromRGB(180, 190, 210),
	Hover = Color3.fromRGB(255, 150, 220),
	HoverChange = 0.035,
}
