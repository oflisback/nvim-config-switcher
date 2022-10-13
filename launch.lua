#!/usr/bin/lua

local home = os.getenv("HOME")

local function read_file(path)
  local file = io.open(path, "r")
  if not file then return nil end
  local arr = {}
  for line in file:lines() do
    table.insert(arr, line);
  end
  return arr
end

local fileContent = read_file(home .. '/.config/nvims/env.lua');
local envDir = fileContent[1]

local args = ""
for k, v in pairs(arg) do
  if k > 0 then
    args = args .. " " .. v
  end
end

local cmdline = 'XDG_CONFIG_HOME=' .. envDir .. " XDG_DATA_HOME=" .. envDir .. " nvim" .. args

os.execute(cmdline)
