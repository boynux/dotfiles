set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'wincent/command-t'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'OCamlPro/ocp-indent'
Plugin 'the-lambda-church/merlin'
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

let g:syntastic_ocaml_checkers = ['merlin']

" --- Airline config
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
" ---

" --- Syntastic plugin configs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
" ---

set autoindent
set shiftwidth=2
set tabstop=2
set expandtab
set nu

let g:solarized_termcolors=16

" set background=dark
" colorscheme solarized


autocmd BufReadPre,BufNewFile * let b:did_ftplugin = 1
syntax on

" Custom bindings

nnoremap <Leader><tab> :NERDTreeToggle<CR>

" Auto save
" set autowriteall
:au FocusLost * :wa


" Go vim
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_bin_path = expand("~/.gotools")
let g:go_fmt_command = "goimports"

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

set undodir=~/.tmp/vim
set undofile
