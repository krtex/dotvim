" +--------------------------+
" | My precious .vimrc file! |
" +--------------------------+

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" disable vi compatibility (emulation of old bugs)
set nocompatible

" use indentation of previous line
set autoindent

" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4 " tab width is 4 spaces
set shiftwidth=4 " indent also with 4 spaces
set expandtab " expand tabs to spaces

" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=98

" turn syntax highlighting on
set t_Co=256
syntax on
" colorscheme wombat256

" turn line numbers on
set number

" highlight matching braces
set showmatch

" hide warning about hidden buffers
set hidden

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>
" Load standard tag files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4


" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="John Doe <john@doe.com>" 

" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
"cos nie banglalo, zmiana na: (dalej nie bangla
":noremap :TlistToggle
":let Tlist_Show_One_File = 1
":let Tlist_Exit_OnlyWindow = 1
":let Tlist_Use_Right_Window = 1 
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>
" in diff mode we use the spell check keys for merging
if &diff
” diff settings
map <M-Down> ]c
map <M-Up> [c
map <M-Left> do
map <M-Right> dp
map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
" spell settings
:setlocal spell spelllang=en
" set the spellfile - folders must exist
set spellfile=~/.vim/spellfile.add
map <M-Down> ]s
map <M-Up> [s
endif 

"set noequalalways - no window resize after close
set noea

"working backspace
:set bs=2
"support for 256 colors
"set t_Co=256
set mouse=a
set noswapfile
syntax on
filetype on
set nowrap

set ignorecase
:set smartcase

" Only do this part when compiled with support for autocommands
if has("autocmd")
    " Enable file type detection
    filetype on

    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    " Customisations based on house-style (arbitrary)
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

    au BufNewFile,BufRead *.ttcn3 set filetype=ttcn
    au BufNewFile,BufRead *.k3.txt set filetype=log
    au! Syntax ttcn source /home/kret/.vim/syntax/ttcn.vim

    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * call StartUp()

endif


function! StartUp()
    NERDTree
endfunction

" bloody useful for adding new packages
execute pathogen#infect()
syntax on
filetype plugin indent on

" Mapping for changing window focus
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Mapping for changing tabs (firefox style:P)
map <C-1> 1gt
map <C-2> 2gt
map <C-3> 3gt
map <C-4> 4gt
map <C-5> 5gt
map <C-6> 6gt
map <C-7> 7gt
map <C-8> 8gt
map <C-9> 9gt
map <C-0> :tablast<CR>

" Mapping for better acces for directories
noremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Cool text bubbeling (it required unimpaired.vim package!)
" " Bubble single lines
 nmap <C-Up> [e
 nmap <C-Down> ]e
" " Bubble multiple lines
 vmap <C-Up> [egv
 vmap <C-Down> ]egv

" +-------------------------+
" | Some legacy code lolz:P |
" +-------------------------+

"show line numbers / relative line num
":set nu

":set autoindent
":set softtabstop=4 shiftwidth=4 expandtab
"indent settings
":set ts=4 sw=4 et
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1


"" color theme Dracula
"syntax on
"color Dracula
