vim.o.termguicolors = true

-- ===============
-- OPTIONS
-- ===============
vim.o.number = true                             -- line numbers
vim.o.relativenumber = true                     -- relative line numbers
vim.o.cursorline = true                         -- highlight current line
vim.o.wrap = false                              -- don't wrap lines
vim.o.scrolloff = 10                            -- keep 10 lines above/below cursor
vim.o.sidescrolloff = 10                        -- keep 10 lines to left/right of cursor

vim.o.tabstop = 2                               -- tab width
vim.o.shiftwidth = 2                            -- indent width
vim.o.softtabstop = 2                           -- soft tab stop not tabs on tab/backspace
vim.o.expandtab = true                          -- use spaces instead of tabs
vim.o.smartindent = true                        -- smart auto-indent
vim.o.autoindent = true                         -- copy indent from current line

vim.o.ignorecase = true                         -- case insensitive search
vim.o.smartcase = true                          -- case sensitive if uppercase in string
vim.o.hlsearch = true                           -- highlight search matches
vim.o.incsearch = true                          -- show matches as you type

vim.o.signcolumn = 'yes'                        -- always show sign column
vim.o.showmatch = true                          -- highlight matching brackets
vim.o.cmdheight = 1                             -- single line command
vim.o.completeopt = 'menuone,noinsert,noselect' -- completion options
vim.o.showmode = false                          -- don't show the mode (will be in status line)
vim.o.pumheight = 10                            -- pop-up menu height
vim.o.pumblend = 0                              -- floating window transparency
vim.o.pumborder = 'rounded'                     -- floating window border
vim.o.conceallevel = 2                          -- obsidian requirement?
vim.o.concealcursor = ''                        -- do not hide cursorline in markup
vim.o.synmaxcol = 300                           -- syntax highlighting limit
vim.o.fillchars = 'eob: '                       -- hide '~' on empty lines

local undodir = vim.fn.expand('~/.vim/undodir')
if
    vim.fn.isdirectory(undodir) == 0
then
  vim.fn.mkdir(undodir, 'p') -- create dir if nonexistent
end

vim.o.backup = false                    -- don't create backup file
vim.o.writebackup = false               -- don't write to backup file
vim.o.swapfile = false                  -- don't create a swapfile
vim.o.undofile = true                   -- create an undo file
vim.o.undodir = undodir                 -- undo directory
vim.o.updatetime = 300                  -- faster completion
vim.o.timeoutlen = 500                  -- timeout duration
vim.o.ttimeoutlen = 50                  -- key code timeout
vim.o.autoread = true                   -- auto-reload changes if outside of neovim
vim.o.autowrite = false                 -- don't auto-save

vim.o.hidden = true                     -- allow hidden buffers
vim.o.errorbells = false                -- no error sounds
vim.o.backspace = 'indent,eol,start'    -- better backspace behavior
vim.o.autochdir = false                 -- don't change dir automatically
vim.opt.iskeyword:append('-')           -- include '-' in words ('vim.o' alias don't work here, need 'vim.opt')
vim.opt.path:append('**')               -- include subdirs in search ('vim.o' alias don't work here, need 'vim.opt')
vim.o.selection = 'inclusive'           -- include last char in selection
vim.o.mouse = "a"                       -- enable mouse support
vim.opt.clipboard:append('unnamedplus') -- use system clipboard
vim.o.modifiable = true                 -- allow buffer modifications

vim.o.guicursor = 'n-v-c:block,' ..     -- cursor blinking and settings
    --    'i-ci-ve:block,' ..
    'r-cr:hor20,' ..
    'o:hor50,' ..
    'a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,' ..
    'sm:block-blinkwait175-blinkoff150-blinkon175'

vim.o.winborder =
'rounded' -- borders for floating windows

-- Folding requiring Treesitter at runtime; safe fallback if not
vim.o.foldmethod = 'expr'                          -- use expression for folding
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- use treesitter for folding
vim.o.foldlevel = 99                               -- start with all folds open

vim.o.splitbelow = true                            -- horizontal splits go below
vim.o.splitright = true                            -- vertical splits go right

vim.o.wildmenu = true                              -- tab completion
vim.o.wildmode =
'longest:full,full'                                -- complete longest common match, full completion list, cycle through with tab
vim.opt.diffopt:append('linematch:60')             -- improve diff display
vim.o.redrawtime = 10000                           -- increase neovim redraw tolerance
vim.o.maxmempattern = 20000                        -- increase max memory

-- ===============
-- KEYMAPS
-- ===============
vim.g.mapleader = " "      -- space for leader
vim.g.maplocalleader = " " -- space for localleader

vim.keymap.set('n', 'j', function()
  return vim.v.count == 0 and 'gj' or 'j'
end, { expr = true, silent = true, desc = 'Down (wrap-aware)' })
vim.keymap.set('n', 'k', function()
  return vim.v.count == 0 and 'gk' or 'k'
end, { expr = true, silent = true, desc = 'Up (wrap-aware)' })

vim.keymap.set('n', '<leader>c', ':nohlsearch<CR>', { desc = 'Clear search highlight' })

vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })

vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste without yanking' })
vim.keymap.set({ 'n', 'v' }, '<leader>x', '"_d', { desc = 'Delete without yanking' })

vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })

vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>sh', ':split<CR>', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })

vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })

vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines and keep cursor position' })

vim.keymap.set('n', '<leader>pa', function() -- show file path
  local path = vim.fn.expand('%:p')
  vim.fn.setreg('+', path)
  print('file:', path)
end, { desc = 'Copy file path' })

vim.keymap.set('n', '<leader>td', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = 'Toggle diagnostics' })

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>') -- Yank to system
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>') -- Cut to system


-- ===============
-- AUTOCMDS
-- ===============
local augroup = vim.api.nvim_create_augroup('UserConfig', { clear = true })

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup,
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Return to last cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
  group = augroup,
  desc = 'Restore last cursor position',
  callback = function()
    if vim.o.diff then
      return
    end

    local last_pos = vim.api.nvim_buf_get_mark(0, '"')
    local last_line = vim.api.nvim_buf_line_count(0)

    local row = last_pos[1]
    if row < 1 or row > last_line then
      return
    end

    pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
  end,
})

-- Wrap, linebreak and spell check for markdown & text files
vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = { 'markdown', 'text', 'gitcommit' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    -- vim.opt_local.spell = true
  end,
})

-- ===================
-- PLUGINS (vim.pack)
-- ===================
vim.pack.add({
  {
    src = 'https://github.com/catppuccin/nvim',
    name = 'catppuccin'
  },
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
  { src = 'https://github.com/ibhagwan/fzf-lua' },
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
  },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/mason-org/mason.nvim' },
})

-- Theme & transparency
require('catppuccin').setup({
  transparent_background = true,
  float = {
    transparent = true,
  },
})
vim.cmd.colorscheme('catppuccin')

-- Mason - mostly to install LSP, Parsers and Formatters
require('mason').setup()

-- Lualine - Custom status bar with Catppuccin-themed capabilities
require("lualine").setup({
  options = {
    theme = "catppuccin-nvim",
    component_separators = "",
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = {
      { "mode", separator = { left = "" }, right_padding = 2 },
    },
    lualine_y = {
      { "progress", padding = { left = 1, right = 0 }, separator = " ", },
      { "location", padding = { left = 0, right = 1 }, },
    },
    lualine_z = {
      { function() return " " .. os.date("%R") end, separator = { right = "" }, },
    },
  },
})

-- Treesitter
local setup_treesitter = function()
  local treesitter_languages = {
    'html',
    'css',
    'javascript',
    'typescript',
    'svelte',
    'go',
    'python',
    'lua',
    'markdown',
  }

  require('nvim-treesitter').install(treesitter_languages)

  local group = vim.api.nvim_create_augroup('TreeSitterConfig', { clear = true })
  vim.api.nvim_create_autocmd('FileType', {
    group = group,
    pattern = treesitter_languages,
    callback = function()
      -- syntax highlighting
      vim.treesitter.start()
      -- folds
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo.foldmethod = 'expr'
    end,
  })
end

setup_treesitter()


-- NVIM-Tree - file explorer
require('nvim-tree').setup({
  view = { width = 35, },
  filters = { dotfiles = false, },
  renderer = { group_empty = true, },
})
vim.keymap.set('n', '<leader>e', function()
  require('nvim-tree.api').tree.toggle()
end, { desc = 'Toggle NvimTree' })

vim.api.nvim_set_hl(0, 'NvimTreeNormalNC', { bg = 'none' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeSignColumn', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { fg = '#2a2a2a', bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeEndOfBuffer', { bg = 'none' })

-- FZF-Lua
require('fzf-lua').setup({})
vim.keymap.set('n', '<leader>ff', function() require('fzf-lua').files() end, { desc = 'FZF files' })
vim.keymap.set('n', '<leader>fg', function() require('fzf-lua').live_grep() end, { desc = 'FZF live grep' })
vim.keymap.set('n', '<leader>fb', function() require('fzf-lua').buffers() end, { desc = 'FZF buffers' })
vim.keymap.set('n', '<leader>fh', function() require('fzf-lua').help_tags() end, { desc = 'FZF help tags' })
vim.keymap.set('n', '<leader>fx', function() require('fzf-lua').diagnostics_document() end,
  { desc = 'FZF Diagnostics Document' })
vim.keymap.set('n', '<leader>fX', function() require('fzf-lua').diagnostics_workspace() end,
  { desc = 'FZF Diagnostics Workspace' })


-- ===================
-- LSP & Completion
-- ===================
vim.diagnostic.config({
  virtual_text = { prefix = '●', spacing = 4 },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.HINT] = '󰠠 ',
      [vim.diagnostic.severity.INFO] = ' ',
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = true,
    header = '',
    prefix = '',
    focusable = false,
    style = 'minimal',
  },
})

