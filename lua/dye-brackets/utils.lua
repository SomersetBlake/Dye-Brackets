M = {}

local function getFileLang()
	local lang = vim.bo.filetype
	local name = lang .. '-query'
	return lang,name
end


M.getQuery = function()
	local lang, name = getFileLang()
	local query = vim.treesitter.query.get(lang, name)
	return query
end

return M
