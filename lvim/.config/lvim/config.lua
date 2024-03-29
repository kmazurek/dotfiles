--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dap.active = true
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true

local dap_install = require("dap-install")
dap_install.config("python", {})

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

-- Additional plugins
lvim.plugins = {
  {
    "bkad/CamelCaseMotion",
    config = function()
      vim.g.camelcasemotion_key = ","
    end,
  },
  {
		"ethanholz/nvim-lastplace",
		event = "BufRead",
		config = function()
			require("nvim-lastplace").setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = {
					"gitcommit", "gitrebase", "svn", "hgcommit",
				},
				lastplace_open_folds = true,
			})
		end,
	},
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {"machakann/vim-sandwich"},
  {"mfussenegger/nvim-dap-python"},
  {"nvim-telescope/telescope-dap.nvim"},
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
    end,
  },
  {
  {"rcarriga/nvim-dap-ui"},
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  {"sainnhe/gruvbox-material"},
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      vim.g.symbols_outline = {
        auto_preview = false,
        relative_width = true,
        symbol_blacklist = { "Variable" },
        width = 35,
      }
    end,
  },
  {
    "sQVe/sort.nvim",
    config = function()
      require("sort").setup()
    end,
  },
  {"tpope/vim-fugitive"},
  {"tpope/vim-repeat"},
  {"troydm/zoomwintab.vim"},
  {"wellle/targets.vim"},
}

require("dapui").setup({
  sidebar = {
    size = 60,
    elements = {
      {
        id = "scopes",
        size = 0.5,
      },
      { id = "stacks", size = 0.25 },
      { id = "breakpoints", size = 0.25 },
    }
  }
})
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
require("dap-python").test_runner = "pytest"

-- Vim options
vim.opt.mouse = ""
vim.opt.relativenumber = true
vim.opt.scrolloff = 0
vim.opt.timeoutlen = 300

-- Set colorscheme
lvim.builtin.lualine.theme = "gruvbox-material"
lvim.colorscheme = "gruvbox-material"

-- Code formatting
lvim.format_on_save = true
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "black", filetypes = { "python" } },
}

-- Custom which-key bindings

lvim.builtin.which_key.mappings["d"] = {
  name = "+Debugging",
  b = {"<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle breakpoint"},
  c = {"<cmd>lua require('dap').run_to_cursor()<cr>", "Continue execution until current cursor line"},
  f = {"<cmd>Telescope dap frames<cr>", "List Stack frames"},
  h = {"<cmd>lua require('dap').step_back()<cr>", "Step back a single step"},
  j = {"<cmd>lua require('dap').step_into()<cr>", "Step into a function"},
  k = {"<cmd>lua require('dap').step_out()<cr>", "Step out of a function"},
  l = {"<cmd>lua require('dap').step_over()<cr>", "Step over a single step"},
  p = {"<cmd>Telescope dap list_breakpoints<cr>", "List breakpoints"},
  r = {"<cmd>lua require('dap').continue()<cr>", "Run/resume the debugger"},
  s = {"<cmd>lua require('dap').terminate()<cr>", "Stop the debugging session"},
  t = {"<cmd>lua require('dap-python').test_method()<cr>", "Debug test method under cursor"},
  u = {"<cmd>lua require('dapui').toggle()<cr>", "Toggle debugger UI"},
  v = {"<cmd>Telescope dap variables<cr>", "List local variables"},
  J = {"<cmd>lua require('dap').down()<cr>", "Go down one stack frame"},
  K = {"<cmd>lua require('dap').up()<cr>", "Go up one stack frame"},
}

