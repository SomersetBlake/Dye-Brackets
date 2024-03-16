if vim.g.loaded_dye_bracket then
	return
end


vim.api.nvim_create_augroup("dye-bracket", { clear = true })


vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	group = "dye-bracket",
	callback = function( args )
		local conf = require("dye-brackets.config")

		if conf.checkLang( args.file ) == nil then
			return
		end

		conf.enableDye()
	end
})


vim.g.loaded_dye_bracket = true
