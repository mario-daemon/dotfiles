-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar's default behaviour
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Open neotree
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', opts)

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- Normal mode: scroll half screen
vim.keymap.set('n', '<C-j>', '<C-d>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-u>', { noremap = true, silent = true })

-- Optional: Visual mode scrolling (if you select text and want to scroll)
vim.keymap.set('v', '<C-j>', '<C-d>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-k>', '<C-u>', { noremap = true, silent = true })

-- -- LSP Diagnostics --
-- Open full diagnostic message in a floating window under the cursor
vim.keymap.set("n", "<leader>ld", function() 
    vim.diagnostic.open_float({
        -- Options to make the float usable
        focusable = true,
        close_events = { "bufenter", "InsertEnter", "focusgained" },
    })
end, { desc = "Show line diagnostic (float)" })

-- Clear highlights when pressing Esc in normal mode
vim.keymap.set('n', '<Esc>', function()
    if vim.v.hlsearch == 1 then
        vim.cmd('nohlsearch')
    end
    return '<Esc>'
end, { expr = true, noremap = true })

-- Optional: Move to the next/previous diagnostic error
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
