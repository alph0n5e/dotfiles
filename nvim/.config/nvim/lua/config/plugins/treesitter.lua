return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "typescript", "go", "svelte" },
      auto_install = false,
      highlight = {
        enabled = true,
        disable = function(lang, buff)
          local max_filesize = 100 * 1024
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
      indent = { enabled = true },
    })
  end
}

