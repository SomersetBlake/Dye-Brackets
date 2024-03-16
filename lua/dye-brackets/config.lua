M = {}

M.checkLang = function( lang )
	local filetype = lang:match("[^.]+$")
	return vim.treesitter.language.get_lang( filetype )
end


M.enableDye = function()
	vim.api.nvim_create_autocmd({ "InsertLeave" }, {
		group = "dye-bracket",
		callback = function()
			require("dye-brackets").select()
		end
	})
end


return M
