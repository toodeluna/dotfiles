-- Plugins
vim.cmd.packadd "packer.nvim"

require "packer".startup(function(use)
	use "wbthomason/packer.nvim"
	use "theprimeagen/harpoon"
	use "mbbill/undotree"
	use "nvim-tree/nvim-web-devicons"
	use "nvim-lualine/lualine.nvim"
	use "neovim/nvim-lspconfig"
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-nvim-lsp"
	use "saadparwaiz1/cmp_luasnip"
	use "L3MON4D3/LuaSnip"
	use "numToStr/Comment.nvim"
	use "lewis6991/gitsigns.nvim"
	use "romgrk/barbar.nvim"
	use "voldikss/vim-floaterm"
	use "nvim-tree/nvim-tree.lua"
	use "ahmedkhalf/project.nvim"
	use "simrat39/symbols-outline.nvim"
	use "windwp/nvim-autopairs"
	use "windwp/nvim-ts-autotag"
	use { "startup-nvim/startup.nvim", requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" } }
	use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }
	use { "catppuccin/nvim", as = "catppuccin" }
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
end)

-- Basic settings
vim.opt.wrap = false
vim.opt.scrolloff = 10

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true
vim.cmd.colorscheme("catppuccin-macchiato")

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.list = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Basic keybindings
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", vim.cmd.exit)
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-l>", "<C-W>l")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

--------------------------
-- == SET UP PLUGINS == --
--------------------------

-- Auto pairs
require("nvim-autopairs").setup {}

-- Auto comment code
require("Comment").setup {
	toggler = {
		line = "<leader>cl",
		block = "<leader>cb",
	},
	opleader = {
		line = "<leader>cl",
		block = "<leader>cb",
	},
	extra = {
		above = "<leader>ck",
	},
}


-- Undotree
vim.g.undotree_WindowLayout = 3
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Telescope
require("telescope").load_extension("projects")

local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>fp", telescope.git_files)
vim.keymap.set("n", "<leader>ff", telescope.find_files)
vim.keymap.set("n", "<leader>fg", telescope.live_grep)
vim.keymap.set("n", "<leader>fb", telescope.buffers)

-- Harpoon
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>hm", harpoon_mark.add_file)
vim.keymap.set("n", "<leader>hu", harpoon_ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>ha", function() harpoon_ui.nav_file(1) end)
vim.keymap.set("n", "<leader>hs", function() harpoon_ui.nav_file(2) end)
vim.keymap.set("n", "<leader>hd", function() harpoon_ui.nav_file(3) end)
vim.keymap.set("n", "<leader>hf", function() harpoon_ui.nav_file(4) end)

-- Terminal
vim.keymap.set("n", "<leader>t", ":FloatermNew<CR>")

-- NvimTree
require("nvim-tree").setup {
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true
	},
}

vim.keymap.set("n", "<leader>ft", vim.cmd.NvimTreeToggle)

-- Symbol outline
require("symbols-outline").setup {}
vim.keymap.set("n", "<leader>fs", vim.cmd.SymbolsOutline)

-- Projects
require "project_nvim".setup {}
vim.keymap.set("n", "<leader>p", function() vim.cmd.Telescope("projects") end)

-- Start page
require("startup").setup {
	options = {
		mapping_keys = true,
		cursor_column = 0.5,
		empty_lines_between_mappings = true,
		disable_statuslines = false,
		paddings = { 10, 2 },
	},
	mappings = {
		execute_command = "<CR>",
		open_file = "o",
		open_file_split = "<c-o>",
		open_section = "<TAB>",
		open_help = "?",
	},
	colors = {
		background = "#1f2227",
		folded_section = "#56b6c2",
	},
	header = {
		type = "text",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Header",
		margin = 5,
		content = {
			" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
			" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
			" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
			" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
			" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
			" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
			"",
			"૮꒰˶• ༝ •˶꒱ა ♡",
		},
		highlight = "Statement",
		default_color = "",
		oldfiles_amount = 0,
	},
	actions = {
		type = "mapping",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Basic Commands",
		margin = 5,
		content = {
			{ " Open Project", "Telescope projects", "<leader>p" },
			{ " Recent Files", "Telescope oldfiles", "<leader>of" },
			{ " New File", "lua require'startup'.new_file()", "<leader>nf" },
		},
		highlight = "String",
		default_color = "",
		oldfiles_amount = 0,
	},
	parts = { "header", "actions" },
}

-- Lualine
require("lualine").setup {
	options = {
		disabled_filetypes = { "packer", "NvimTree" },
	},
}

-- Tabs
require("barbar").setup {
	exclude_name = { "/usr/bin/fish" },
	icons = {
		preset = "slanted",
	},
}

vim.keymap.set("n", "<Tab>", vim.cmd.BufferNext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.BufferPrevious)
vim.keymap.set("n", "<leader><Tab>", vim.cmd.BufferPick)
vim.keymap.set("n", "<leader>x", vim.cmd.BufferClose)

-- Treesitter
require("nvim-treesitter.configs").setup {
	ensure_installed = { "lua", "javascript", "typescript", "c", "haskell", "go" },
	sync_install = false,
	auto_install = false,
	highlight = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
}

-- LSP
local capabilities = require "cmp_nvim_lsp".default_capabilities()
local lspconfig = require "lspconfig"
local luasnip = require "luasnip"
local cmp = require "cmp"

vim.diagnostic.config {
	update_in_insert = true,
}

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buffer }

		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)

		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("UserLspAutoFormat", {}),
			callback = function()
				vim.lsp.buf.format()
			end
		})
	end,
})

cmp.setup {
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert {
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<CR>"] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		},
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
}

-- Go
lspconfig.gopls.setup {}

-- Typescript
jsts_format_settings = {
	indentSize = 2,
	convertTabsToSpaces = true,
	semicolons = "insert",
}

lspconfig.tsserver.setup {
	settings = {
		typescript = {
			format = jsts_format_settings,
		},
		javascript = {
			format = jsts_format_settings,
		},
	},
}

-- Lua
lspconfig.lua_ls.setup {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}

-- Haskell
lspconfig.hls.setup {
	capabilities = capabilities,
	filetypes = { "haskell", "lhaskell", "cabal" },
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = "haskell",
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
	end
})

-- C/C++
lspconfig.clangd.setup {}
