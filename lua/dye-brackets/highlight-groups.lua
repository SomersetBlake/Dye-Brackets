local M = {}

local function defineHlGroups()
	vim.api.nvim_set_hl(0, '@dye-red', {default = true, fg = '#FF0000'})
	vim.api.nvim_set_hl(0, '@dye-green', {default = true, fg = '#00FF00'})
	vim.api.nvim_set_hl(0, '@dye-blue', {default = true, fg = '#0000FF'})
	vim.api.nvim_set_hl(0, '@dye-yellow', {default = true, fg = '#FFFF00'})
end

M.getHlGroups = function()
	defineHlGroups()
	local groups = {'@dye-red', '@dye-green', '@dye-blue', '@dye-yellow'}
	local length = 4
	return groups, length
end

return M
