--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- start general pojok code
local on_save = true
local options = {
  backspace = vim.opt.backspace + { "nostop" }, -- Don't stop backspace at insert
  clipboard = "unnamedplus",                    -- Connection to the system clipboard
  cmdheight = 0,                                -- hide command line unless needed
  completeopt = { "menuone", "noselect" },      -- Options for insert mode completion
  copyindent = true,                            -- Copy the previous indentation on autoindenting
  cursorline = true,                            -- Highlight the text line of the cursor
  expandtab = true,                             -- Enable the use of space in tab
  fileencoding = "utf-8",                       -- File content encoding for the buffer
  fillchars = { eob = " " },                    -- Disable `~` on nonexistent lines
  history = 100,                                -- Number of commands to remember in a history table
  ignorecase = true,                            -- Case insensitive searching
  laststatus = 3,                               -- globalstatus
  lazyredraw = true,                            -- lazily redraw screen
  mouse = "a",                                  -- Enable mouse support
  number = true,                                -- Show numberline
  preserveindent = true,                        -- Preserve indent structure as much as possible
  pumheight = 10,                               -- Height of the pop up menu
  relativenumber = true,                        -- Show relative numberline
  scrolloff = 8,                                -- Number of lines to keep above and below the cursor
  shiftwidth = 2,                               -- Number of space inserted for indentation
  showmode = false,                             -- Disable showing modes in command line
  sidescrolloff = 8,                            -- Number of columns to keep at the sides of the cursor
  signcolumn = "yes",                           -- Always show the sign column
  smartcase = true,                             -- Case sensitivie searching
  splitbelow = true,                            -- Splitting a new window below the current one
  splitright = true,                            -- Splitting a new window at the right of the current one
  swapfile = false,                             -- Disable use of swapfile for the buffer
  tabstop = 2,                                  -- Number of space in a tab
  termguicolors = true,                         -- Enable 24-bit RGB color in the TUI
  timeoutlen = 300,                             -- Length of time to wait for a mapped sequence
  undofile = true,                              -- Enable persistent undo
  updatetime = 300,                             -- Length of time to wait before triggering the plugin
  wrap = true,                                  -- Disable wrapping of lines longer than the width of window
  writebackup = false,                          -- Disable making a backup before overwriting a file
  -- minimal number of screen columns either side of cursor if wrap is `false`
  -- guifont = "monospace:h17", -- the font used in graphical neovim applications
  guifont = "Source_Code_Pro:h17", -- the font used in graphical neovim applications
}
for k, v in pairs(options) do
  vim.opt[k] = v
end
vim.opt.shortmess:append "c"                         -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-"                         -- hyphenated words recognized by searches
vim.opt.formatoptions:remove { "c", "r", "o" }       -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove "/usr/share/vim/vimfiles" -- separate vim plugins from neovim in case vim still in use
vim.opt.title = true
vim.opt.titlestring = "%<%F%=%l/%L - Pojok Code"
-- end general pojok code
-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.builtin.project.active = false
lvim.builtin.project.manual_mode = true
lvim.colorscheme = "lunar"
-- lvim.colorscheme = "tokyonight-night"
-- lvim.transparent_window = true
-- require "user.lua.config.tokyonight"
-- lvim.colorscheme = "gruvbox"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- add by pojok code
lvim.keys.visual_mode["J"] = ":move '>+1<CR>gv-gv"
lvim.keys.visual_mode["K"] = ":move '<-2<CR>gv-gv"
lvim.keys.visual_mode["<A-j>"] = ":move '>+1<CR>gv-gv"
lvim.keys.visual_mode["<A-Down>"] = ":move '>+1<CR>gv-gv"
lvim.keys.visual_mode["<A-k>"] = ":move '<-2<CR>gv-gv"
lvim.keys.visual_mode["<A-Up>"] = ":move '<-2<CR>gv-gv"
lvim.keys.visual_mode["<S-Down>"] = ":'<,'>t'><cr>"

