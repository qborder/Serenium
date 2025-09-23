local Themes = {
	Names = {
		"Obsidian",
		"Gold",
		"Silver",
		"Dark",
		"Darker",
		"Light",
		"Aqua",
		"Amethyst",
		"Rose",
		"Crimson",
		"Emerald",
		"Sapphire",
	},
}

for _, Theme in next, script:GetChildren() do
	local Required = require(Theme)
	Themes[Required.Name] = Required
end

return Themes
