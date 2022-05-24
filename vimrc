set hlsearch
syntax on
autocmd vimenter * ++nested colorscheme gruvbox
set termguicolors
set background=dark
" set auto-folding to 'indent' mode('syntax','expr','marker')
setlocal foldmethod=indent
" set map key <leader> to SPACE
let mapleader=" "

" installing Vim-Plug package manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" The installed plug-in listed:
call plug#begin(expand('~/.vim/plugged'))
Plug 'morhetz/gruvbox'
Plug 'preservim/NERDTree'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
call plug#end()

" gruvbox settings
let g:gruvbox_bold = 1
colorscheme gruvbox
" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers = ['pylint']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" gitgutter settings
" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1

" VimTex
syntax enable 
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
" key-bindings
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

inoremap <C-N> <ESC>:tabnew<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

