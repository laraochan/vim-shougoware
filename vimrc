set nocompatible

const g:mapleader = "\<space>"

const s:dpp_base = '~/.cache/dpp/'

const s:denops_src = '~/.cache/dpp/repos/github.com/vim-denops/denops.vim'

execute 'set runtimepath+=' .. s:denops_src

const s:dpp_src = '~/.cache/dpp/repos/github.com/Shougo/dpp.vim'
const s:dpp_installer = '~/.cache/dpp/repos/github.com/Shougo/dpp-ext-installer'
const s:dpp_local = '~/.cache/dpp/repos/github.com/Shougo/dpp-ext-local'
const s:dpp_lazy = '~/.cache/dpp/repos/github.com/Shougo/dpp-ext-lazy'
const s:dpp_toml = '~/.cache/dpp/repos/github.com/Shougo/dpp-ext-toml'
const s:dpp_git = '~/.cache/dpp/repos/github.com/Shougo/dpp-protocol-git'

execute 'set runtimepath+=' .. s:dpp_src
execute 'set runtimepath+=' .. s:dpp_installer
execute 'set runtimepath+=' .. s:dpp_local
execute 'set runtimepath+=' .. s:dpp_lazy
execute 'set runtimepath+=' .. s:dpp_toml
execute 'set runtimepath+=' .. s:dpp_git

if s:dpp_base->dpp#min#load_state()
	autocmd User DenopsReady
		\ : echohl WarningMsg
		\ | echomsg 'dpp load_state() is failed'
		\ | echohl NONE
		\ | call dpp#make_state(s:dpp_base, '~/.config/vim/dpp.ts')
endif

autocmd User Dpp:makeStatePost
	\ : echohl WarningMsg
	\ | echomsg 'dpp make_state() is done'
	\ | echohl NONE

filetype indent plugin on
if has('syntax')
	syntax on
endif

set termguicolors
set clipboard+=unnamed
set signcolumn=yes
set nobackup
set nowritebackup
set noswapfile
set noundofile
set nowrap
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set background=dark

nnoremap <leader>bd <cmd>bd<cr>
nnoremap <leader>bn <cmd>bn<cr>
nnoremap <leader>bp <cmd>bp<cr>

" disable embed plugins
let s:save_rtp = &runtimepath
set rtp-=$VIMRUNTIME
autocmd SourcePre */plugin/* ++once let &runtimepath = s:save_rtp
