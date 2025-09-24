local Themes = {
	Names = {
		"Dark",
		"Darker",
		"Light",
		"Obsidian",
		"Gold",
		"Silver",
		"Aqua",
		"Amethyst",
		"Rose",
		"Crimson",
		"Emerald",
		"Sapphire",
		"Midnight",
		"Phantom",
		"Void",
	},
}

for _, Theme in next, script:GetChildren() do
	local Required = require(Theme)
	Themes[Required.Name] = Required
end

return Themes
