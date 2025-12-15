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
				bg = false,
				-- Enable transparent background for floating windows.
				float = true,
			}
		})
		require('nordic').load()
    end
}

return T
