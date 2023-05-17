-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }
    use { 'neoclide/coc.nvim', branch = 'release'}
    use { 'mfussenegger/nvim-dap' }
    use { 'nvim-telescope/telescope.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'junegunn/fzf', rtp = '~/.fzf', run = './install --all' }
    use { 'preservim/nerdtree' }
    use { 'vim-airline/vim-airline' }
    use { 'habamax/vim-godot' }
    use { 'sophacles/vim-processing' }
    use { 'OmniSharp/omnisharp-vim' }
    use { 'skywind3000/asyncrun.vim' }
    use { 'junegunn/goyo.vim' }
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }
    use { 'chrisbra/Colorizer' }
    use { 'liuchengxu/vista.vim' }
    use { 'elkowar/yuck.vim' }
    use { 'gpanders/nvim-parinfer' }
    use { 'ThePrimeagen/harpoon' }
    use { 'preservim/nerdcommenter' }
    use { 'Yggdroot/indentLine' }
    use { 'mhinz/vim-startify' }
    use { 'pseewald/vim-anyfold' }
    use { 'krivahtoo/silicon.nvim', run = './install.sh' }
    use { 'christoomey/vim-tmux-navigator' }
	use { 'tpope/vim-fugitive' }
    use { 'mbbill/undotree' }
    use { 'tpope/vim-surround' }
    -- Themes }
    use { "catppuccin/nvim", as = "catppuccin",
        config = function() require('catppuccin').setup({
            transparent_background=true,
            term_colors=true
        }) end
        }
    use { 'yonlu/omni.vim' }
    use { 'marko-cerovac/material.nvim' }
    use { 'vim-airline/vim-airline-themes' }
    use { 'dylanaraps/wal.vim' }
    use { 'morhetz/gruvbox' }
    use { 'sainnhe/everforest' }
    use { 'navarasu/onedark.nvim' }
    use { 'ayu-theme/ayu-vim' }
    use { 'nanotech/jellybeans.vim' }
    use { 'tomasr/molokai' }
    use { 'sainnhe/sonokai' }
    use { 'mangeshrex/everblush.vim' }
    use { 'benjaminjamesxyz/backtothefuture' }
    use { 'AlexvZyl/nordic.nvim', branch = 'main' }
    use { 'https://github.com/arturgoms/moonbow.nvim' }
    use {
        'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('gitsigns').setup() end
    }
    use {'dracula/vim', as = 'dracula'}
    use {'tikhomirov/vim-glsl'}
end)
