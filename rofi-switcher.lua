#!/usr/bin/lua

local home = os.getenv("HOME")
local config = dofile(home .. '/.config/nvimcs/config.lua')

local labels = {}

for k, _ in pairs(config) do
  table.insert(labels, k)
end

local labelParam = table.concat(labels, "\n")

function os.capture(cmd)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

local selection = os.capture("echo \"" .. labelParam .. "\"" .. "| rofi -dmenu -p 'Neovim config'")

if config[selection] ~= nil then
  local file = io.open(home .. '/.config/nvimcs/env.lua', 'w')
  file:write(home .. "/.config/nvimcs/envs/" .. config[selection].subpath .. "\n")
  file:close()
end
