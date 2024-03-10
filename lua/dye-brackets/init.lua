local ts_utils = require("nvim-treesitter.ts_utils")
local M = {}

local highlights = require("dye-brackets.highlight-groups")

local function create_namespace()
	return vim.api.nvim_create_namespace('')
end


local function highlightNode(bufNb, namespace, hl_group, node)
	local startRow, startCol, endRow, endCol = node:range()
	local start, finish = {startRow, startCol}, {endRow, endCol}
	vim.highlight.range(bufNb, namespace, hl_group, start, finish)
end


local function highlightNodes(bufNb, namespace, nodes)
	local hl_groups, len = highlights.getHlGroups()
	local hl_nb = 1
	for _, node in pairs(nodes) do
		if(hl_nb == len+1) then
			hl_nb = 1
		end
		for element, block in pairs(node) do
			if(element<3) then
				highlightNode(bufNb, namespace, hl_groups[hl_nb], block)
			end
		end
		hl_nb = hl_nb + 1
	end
end


M.select = function()
	local bufferNb = vim.api.nvim_get_current_buf()
	local namespace = create_namespace()
	local parser = require('nvim-treesitter.parsers').get_parser()
	local root = parser:parse()[1]:root()
	local query = vim.treesitter.query.get("cpp", "cpp-query")
	local nodes = {}
	for _, n, _ in query:iter_matches(root, bufferNb) do
		table.insert(nodes, n)
	end
	highlightNodes(bufferNb, namespace, nodes)
end


return M
