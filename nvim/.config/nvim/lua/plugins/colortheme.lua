local T = {}

T.nord = {
	'shaunsingh/nord.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		-- Example config in lua
		vim.g.nord_contrast = true
		vim.g.nord_borders = false
		vim.g.nord_disable_background = true -- import for terminal transprency
		vim.g.nord_italic = false
		vim.g.nord_uniform_diff_background = true
		vim.g.nord_bold = false

		-- Load the colorscheme
		require('nord').set()

    end
}

T.nordic = {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('nordic').setup({
			transparent = {
				-- Enable transparent background.
				bg = true,
				-- Enable transparent background for floating windows.
				float = true,
			}
		})
		require('nordic').load()
    end
}

T.gruvbox = {
	'ellisonleao/gruvbox.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			terminal_colors = true, -- add neovim terminal colors
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = false,
		})
		require('gruvbox').load()
	end
}

return T
