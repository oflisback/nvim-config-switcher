#!/usr/bin/lua
local home = os.getenv("HOME")
local config = dofile(home .. '/.config/nvims/config.lua')

if #arg == 1 then
  if arg[1] == 'list' then
    print("Available environments:")
    for k, _ in pairs(config) do
      print(" " .. k)
    end
    return
  end
end

if #arg == 2 then
  if arg[1] == 'select' then
    label = arg[2]
    if config[label] ~= nil then
      print('Setting default environment: ' .. label)
      local file = io.open(home .. '/.config/nvims/env.lua', 'w')
      file:write(home .. "/.config/nvims/envs/" .. config[label].subpath .. "\n")
      file:close()
      return
    end
    return
    print("Unrecognized environment: " .. label)
  end
end

print("Usage: " .. arg[0] .. " <list|select>")
