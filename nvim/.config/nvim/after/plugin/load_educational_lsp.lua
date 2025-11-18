local client = vim.lsp.start({
  name = "educational-lsp",
  cmd = { "/Users/alph0n5e/Code/src/github.com/alph0n5e/educational-lsp/main" },
})

if not client then
  vim.notify "Woopsie, LSP client error..?"
  return
else
  vim.notify "client created"
end

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   callback = function()
--     vim.notify "Opened markdown file"
--     vim.lsp.buf_attach_client(0, client)
--   end
-- })
