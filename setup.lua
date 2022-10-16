#!/usr/bin/lua

local home = os.getenv("HOME")
local configDir = home .. '/.config/nvcs/'
local configFilePath = configDir .. 'config.lua'

function exists(file)
   local ok, err, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         -- Permission denied, but it exists
         return true
      end
   end
   return ok, err
end

function isdir(path)
   return exists(path.."/")
end

if not isdir(configDir) then
  os.execute("mkdir " .. configDir)
end

if not exists(configFilePath) then
  print("Config file does not exist.")
  print("Copying example config.lua and example environments to:")
  print(configDir)
  os.execute("cp -r ./example/* " .. configDir)
else
  print("Config file " .. configFilePath .. " already exists.")
end
print("First edit: " .. configFilePath)
print("then create corresponding subdirectories for your environments.")
