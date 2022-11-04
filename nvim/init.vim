set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set exrc
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set foldmethod=marker
set foldmarker={,}
set nofoldenable
set ic
set spell spelllang=en_us
set mouse=a

let mapleader=' '

" Godot Settings
let g:godot_executable = '/usr/bin/godot-mono'

" Lime Light Configuration
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:colorizer_auto_color = 1

" Goyo Settings
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

call plug#begin()
    Plug 'mfussenegger/nvim-dap'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'junegunn/fzf', { 'dir' : '~/.fzf', 'do': './install --all' }
    Plug 'preservim/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'habamax/vim-godot'
    Plug 'sophacles/vim-processing'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'OmniSharp/omnisharp-vim'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    Plug 'junegunn/limelight.vim'
    Plug 'chrisbra/Colorizer'
    Plug 'elkowar/yuck.vim'
    Plug 'gpanders/nvim-parinfer'
    Plug 'ThePrimeagen/harpoon'
    Plug 'preservim/nerdcommenter'
    Plug 'Yggdroot/indentLine'
    Plug 'mhinz/vim-startify'
    Plug 'pseewald/vim-anyfold'
    " Themes
    Plug 'yonlu/omni.vim'
    Plug 'marko-cerovac/material.nvim'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'dylanaraps/wal.vim'
    Plug 'morhetz/gruvbox'
    Plug 'sainnhe/everforest'
    Plug 'dracula/vim'
    Plug 'navarasu/onedark.nvim'
    Plug 'ayu-theme/ayu-vim'
    Plug 'nanotech/jellybeans.vim'
    Plug 'tomasr/molokai'
    Plug 'liuchengxu/vista.vim'
    Plug 'sainnhe/sonokai'
    Plug 'mangeshrex/everblush.vim'
    Plug 'benjaminjamesxyz/backtothefuture'
call plug#end()

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <F5> :!alacritty --class 'chtsh' -e bash -c "$HOME/.scripts/executor %; read"<CR><CR>
nnoremap <F8> :Vista!! <cr>
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>wq <cmd>wq<cr>
nnoremap <leader>ww <cmd>w<cr>
nnoremap <leader>sc <cmd>:!alacritty --class 'chtsh' -e $HOME/.scripts/cht.sh<cr>
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" DAP Debugger
nnoremap <leader>bb <cmd> :lua require'dap'.toggle_breakpoint() <CR>
nnoremap <leader>br <cmd>:lua require'dap'.continue() <CR>
nnoremap <leader>bn <cmd>:lua require'dap'.step_over()<CR>
nnoremap <leader>bi <cmd>:lua require'dap'.step_into()<CR>

inoremap { {}<Esc>ha
" inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha

autocmd FileType c,cpp,php,processing,cs inoremap {<CR> {<CR>}<Esc>ko
autocmd FileType c,cpp,php,processing,cs,python inoremap ( ()<Esc>ha

" Code Folder
autocmd FileType c,cpp,php,processing,cs AnyFoldActivate
let g:anyfold_fold_comments=1
set foldlevel=0
hi Folded term=NONE cterm=NONE

" Harpoon
nnoremap <C-h> :lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <leader>ha <cmd> :lua require("harpoon.mark").add_file()<cr>
" nnoremap <cmd> :lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <leader>hh :lua require("harpoon.ui").nav_next()<cr>
nnoremap <leader>hH :lua require("harpoon.ui").nav_prev()<cr>

" Copying and pasting from both buffers
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

let g:material_style = "deep ocean" 
let g:NERDCreateDefaultMappings = 1
colorscheme wal

" Neovide specific
if exists('g:neovide')
    let g:onedark_config = { 'style': 'warmer'} " dark, darker, cool, deep, warm, warmer, light
	colorscheme jellybeans
    set guifont=JetBrains\ Mono\ SemiBold:h12
    let g:neovide_transparency=0.95
    let g:neovide_cursor_vfx_mode = "sonicboom"
en

syntax enable
filetype plugin on
highlight Normal ctermbg=none
highlight Nontext ctermbg=none
