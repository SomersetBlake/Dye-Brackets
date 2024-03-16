local M = {}

local function defineHlGroups()
	vim.api.nvim_set_hl(0, '@dye-red', {default = true, fg = '#EE6D85'})
	vim.api.nvim_set_hl(0, '@dye-green', {default = true, fg = '#95C561'})
	vim.api.nvim_set_hl(0, '@dye-blue', {default = true, fg = '#7199EE'})
	vim.api.nvim_set_hl(0, '@dye-yellow', {default = true, fg = '#D7A65F'})
	vim.api.nvim_set_hl(0, '@dye-purple', {default = true, fg = '#A485DD'})
	vim.api.nvim_set_hl(0, '@dye-orange', {default = true, fg = '#F69558'})
end

M.getHlGroups = function()
	defineHlGroups()
	local groups = {
		'@dye-red',
		'@dye-green',
		'@dye-blue',
		'@dye-yellow',
		'@dye-purple',
		'@dye-orange'
	}
	local length = 6
	return groups, length
end

return M
