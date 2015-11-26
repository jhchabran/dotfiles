if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.nvim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.nvim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Dependencies go there
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'venantius/vim-cljfmt'
NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-sexp-mappings-for-regular-people'
NeoBundle 'guns/vim-sexp'
NeoBundle 'gregsexton/gitv'
NeoBundle 'mileszs/ack.vim' 
NeoBundle 'godlygeek/tabular'
NeoBundle 'majutsushi/tagbar'
"NeoBundle 'git://gitorious.org/vim-gnupg/vim-gnupg.git'

"NeoBundle 'xolox/vim-easytags', 'async-take-two'
NeoBundle 'xolox/vim-misc', 'master'

NeoBundle 'tpope/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-rails'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'fatih/vim-go'
NeoBundle 'nsf/gocode', {'rtp': 'vim/'}
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'groenewege/vim-less'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'vim-scripts/DrawIt'
NeoBundle 'scrooloose/nerdtree'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'sjl/badwolf'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'endel/vim-github-colorscheme'
NeoBundle 'romainl/Apprentice'
NeoBundle 'zenorocha/dracula-theme', {'rtp': 'vim/'}



call neobundle#end() 
	
filetype plugin indent on

let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
	let g:make = 'make'
endif

NeoBundleCheck
