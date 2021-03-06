-- vim.fn.system({array}) is a nvim wrapper over lua os.system()
local fn = vim.fn

-- @brief: disables built-in plugins to boost performance
local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"matchparen",
	"tutor",
	"tar",
	"tarPlugin",
	"rrhelper",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
local reloadID = vim.api.nvim_create_augroup("packer_user_config", {
	clear = true,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	group = reloadID,
	desc = "Reloads packer plugins when plugins.lua file changes",
	pattern = { "plugins.lua" },
	command = "source <afile> | PackerSync",
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("Error! Packer has failed to init!")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- @Performance --
	use("nathom/filetype.nvim")
	use("lewis6991/impatient.nvim")

	-- @PluginManagement
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	-- @FileSystem
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")

	-- @Lualine
	use("nvim-lualine/lualine.nvim")

	-- @Tagbar
	use("simrat39/symbols-outline.nvim")

	-- @GuiVim
	use({
		-- @Mikhail: these two plugins work great together for GUI vim
		-- on some systems (especially OS X) it's impossible to launch vim
		-- with CLI arguments (i.e. give certain file), thus it's great to be
		-- able to quicly jump to Git Projects
		"ahmedkhalf/project.nvim",
		"goolord/alpha-nvim",
	})

	-- @VanillaLike_Helpers
	use("tpope/vim-obsession")
	use("kshenoy/vim-signature")
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("JoosepAlviste/nvim-ts-context-commentstring") -- smart comments (aware of nested languages)
	use("akinsho/toggleterm.nvim")
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
	})

	-- @Colorschemes
	use("navarasu/onedark.nvim")
	use("folke/tokyonight.nvim")
	use("NTBBloodbath/doom-one.nvim")

	-- @Folding
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	-- @Completition
	-- use 'github/copilot.vim'
	use({
		"hrsh7th/nvim-cmp", -- The completion plugin
		"L3MON4D3/LuaSnip", -- snippet engine, required for completition

		-- @SourcesOfCompletition
		"hrsh7th/cmp-buffer", -- buffer completions
		"hrsh7th/cmp-path", -- path completions
		"hrsh7th/cmp-cmdline", -- cmdline completions
		"hrsh7th/cmp-nvim-lsp", -- LSP completitions
	})

	-- @Snippets
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- @LSP
	use("neovim/nvim-lspconfig") -- enable LSP

	-- LSP Installer
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })

	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("antoinemadec/FixCursorHold.nvim")
	use("tamago324/nlsp-settings.nvim")

	-- @Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-symbols.nvim")

	-- @Keybindings
	use("folke/which-key.nvim")

	-- @Treesitter @SyntaxHighlighting
	use("lukas-reineke/indent-blankline.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		-- @Note: this is great plugin for plugin development.
		-- Provides access to raw tresitter AST.
		-- use "nvim-treesitter/playground"
	})

	-- @Git
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")

	-- @Wiki, @NoteTaking
	use("nvim-neorg/neorg")
	use("itchyny/calendar.vim")

	-- use("vimwiki/vimwiki")

	-- @Navigation
	use("akinsho/bufferline.nvim")
	use("christoomey/vim-tmux-navigator")

	-- @Lua
	use("git@github.com:folke/lua-dev.nvim.git")

	-- @Debugging
	use({ "mfussenegger/nvim-dap" })
	use({
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-telescope/telescope-dap.nvim",
	})

	use({
		"Pocco81/dap-buddy.nvim",
		branch = "dev",
		-- event = "BufWinEnter",
		-- event = "BufRead",
	})

	-- @Tasks
	use("jedrzejboczar/toggletasks.nvim")

	-- @C_CXX_Development
	use({ "cdelledonne/vim-cmake", ft = { "c", "cpp", "cmake", "makefile" } })

	-- @Web
	use({ "norcalli/nvim-colorizer.lua" })

	-- @Docker
	-- use 'jamestthompson3/nvim-remote-containers'

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
