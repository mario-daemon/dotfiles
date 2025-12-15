vim.wo.number = true -- line numbers
vim.o.relativenumber = true -- relative line numbers
vim.o.clipboard = 'unnamedplus' -- sync clipboard with os
vim.o.wrap = false -- display lines as one long line
vim.o.linebreak = true -- don't split words when wrapping
vim.o.autoindent = true -- follow indentation when creating new line
vim.o.ignorecase = true -- case insensitive serach unless \C or capital in search
vim.o.smartcase = true -- smart case
vim.o.shiftwidth = 4 -- n of spaces inserted for each indentation
vim.o.tabstop = 4 -- insert n spaces for a tab
vim.o.softtabstop = 4 --number of spaces that a tab counts for whole
vim.o.hlsearch = false -- Set highlight on search
vim.o.undofile = true -- Save undo history
vim.o.scrolloff = 4 -- minimal number of screen lines to keep above and below the cursor
vim.o.sidescrolloff = 8 -- minimal number of screen columns either side of cursor if wrap is `false`
vim.o.cursorline = false -- highlight the current line
vim.o.smartindent = true -- make indenting smarter again
vim.o.showtabline = 1 -- show if there are at least two tabs
vim.o.fileencoding = 'utf-8' -- the encoding written to a file

-- =========================
-- Autocommands
-- =========================
--vim.api.nvim_set_hl(0, "YankHighlight", {
--  bg = "#ff9e3b",  -- orange background
--  fg = "#1e1e2e",  -- dark foreground (optional but recommended)
--})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = "Visual",
      timeout = 200,
    })
  end,
})

