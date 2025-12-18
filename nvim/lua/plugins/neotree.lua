return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	lazy = false,
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true, -- optional
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = false, -- optional

			filesystem = {
				follow_current_file = { enabled = true, leave_dirs_open = false },
			},

			git_status = {
				symbols = {
					added     = "✚",
					modified  = "",
					deleted = "✖", -- this can only be used in the git_status source
					renamed = "󰁕", -- this can only be used in the git_status source
					untracked = "",
					ignored   = "",
					unstaged  = "󰄱",
					staged    = "",
					conflict  = "",
				},
			},
		})
	end,
}
