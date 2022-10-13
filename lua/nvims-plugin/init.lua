local status, module = pcall(require, 'packer')
packer = status and module or nil

local home = os.getenv("HOME")
local config = dofile(home .. '/.config/nvims/config.lua')
local M = {}

function M.list()
	print("Available config labels:")
 	for k, _ in pairs(config) do
		print(" " .. k)
	end
end

function M.switch(label)
	if config[label] == nil then
          print("Configuration not available: " .. label)
          return
	end

	local configHome = home .. '/.config/nvims/envs/' .. label
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