lvim.keys.insert_mode["<S-Down>"] = "<cmd>t.<cr>"
lvim.keys.insert_mode["<S-Up>"] = "<cmd>t -1<cr>"
lvim.keys.insert_mode["<M-Down>"] = "<cmd>m+<cr>"
lvim.keys.insert_mode["<M-Up>"] = "<cmd>m-2<cr>"
lvim.keys.insert_mode["<C-s>"] = "<cmd>w<cr>"
lvim.keys.insert_mode["<C-l>"] = "<cmd>LiveServer start<cr>"
lvim.keys.normal_mode["<S-Down>"] = "<cmd>t.<cr>"
lvim.keys.normal_mode["<S-Up>"] = "<cmd>t -1<cr>"
lvim.keys.normal_mode["<M-J>"] = "<cmd>t.<cr>"
lvim.keys.normal_mode["<M-K>"] = "<cmd>t -1<cr>"
lvim.keys.normal_mode["<M-Down>"] = "<cmd>m+<cr>"
lvim.keys.normal_mode["<M-Up>"] = "<cmd>m-2<cr>"
lvim.keys.normal_mode["<M-j>"] = "<cmd>m+<cr>"
lvim.keys.normal_mode["<M-k>"] = "<cmd>m-2<cr>"
lvim.keys.normal_mode["<C-s>"] = "<cmd>w<cr>"
lvim.keys.normal_mode["q"] = "<cmd>q<cr>"
-- end pojok code
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

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

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "html",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
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
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
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

-- Additional Plugins
-- lvim.plugins = {
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

lvim.builtin.alpha.dashboard.section.header.val = {
  [[             _       _                    _      ]],
  [[ _ __   ___ (_) ___ | | __   ___ ___   __| | ___ ]],
  [[| '_ \ / _ \| |/ _ \| |/ /  / __/ _ \ / _` |/ _ \]],
  [[| |_) | (_) | | (_) |   <  | (_| (_) | (_| |  __/]],
  [[| .__/ \___// |\___/|_|\_\  \___\___/ \__,_|\___|]],
  [[|_|       |__/                                   ]],
}
local function footer()
  return "Pojok Code"
end

lvim.builtin.alpha.dashboard.section.footer.val = footer()

lvim.plugins = {
  { "ellisonleao/gruvbox.nvim", event = "VeryLazy" },
  -- { "manzeloth/live-server", event = "VeryLazy" },
  { "mg979/vim-visual-multi",   event = "VeryLazy" },
  {
    "CRAG666/code_runner.nvim",
    event = "VeryLazy",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require "user.lua.config.coderunner"
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function()
      require "user.lua.config.colorizer"
    end,
  },
  { "mfussenegger/nvim-jdtls" },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      require "user.lua.config.dressing"
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "mrjones2014/smart-splits.nvim",
    event = "VeryLazy",
    config = function()
      require "user.lua.config.smartsplit"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      require "user.lua.config.autotag"
    end,
  },
  -- for manage and coloring copy
  {
    "gbprod/yanky.nvim",
    event = "BufRead",
    config = function()
      require "user.lua.config.yanky"
    end,
  },
  -- for check startuptime
  { "dstein64/vim-startuptime", cmd = "StartupTime" },
  -- for coloring pairs
  { "p00f/nvim-ts-rainbow",     event = "BufWinEnter", dependencies = "nvim-treesitter/nvim-treesitter" },
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "BufReadPre",
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
      require("mini.indentscope").setup(opts)
    end,
  },
  -- makes some plugins dot-repeatable like leap
  { "tpope/vim-repeat", event = "VeryLazy" },
  -- mini scrollview
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require "user.lua.config.neoscroll"
    end,
  },
  {
    "dstein64/nvim-scrollview",
    event = "BufRead",
    config = function()
      require "user.lua.config.nvimscroll"
    end,
  },
  -- auto complite commond mode
  {
    "gelguy/wilder.nvim",
    event = "BufWinEnter",
    config = function()
      local wilder = require "wilder"
      wilder.setup { modes = { ":", "/", "?" } }
      -- *ini popup biasa
      -- wilder.set_option(
      -- 	"renderer",
      -- 	wilder.popupmenu_renderer({
      -- 		highlighter = wilder.basic_highlighter(),
      -- 		left = { " ", wilder.popupmenu_devicons() },
      -- 		right = { " ", wilder.popupmenu_scrollbar() },
      -- 	})
      -- )

      -- *ini untuk border rounded
      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
          highlights = {
            border = "Normal", -- highlight to use for the border
          },
          -- 'single', 'double', 'rounded' or 'solid'
          -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
          border = "rounded",
          left = { " ", wilder.popupmenu_devicons() },
          right = { " ", wilder.popupmenu_scrollbar() },
        })
      )

      -- *ini untuk popup dialog
      -- wilder.set_option(
      -- 	"renderer",
      -- 	wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
      -- 		-- 'single', 'double', 'rounded' or 'solid'
      -- 		-- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
      -- 		border = "rounded",
      -- 		max_height = "40%", -- max height of the palette
      -- 		max_width = "40%",
      -- 		min_height = 0, -- set to the same as 'max_height' for a fixed height window
      -- 		prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
      -- 		reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
      -- 		left = { " ", wilder.popupmenu_devicons() },
      -- 		right = { " ", wilder.popupmenu_scrollbar() },
      -- 		pumblend = 20,
      -- 	}))
      -- )
    end,
  },
  {
    "jayp0521/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    enabled = vim.fn.has "win32" == 0,
    init = function()
      require "user.lua.config.mason_dap"
    end,
  },
  {
    "williamboman/nvim-lsp-installer",
    event = "VeryLazy",
    cmd = { "LspInstallInfo", "LspInfo" },
    config = function()
      require "user.lsp.config"
    end,
  },
}

