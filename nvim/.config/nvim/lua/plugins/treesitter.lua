return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,

  config = function()
    local ts = require("nvim-treesitter")

    -- basic setup (required)
    ts.setup()

    -- install your languages
    ts.install({
      "bash", "python", "php", "json", "css", "sql", "regex",
      "yaml", "gitignore", "c", "diff", "dockerfile", "html",
      "rust", "lua", "luadoc", "markdown", "markdown_inline",
      "query", "vim", "vimdoc"
    })

    -- enable highlighting via Neovim 0.11 API
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "bash","python","php","json","css","sql","regex",
        "yaml","gitignore","c","diff","dockerfile","html",
        "rust","lua","markdown","vim"
      },
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
