local fn = vim.fn

-- automatically installs packer
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
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
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

-- Install your plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-tree/nvim-tree.lua" }
  use { "nvim-tree/nvim-web-devicons" }
  -- use { "github/copilot.vim" }
  use { "nvim-lualine/lualine.nvim" } -- Status line
  use { "akinsho/toggleterm.nvim" } -- Terminal
  use { "lukas-reineke/indent-blankline.nvim" } -- Indent lines
  use { "goolord/alpha-nvim" } -- Greeting screen
  use { "folke/which-key.nvim" } -- Keybindings helper
  use { "akinsho/bufferline.nvim" } -- Bufferline
  use { "moll/vim-bbye" } -- Close buffer
  use { "numToStr/Comment.nvim" } -- Comment lines
  use { "JoosepAlviste/nvim-ts-context-commentstring" } -- Comment mixed file string
  use { "RRethy/vim-illuminate" } -- Highlight word under cursor
  use { "windwp/nvim-autopairs" } -- Autoclose
  -- use { "kawre/neotab.nvim", event = "InsertEnter" }

  --color schemes
  use { "folke/tokyonight.nvim" }
  use { "catppuccin/nvim" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim" }
  use { "nvim-lua/plenary.nvim" }

  -- cmp --
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp" } 
  use { "saadparwaiz1/cmp_luasnip" }
  use { "hrsh7th/cmp-path" } 
  use { "hrsh7th/cmp-buffer" }

  -- snippets --
  use { "L3MON4D3/LuaSnip" }
  use { "rafamadriz/friendly-snippets" }

  -- LSP
  use { "neovim/nvim-lspconfig" } -- LSP
  use { "williamboman/mason.nvim", run = ":MasonUpdate" } -- Masonj 
  use { "williamboman/mason-lspconfig.nvim" } -- Mason LSP config

  --tree sitter
  use { "nvim-treesitter/nvim-treesitter" }

  -- Git
  use { "lewis6991/gitsigns.nvim" }

  -- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
