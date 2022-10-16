#!/usr/bin/lua

local home = os.getenv("HOME")

local envFile = home .. '/.config/nvcs/env.lua'
local file = io.open(envFile, 'r')
if not file then
  print("Failed to open env file: " .. envFile)
  print("Run selectConfig.lua in your shell to generate it.")
  return
end
local fileContent = {}
for line in file:lines() do
  table.insert(fileContent, line);
end
local envDir = fileContent and fileContent[1]

if envDir == nil then
  print("Could not read environment from " .. envFile)
  print("Run selectConfig.lua in your shell to regenerate it.")
  return
end

local args = ""
for k, v in pairs(arg) do
  if k > 0 then
    args = args .. " " .. v
  end
end

local cmdline = 'XDG_CONFIG_HOME=' .. envDir .. " XDG_DATA_HOME=" .. envDir .. " nvim" .. args

os.execute(cmdline)