local on_lsp_attach = function(ev)
  local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

  vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = 'Language format' })

  -- Ruff-specific: defer to Pyright for hover
  if client.name == 'ruff' then
    client.server_capabilities.hoverProvider = false
  end

  -- Enable LSP completion if available
  if client:supports_method('textDocument/completion') then
    vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    vim.opt.complete:append('o')
  end

  -- Enable auto formatting on save if available
  if not client:supports_method('textDocument/willSaveWaitUntil')
      and client:supports_method('textDocument/formatting') then
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = ev.buf,
      callback = function()
        vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
      end,
    })
  end

  local opts = { noremap = true, silent = true, buffer = ev.buf }

  -- Define LSP-specific keymaps
  opts.desc = 'Jump to definition'
  vim.keymap.set('n', '<leader>gd', function()
    require('fzf-lua').lsp_definitions({ jump1 = true })
  end, opts)

  opts.desc = 'Go to definition'
  vim.keymap.set('n', '<leader>gD', vim.lsp.buf.definition, opts)

  opts.desc = 'Got to definition in vertical split'
  vim.keymap.set('n', '<leader>gS', function()
    vim.cmd('vsplit')
    vim.lsp.buf.definition()
  end, opts)

  opts.desc = 'Code actions'
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

  opts.desc = 'Rename'
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

  opts.desc = 'Hover'
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

  opts.desc = 'Line diagnostics'
  vim.keymap.set('n', '<leader>D', function()
    vim.diagnostic.open_float({ scope = 'line' })
  end, opts)

  opts.desc = 'Cursor diagnostics'
  vim.keymap.set('n', '<leader>d', function()
    vim.diagnostic.open_float({ scope = 'cursor' })
  end, opts)

  opts.desc = 'Next diagnostic'
  vim.keymap.set('n', '<leader>nd', function()
    vim.diagnostic.jump({ count = 1 })
  end, opts)

  opts.desc = 'Previous diagnostic'
  vim.keymap.set('n', '<leader>pd', function()
    vim.diagnostic.jump({ count = -1 })
  end, opts)

  opts.desc = 'Find references'
  vim.keymap.set('n', '<leader>fr', function()
    require('fzf-lua').lsp_references()
  end, opts)

  opts.desc = 'Find type definitions'
  vim.keymap.set('n', '<leader>ft', function()
    require('fzf-lua').lsp_typedefs()
  end, opts)

  opts.desc = 'Find symbol (document)'
  vim.keymap.set('n', '<leader>fs', function()
    require('fzf-lua').lsp_document_symbols()
  end, opts)

  opts.desc = 'Find symbol (workspace)'
  vim.keymap.set('n', '<leader>fw', function()
    require('fzf-lua').lsp_workspace_symbols()
  end, opts)

  opts.desc = 'Find Implementations'
  vim.keymap.set('n', '<leader>fi', function()
    require('fzf-lua').lsp_implementations()
  end, opts)

  -- Keymap to organize imports
  if client:supports_method('textDocument/codeAction', ev.buf) then
    opts.desc = 'Organize imports'
    vim.keymap.set('n', '<leader>oi', function()
      vim.lsp.buf.code_action({
        context = { only = { 'source.organizeImports' }, diagnostics = {} },
        apply = true,
        bufnr = ev.buf
      })
      vim.defer_fn(function()
        vim.lsp.buf.format({ bufnr = ev.buf })
      end, 50)
    end, opts)
  end
end

vim.api.nvim_create_autocmd('LspAttach', { group = augroup, callback = on_lsp_attach })

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      }
    }
  }
})

vim.lsp.config('svelte-language-server', {})
vim.lsp.config('pyright', {
  settings = {
    pyright = {
      -- to prefer Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      -- Ignore all files to exclusively use Ruff
      analysis = { ignore = { '*' } },
    },
  }
})
vim.lsp.config('ruff', {})
vim.lsp.config('gopls', {})

vim.lsp.enable({
  'lua_ls',
  'svelte',
  'pyright',
  'ruff',
  'gopls',
})
