require 'core.options'
require 'core.keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
	if vim.v.shell_error ~= 0 then
		error('Error cloning lazy.nvim:\n' .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

local colortheme = require('plugins.colortheme')

require('lazy').setup({
	colortheme.gruvbox,
	require 'plugins.neotree',
	require 'plugins.lualine',
	require 'plugins.treesitter',
	require 'plugins.whichkey',
	require 'plugins.telescope',
	require 'plugins.indentlines',
	require 'plugins.lsp',
	require 'plugins.autocompletion',
	require 'plugins.gitsigns',
	require 'plugins.alpha',
	require 'plugins.indent-blankline'
})