lvim.builtin.which_key.mappings["G"] = {
  name = "+Conflicts",
  h = {"<cmd>diffget //2<cr>", "Apply left (our) version of hunk"},
  j = {"]c", "Jump to next hunk"},
  k = {"[c", "Jump to previous hunk"},
  l = {"<cmd>diffget //3<cr>", "Apply right (their) version of hunk"},
  p = {"<cmd>diffput //1<cr>", "Apply hunk to the working copy"},
  r = {"<cmd>Gvdiffsplit!<cr>", "Vertical three-way resolution"},
  R = {"<cmd>Gvdiffsplit!<cr>", "Vertical three-way resolution"},
  w = {"<cmd>Gwrite!<cr>", "Write file to to git index and stage it"},
}

lvim.builtin.which_key.mappings["h"] = {
  "<cmd>Telescope oldfiles<cr>", "Recent files"
}

lvim.builtin.which_key.mappings["lo"] = {
  "<cmd>SymbolsOutline<cr>", "Toggle symbols outline"
}

lvim.builtin.which_key.mappings["p"] = {
  "<cmd>Telescope projects<cr>", "Recent projects"
}

lvim.builtin.which_key.mappings["ss"] = {
  "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "LSP workspace symbols"
}

lvim.builtin.which_key.mappings["S"] = {
  "<cmd>Sort<cr>", "Sort"
}

lvim.builtin.which_key.mappings["q"] = {
  "<cmd>Telescope live_grep<cr>", "Toggle symbols outline"
}

lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  t = { "<cmd>TroubleToggle<cr>", "Toggle Trouble window" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

lvim.builtin.which_key.mappings["w"] = {
  "<cmd>Telescope grep_string<cr>", "Search for string under cursor"
}

lvim.builtin.which_key.mappings["x"] = {
  name = "+Splits",
  h = {"<cmd>split<cr>", "Split horizontally"},
  v = {"<cmd>vsplit<cr>", "Split vertically"},
  x = {"<cmd>q<cr>", "Close split"},
}

lvim.builtin.which_key.mappings["zz"] = {
  "<cmd>ZoomWinTabToggle<cr>", "Toggle zoom"
}

-- Navigation

-- hop.nvim
vim.api.nvim_set_keymap("n", "<CR>", ":HopWord<CR>", { noremap = true, silent = true })
lvim.keys.normal_mode["<Leader><CR>"] = "<CR>"

-- Moving between splits
lvim.keys.normal_mode["<A-h>"] = "<C-W><C-H>"
lvim.keys.normal_mode["<A-j>"] = "<C-W><C-J>"
lvim.keys.normal_mode["<A-k>"] = "<C-W><C-K>"
lvim.keys.normal_mode["<A-l>"] = "<C-W><C-L>"

-- Clear search highlighting
lvim.keys.normal_mode["<Backspace>"] = "<cmd>nohlsearch<cr>"

-- Built-in plugins configuration

-- lualine.nvim
lvim.builtin.lualine.sections.lualine_c = {'location'}

-- nvim-cmp
local cmp = require "cmp"
-- Set up <CR> to accept first result from autocomplete
local completion_func = function(fallback)
  if cmp.visible() then
    cmp.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true})
  else
    fallback()
  end
end
lvim.builtin.cmp.mapping["<CR>"] = completion_func

-- nvim-tree.lua
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.view.width = 40
lvim.builtin.nvimtree.show_icons.git = 1

-- telescope.nvim
local telescope_actions = require "telescope.actions"
lvim.builtin.telescope.defaults.mappings.i["C-v"] = telescope_actions.select_vertical
lvim.builtin.telescope.defaults.mappings.i["C-h"] = telescope_actions.select_horizontal

lvim.builtin.telescope.defaults.layout_strategy = "flex"
-- When window width it 150 or less: use the vertical layout
lvim.builtin.telescope.defaults.layout_config.flex = { flip_columns = 150 }
-- Width of the Telescope overlay, defined as percentage of the window's width
lvim.builtin.telescope.defaults.layout_config.width = 0.90

lvim.builtin.telescope.defaults.path_display = { "truncate" }
require('telescope').load_extension('dap')

-- Treesitter
local treesitter = lvim.builtin.treesitter
table.insert(treesitter.indent.disable, "python")
