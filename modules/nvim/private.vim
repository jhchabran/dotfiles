syntax enable
set background=dark
"set background=light
colorscheme solarized

"Always open the tree when booting Vim, but don’t focus it
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Disabled and replaced with LEADER-TAB by default

"nnoremap <Leader><Leader> :e#<CR>

"automatically save the current buffer when you hit Esc twice
map <Esc><Esc> :w<CR>



" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg -u --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

