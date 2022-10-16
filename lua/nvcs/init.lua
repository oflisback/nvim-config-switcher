local status, module = pcall(require, "packer")
local packer = status and module or nil

local home = os.getenv("HOME")
local config = dofile(home .. "/.config/nvcs/config.lua")
local M = {}

local function hasValue(tab, val)
	for _, value in ipairs(tab) do
		if value == val then
			return true
		end
	end
	return false
end

function M.list()
	print("Available config labels:")
	for _, label in pairs(config) do
		print(" " .. label)
	end
end

function M.switch(label)
	if not hasValue(config, label) then
		print("Configuration not available: " .. label)
		return
	end

	local configHome = home .. "/.config/nvcs/envs/" .. label
	vim.env.XDG_DATA_HOME = configHome
	vim.env.XDG_CONFIG_HOME = configHome
	vim.env.MYVIMRC = vim.env.XDG_CONFIG_HOME .. "/nvim/init.lua"
	dofile(vim.env.MYVIMRC)
	-- If packer is available, trigger a sync. Unfortunately there is no
	-- option to run packer.sync silently at the moment.
	if packer ~= nil then
		packer.sync()
	end
end

return M
