-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    -- Quality of life packages
    use 'preservim/nerdcommenter'
    use 'jiangmiao/auto-pairs'
    use 'airblade/vim-gitgutter'
    use 'tpope/vim-surround'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    }

    use 'tpope/vim-vinegar'
    use ({
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('todo-comments').setup()
        end
    })
    use ({
        'nordtheme/vim', as = "nord",
        config = function()
            vim.cmd('colorscheme nord')
        end
    })
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use ('theprimeagen/harpoon')
	use ('mbbill/undotree')
    use ('lervag/vimtex')
	use ('tpope/vim-fugitive')
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
			'williamboman/mason.nvim',
			run = function()
				pcall(vim.api.nvim_command, 'MasonUpdate')
			end,
		},
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
	}
}
end)
