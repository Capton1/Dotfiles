set encoding=utf-8 fileencoding=
filetype off
set nocompatible

" set colorscheme for lightline
let g:lightline = {
            \ 'colorscheme': 'simpleblack',
            \ }

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"
" set plugin here
"
Plugin 'delimitMate.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'ajh17/VimCompletesMe'
Plugin 'DoxygenToolkit.vim'

call vundle#end()
filetype plugin indent on

syntax on
syntax enable
set expandtab
set number
set tabstop=4
set autoindent
set mouse=a
set smartindent
set shiftwidth=4
set smarttab
set shiftround
set ruler
set colorcolumn=80
set title
autocmd Filetype make set noexpandtab tabstop=4
set foldmethod=indent
set foldnestmax=3
set nofoldenable
set display+=lastline
set linebreak
set scrolloff=1
set sidescrolloff=5
set wrap
set laststatus=2
set wildmenu
set tabpagemax=50
set backspace=indent,eol,start
set noswapfile
set hlsearch

set list listchars=tab:>\ ,trail:.

set autoread
set autowrite

" Remove trailing space
autocmd BufWritePre * %s/\s\+$//e
" Auto-indent when buffer is read
autocmd BufRead *.c :normal gg=G
" autocmd completion
autocmd FileType vim let b:vcm_tab_complete = 'vim'

" include c/cpp gates
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o# define " . gatename
  execute "normal! Go\n\n\n#endif /* " . gatename . " */"
  normal! kk
endfunction

autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

" use enter to choose completion with VCM
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Open the quickfix window if there are errors, or close it if there are no
" errors left
noremap <leader>cw :botright :cw<cr>

" Run make silently, then skip the 'Press ENTER to continue'
noremap <leader>m :silent! :make! \| :redraw!<cr>

" for doxygen
let g:DoxygenToolkit_startCommentTag = "/** "
let g:DoxygenToolkit_startCommentBlock = "/** "
let g:DoxygenToolkit_interCommentTag = "** "
let g:DoxygenToolkit_interCommentBlock = "** "
let g:DoxygenToolkit_compactOneLineDoc = "yes"
let g:DoxygenToolkit_compactDoc = "yes"