lvim.builtin.which_key.mappings["r"] = {
  name = "Run",
  s = {
    '<cmd>autocmd bufwritepost [^_]*.sass,[^_]*.scss  silent exec "!sass %:p %:r.css"<CR>',
    "Auto Compile Sass",
  },
  r = { "<cmd>RunCode<CR>", "Run Code" },
  f = { "<cmd>RunFile<CR>", "Run File" },
  p = { "<cmd>RunProject<CR>", "Run Project" },
  g = { "<cmd>ToggleTerm size=70 direction=vertical<cr>gradle run<cr>", "Run Gradle" },
  m = {
    "<cmd>ToggleTerm size=70 direction=vertical<cr>mvn exec:java -Dexec.mainClass=com.pojokcode.App<cr>",
    "Run MVN",
  },
}

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local luasnip = require "luasnip"
local cmp = require "cmp"
lvim.builtin.cmp.mapping = {
  ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
  ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
  ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
  ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
  ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
  ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
  ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
  ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
  ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
  ["<C-y>"] = cmp.config.disable,
  ["<C-e>"] = cmp.mapping {
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  },
  ["<CR>"] = cmp.mapping.confirm { select = true },
  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expandable() then
      luasnip.expand()
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    elseif check_backspace() then
      fallback()
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),

  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
}
-- lsp installer
lvim.lsp.installer.setup.ensure_installed = {
  "lua_ls",
  -- "jsonls",
  -- "html",
  -- "cssls",
  -- "emmet_ls",
  -- "tsserver",
  -- "intelephense",
  -- "tailwindcss",
  -- "jdtls",
}

require("lvim.lsp.manager").setup "lua_ls"
-- require("lvim.lsp.manager").setup "emmet_ls"
-- require("lvim.lsp.manager").setup "tailwindcss"
-- require("lvim.lsp.manager").setup "intelephense"
-- require("lvim.lsp.manager").setup "angularls"
-- require("lvim.lsp.manager").setup "jdtls"

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua",  filetype = { "lua" } },
  { command = "prettier" },
  { command = "black" },
  -- { command = "blade_formatter", filetype = { "php", "blade", "blade.php" } },
  -- { command = "google_java_format", filetypes = { "java" } },
  -- { command = "dart_format" },
}

-- linter config
--local linters = require "lvim.lsp.null-ls.linters"
--linters.setup {
--  { command = "flake8" },
--}

-- overide webdev icon
require "user.lua.config.webdevicons"

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

if on_save then
  require "user.lua.config.auto_cmd"
end
