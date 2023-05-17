set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set exrc
set relativenumber
set cursorline
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
set mouse=

lua require('plugins')

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

nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <F5> :!alacritty --class 'chtsh' -e bash -c "time $HOME/.scripts/executor %; read"<CR><CR>
nnoremap <F4> :!alacritty --class 'chtsh' -e bash -c "time $HOME/.scripts/executor2 %; read"<CR><CR>
nnoremap <C-n> :Vista!! <CR>
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
 "inoremap ( ()<Esc>ha
" inoremap [ []<Esc>ha

autocmd FileType c,cpp,php,processing,cs,javascript inoremap {<CR> {<CR>}<Esc>ko
autocmd FileType c,cpp,php,processing,cs,javascript,python inoremap ( ()<Esc>ha
autocmd FileType markdown nnoremap <F6> <cmd>pandoc -t beamer % -o pres.pdf<CR>

" Code Folder
"autocmd FileType c,cpp,php,processing,cs AnyFoldActivate
let g:anyfold_fold_comments=1
set foldlevel=0
hi Folded term=NONE cterm=NONE

" silicon nvim
lua << EOF
require('silicon').setup({
  font = 'FantasqueSansMono Nerd Font=16',
  theme = 'Dracula',
})
EOF

" UndoTree
nnoremap <leader>u :UndotreeToggle<CR>

" Harpoon
nnoremap <Leader>hh :lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <leader>ha <cmd> :lua require("harpoon.mark").add_file()<cr>
nnoremap <leader>1 :lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <leader>2 :lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <leader>3 :lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <leader>4 :lua require("harpoon.ui").nav_file(4)<cr>
nnoremap <leader>5 :lua require("harpoon.ui").nav_file(5)<cr>
nnoremap <leader>6 :lua require("harpoon.ui").nav_file(6)<cr>

" nnoremap <leader>hh :lua require("harpoon.ui").nav_next()<cr>
" nnoremap <leader>hH :lua require("harpoon.ui").nav_prev()<cr>

" Source Config
nnoremap <Leader>ss <cmd> source ~/.config/nvim/init.vim<cr>

"Tmux Navigation
nnoremap <C-h> <cmd> TmuxNavigateLeft<cr>
nnoremap <C-l> <cmd> TmuxNavigateRight<cr>
nnoremap <C-j> <cmd> TmuxNavigateDown<cr>
nnoremap <C-k> <cmd> TmuxNavigateUp<cr>

" Copying and pasting from both buffers
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
" end

let g:material_style = "deep ocean" 
let g:NERDCreateDefaultMappings = 1
colo catppuccin-mocha

syntax enable
filetype plugin on
"highlight Normal ctermbg=none
"highlight Nontext ctermbg=none

" Neovide specific
if exists('g:neovide')
    let g:onedark_config = { 'style': 'darker'} " dark, darker, cool, deep, warm, warmer, light
    colorscheme ayu
    set guifont=JetBrains\ Mono\ SemiBold:h10
    let g:neovide_transparency=0.8
    let g:neovide_cursor_vfx_mode = "sonicboom"
en
