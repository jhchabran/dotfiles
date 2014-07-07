if has('vim_starting')
set nocompatible               " Be iMproved

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Dependencies go there
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'gregsexton/gitv'
NeoBundle 'mileszs/ack.vim' 
NeoBundle 'godlygeek/tabular'
NeoBundle 'git://gitorious.org/vim-gnupg/vim-gnupg.git'

NeoBundle 'xolox/vim-easytags', 'async-take-two'
NeoBundle 'xolox/vim-misc', 'master'

NeoBundle 'tpope/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'

call neobundle#end() 
	
filetype plugin indent on

let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
	let g:make = 'make'
endif
NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': g:make}}

NeoBundleCheck
