local fs = require("@lune/fs")
local process = require("@lune/process")
local BuildCodegen = require("modules/BuildCodegen")

local DistFilePath = "dist/main.lua"
local RootFilePath = "main.lua"
local TempFile = "dist/temp.lua"
local Header = fs.readFile("build/header.luau")

local function minify(text)
	fs.writeFile(TempFile, text)
    process.spawn("darklua", {"process", TempFile, TempFile, "--config", "build/darklua.json"})
	local value = fs.readFile(TempFile)
	fs.removeFile(TempFile)
	return value
end

local Module = fs.readFile("dist/main.rbxm")
local ModelCodegen = BuildCodegen(Module, false)
local FinalContent = Header .. "\n" .. minify(ModelCodegen)

fs.writeFile(DistFilePath, FinalContent)
fs.writeFile(RootFilePath, FinalContent)