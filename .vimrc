"install it for vim and neovim
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"cd ~/.vim
"vundle to vim-plug conversion
"mv ~/.vim/bunde ~/.vim/plugged
":PlugUpdate -> update and install plugins!
":PlugUpgrade -> upgrade 'junegunn/vim-plug' itself
":UpdateRemotePlugins -> for python 2/3 plugins like lldb!
"cd ~/.vim
"ln -s ./bundle ./plugged

"this .vimrc is now also nevoimcompatible and can be used in both, thanks to this -> if has("nvim)
"do this to share it and also the vim-plug pluggins
"cd .config/nvim
"ln -s ~/.vimrc ./init.vim
"ln -s ~/.vim/after ./after
"also neovim needs python*-support to be installed seperatley -> :help nvim-python
"on arch its in the community repo ->
"sudo pacman community/python-nvim
"sudo pacman community/python2-nvim

"on ctags support for any language:
"as described here you need to put this in your ~/ctags file
"https://github.com/majutsushi/tagbar/wiki#rust

"installing/updating YouCompleteMe (it complaints that its server shut down when its needs this)
"cd ~/.vim/bundle/YouCompleteMe/
"./install.py --racer-completer

syntax enable

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set shell=bash

set nocompatible              " be iMproved, required
filetype off                  " required

" ============ vim-plug ===========
call plug#begin('~/.vim/plugged')
" ============ /vim-plug ===========
" ============ vundle ===========
"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')

"" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
" ============ /vundle ===========

"REMINDER: Vundle needs 'Plugin' <-> vim plug just needs 'Plug'
"if has("nvim")
"sticking with syntastic, works better.
Plug 'scrooloose/syntastic'
"else
"Plug 'neomake/neomake'
"endif
"complaints about double used binding i have no idea why, and normal docs are good enough :man ftw
"Plug 'powerman/vim-plugin-viewdoc'
Plug 'rust-lang/rust.vim'
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
"Plug 'wellle/targets.vim'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'christoomey/vim-sort-motion'
"Plug 'michaeljsmith/vim-indent-object'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'sjl/badwolf'
Plug 'racer-rust/vim-racer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Conque-GDB'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'shougo/unite.vim'
Plug 'dan-t/rusty-tags'
Plug 'Raimondi/delimitMate'
Plug 'sirver/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'timonv/vim-cargo'
Plug 'Nonius/cargo.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'jlanzarotta/bufexplorer'
Plug 'chaoren/vim-wordmotion'
"Plug 'vim-scripts/EasyClipRing.vim'
"Plug 'severin-lemaignan/vim-minimap'
"Plug 'vim-scripts/YankRing.vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'terryma/vim-multiple-cursors'
Plug 'kshenoy/vim-signature'
Plug 'mbbill/undotree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mileszs/ack.vim'
"packer -S the_silver_searcher for ag plugin
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'
Plug 'majutsushi/tagbar'
Plug 'milkypostman/vim-togglelist'
Plug 'cespare/vim-toml'
Plug 'airblade/vim-rooter'
Plug 'haya14busa/incsearch.vim'
"Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'djoshea/vim-autoread'

if has("nvim")
    Plug 'critiqjo/lldb.nvim'
endif
"only if tmuxline colorscheme doesn't match vim enable the following
"and see .tmux.conf for more info on how to make them look similar again
"colors
"Bundle 'edkolev/tmuxline.vim'

" ============ vim -plug ===========
" Add plugins to &runtimepath
call plug#end()
" ============ /vim -plug ===========
" ============ vundle ===========
" All of your Plugins must be added before the following line
"call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" ============ /vundle ===========

"this makes vim-airline allways visible. very usefull
set laststatus=2
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
"this forces us to remap numbertoogletrigger though
let g:NumberToggleTrigger = '<m-n>'
"
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>""

let g:airline#extensions#tabline#enabled = 1

"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

colorscheme badwolf

set number
set relativenumber

"let g:ycm_rust_src_path = '/usr/src/rust/src'
let g:ycm_rust_src_path = $RUST_SRC_PATH
"inoremap <Up> 		<NOP>
"inoremap <Down>	<NOP>
"inoremap <Left>	<NOP>
"inoremap <Right> 	<NOP>
"vnoremap <Up> 		<NOP>
"vnoremap <Down> 	<NOP>
"vnoremap <Left> 	<NOP>
"vnoremap <Right> 	<NOP>
"nnoremap <Up> 		<NOP>
"nnoremap <Down> 	<NOP>
"nnoremap <Left> 	<NOP>
"nnoremap <Right> 	<NOP>
"inoremap <C-Up> 	<NOP>
"inoremap <C-Down>	<NOP>
"inoremap <C-Left>	<NOP>
"inoremap <C-Right> <NOP>
"vnoremap <C-Up> 	<NOP>
"vnoremap <C-Down>  <NOP>
"vnoremap <C-Left>  <NOP>
"vnoremap <C-Right> <NOP>
"nnoremap <C-Up> 	<NOP>
"nnoremap <C-Down>  <NOP>
"nnoremap <C-Left>  <NOP>
"nnoremap <C-Right> <NOP>

nnoremap    <F4>    :UndotreeToggle<cr>

" check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
"set autoread
"au CursorHold * checktime
"let autoreadargs={'autoread':1} 
"execute WatchForChanges("*",autoreadargs) 


"nerd tree on open.. nope sucks
"autocmd VimEnter * NERDTree
"autocmd BufEnter * NERDTreeMirror
"CTRL-t to toggle tree view with CTRL-t
nmap <silent> <F3> :NERDTreeToggle<CR>
""Set F2 to put the cursor to the nerdtree
nmap <silent> g<F3> :NERDTreeFind<CR>

set hidden

set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

set autoindent
"set noexpandtab
set expandtab
set tabstop=4
set shiftwidth=4

"enable mouse support
set mouse=a

"sticking with syntastic instead of neomake works better
""autocmd! BufWritePost * Neomake
let g:airline#extensions#syntastic#enabled = 1

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"unicode symbols

"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_symbols.linenr = '␊'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
"let g:airline_symbols.space = "\ua0"
"airline symbols
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.readonly = ''

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_min_num_of_chars_for_completion = 1

"fix vim colors for tmux as shown here: http://superuser.com/a/562423
""-----
"set -g default-terminal "screen-256color" >> .tmux.conf
"export TERM=xterm-256color >> .zshrc

"neovim complaints about this option
if !has("nvim")
    set term=xterm-256color
endif

set t_ut=

""-----

"incremeantal search and smart case search.. its so much better
set incsearch
set ignorecase
set smartcase

"go up/down 3 lines instead of 1 when scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

set swapfile
set dir=~/tmp

"from https://github.com/SirVer/ultisnips/issues/376
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsExpandTrigger="<nop>"
let g:ulti_expand_or_jump_res = 0
function! <SID>ExpandSnippetOrReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<C-Y>"
    endif
endfunction
imap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "<Plug>delimitMateCR"

set textwidth=100

"Make the 100th column stand out
"100v < 100th VISUAL line in editor
highlight ColorColumn ctermbg=magenta
call matchadd('colorcolumn', '\%101v', 101)

set hlsearch
" Press g,F8 to toggle highlighting on/off, and show current value.
noremap <silent> g<F8> :set hlsearch! hlsearch?<CR>:echo<CR>
"hit f8 to hide current search till next time
"disabled in favour of ctrl-l
nnoremap <silent> <F8> :nohlsearch<CR>:echo<CR>
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
" 90% sure this is broken in neovim, try either mapping using leader or g key
"nnoremap <silent> <m-F12> :BufExplorer<CR>
"nnoremap <silent> <F12> :bn<CR>
"nnoremap <silent> <s-F12> :bp<CR>
"actually i want debugging on f9-f12 later
nnoremap <silent> gt :bn<CR>
nnoremap <silent> gT :bp<CR>
nnoremap <silent> <m-g><m-t> :BufExplorer<CR>
nnoremap <silent> g<m-t> :BufExplorer<CR>
nnoremap <silent> <m-g>t :BufExplorer<CR>
nnoremap <silent> <c-g>t :tabnext<CR>
nnoremap <silent> <c-g>T :tabprevious<CR>
nnoremap <silent> <c-g>0 :b 0<CR>
nnoremap <silent> <c-g>1 :b 1<CR>
nnoremap <silent> <c-g>2 :b 2<CR>
nnoremap <silent> <c-g>3 :b 3<CR>
nnoremap <silent> <c-g>4 :b 4<CR>
nnoremap <silent> <c-g>5 :b 5<CR>
nnoremap <silent> <c-g>6 :b 6<CR>
nnoremap <silent> <c-g>7 :b 7<CR>
nnoremap <silent> <c-g>8 :b 8<CR>
nnoremap <silent> <c-g>9 :b 9<CR>

"http://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
"ALSO SET THIS IN TMUX: set -sg escape-time 0
"neovim complaints about this option
if !has("nvim")
    let c='a'
    while c <= 'z'
        exec "set <A-".c.">=\e".c
        exec "imap \e".c." <A-".c.">"
        let c = nr2char(1+char2nr(c))
    endw
endif
set ttimeout ttimeoutlen=1

"let g:wordmotion_prefix = '<F8>'
"these go to words in CamelCase and snake_case words. awesome :)
let g:wordmotion_mappings = {
            \ 'w' : '<M-w>',
            \ 'b' : '<M-b>',
            \ 'e' : '<M-e>',
            \ 'ge' : 'g<M-e>',
            \ 'aw' : 'a<M-w>',
            \ 'iw' : 'i<M-w>'
            \ }


":h yankring-tutorial
"yeah noh. remapping the clippboard doesn't work universially so fuck it
"vnoremap <M-y> "*y
"vnoremap <M-p> "*p
"nnoremap <M-p> "*p
"inoremap <M-p> "*p
"gnome tmux remap
"vnoremap ^[y +y
"vnoremap ^[p +p
"nnoremap ^[p +p
"inoremap ^[p +p


autocmd BufRead,BufNewFile *.conf setf dosini

"fix vim minimap issues in minimap.py change
"vim.command("match " + highlight_group + " /\%>0v\%<{}v\%>{}l\%<{}l./".for mat(WIDTH + 1, top, bottom))
"to:
"vim.command("match " + highlight_group + " /%>0v%<{0}v%>{1}l%<{2}l./".for mat(WIDTH + 1, top, bottom))

"minimap.. broken and not needed
"let g:minimap_show='<leader>mm'
"let g:minimap_update='<leader>mc'
"let g:minimap_close='<leader>mc'
"let g:minimap_toggle='<leader>mt'
"let g:minimap_highlight='Statement'

"https://github.com/svermeulen/vim-easyclip#black-hole-redirection
"easyclip uses m for 'move' so we need to redirect set mark to gm.. or see my
"solution below
"nnoremap gm m
"use ctrl-d/f for paste back/for
let g:EasyClipUsePasteToggleDefaults = 0
nmap <c-p> <plug>EasyClipSwapPasteForward
"cant mal c-s .. this is scroll lock aka terminal stop.. use c-q to quit it
nmap <c-o> <plug>EasyClipSwapPasteBackwards
"make easyclip outformat its pastes.. very usefull for rust?
let g:EasyClipAutoFormat = 1

"easyclip: reenable some default vim bindings. i like my vim cuting, only paste can go into
"black hole, thanks
let g:EasyClipUseCutDefaults = 0
"Delete single Character
nmap x x
xmap x x
"Delete the line
nmap d d
xmap d d
nmap dd dd
"Delete from cursor to the end of the line and do not change clipboard
nmap D D
"Delete the contents of line except the newline character (that is, make it blank) and do not change clipboard
nmap dD dD
"normalizing these SUCKSA
"nmap C C
"these do not work because we have ConqueGDB print variable here!
"<leader>p - Same as p except does not auto-format text. This is only relevant if the auto-format option is enabled
"<leader>P - Same as P except does not auto-format text. This is only relevant if the auto-format option is enabled"
"but these do:
"g<leader>P - Same as <leader>P but preserves the current cursor position
"g<leader>p - Same as <leader>p but preserves the current cursor position

"easyclip: also use ctrl-m for cuting. doesn't bite, works!
nmap <c-m> <Plug>MoveMotionPlug
xmap <c-m> <Plug>MoveMotionXPlug
nmap <c-m><c-m> <Plug>MoveMotionLinePlug

"set clipbard to system clipboard.. its just easier https://github.com/svermeulen/vim-easyclip
"requires the 'xclip' package on arch otherwise easyclip complaints on start
set clipboard=unnamedplus
"https://github.com/neovim/neovim/issues/2642
"this prevents the STRING STRING clipboard error
let g:yankring_clipboard_monitor=0

"share yanks between vim instances
"let g:EasyClipShareYanks = 1
"let g:EasyClipShareYanksFile = ".easyclip"
"let g:EasyClipShareYanksDirectory = "$HOME/tmp"
"originally i disabled the blackhole redirect. but now i just remap the keys
"this only redirects paste-over now
let g:EasyClipEnableBlackHoleRedirect = 1

"easyclip ring.. just type :Yanks, its better because this breaks a lot
"imap    gcr  <Plug>(EasyClipRing)
"imap    <C-l>   <Plug>(EasyClipRing)
"n
"
"the hardocre plugins:
"http://vimawesome.com/plugin/vim-multiple-cursors
"press ctrl-n (after initial ctrl-n, ctrl-x to skip, ctrl-p for previous) on anything, it gets highlighted/searched and
"you puke rainbows when you go in visual/insert mode lol :)
"
"fuzzy finder:
"http://vimawesome.com/plugin/unite-vim
":Unite
"
"http://vimawesome.com/plugin/tabular
"in visual mode! :Tab /zeichen nach dem am tab ausgerichtet werden soll -> magic
"
"http://vimawesome.com/plugin/easymotion
"<Leader><Leader>w
"
"http://vimawesome.com/plugin/surround-vim
"s = sorround key motion.. so ysiw = yank sorround in word ] = [word]
"cs -> magic, eg 'Hello world!' -> cs'<q> -> <q>Hello world!</q>
"-> To go full circle, press cst" to get -> "Hello world!"
"
"http://vimawesome.com/plugin/vim-signature
"vim mark sign jumping and viewing on the left
"
" mx           Toggle mark 'x' and display it in the leftmost column
" dmx          Remove mark 'x' where x is a-zA-Z

" m,           Place the next available mark
" m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
" m-           Delete all marks from the current line
" m<Space>     Delete all marks from the current buffer
" ]`           Jump to next mark
" [`           Jump to prev mark
" ]'           Jump to start of next line containing a mark
" ['           Jump to start of prev line containing a mark
" `]           Jump by alphabetical order to next mark
" `[           Jump by alphabetical order to prev mark
" ']           Jump by alphabetical order to start of next line having a mark
" '[           Jump by alphabetical order to start of prev line having a mark
" m/           Open location list and display marks from current buffer

" m[0-9]       Toggle the corresponding marker !@#$%^&*()
" m<S-[0-9]>   Remove all markers of the same type
" ]-           Jump to next line having a marker of the same type
" [-           Jump to prev line having a marker of the same type
" ]=           Jump to next line having a marker of any type
" [=           Jump to prev line having a marker of any type

"set vim as mergetool!
"git config --global mergetool.fugitive.cmd 'vim -f -c "Gdiff" "$MERGED"'
"git config --global merge.tool fugitive

"new cifforig command to diff current buffer to last safe! this is usefull for diffing .vimrc
"changes etc.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
            \ | wincmd p | diffthis | %foldopen!
nmap <silent> <F7> :DiffOrig<CR>:echo<CR>
"save with shift-f7
nmap <silent> g<F7> :w<CR>

"tabgar.. displays information to classes etc https://github.com/majutsushi/tagbar
nmap <silent> <F6> :TagbarToggle<CR>:echo<CR>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

"save save save. its bad if this fails
command W :w
command Wa :wa
command WA :wa
command Q :q

""" Conserve sanity -> this makes it impossible to press W/Q in commandline so no thank yooooouuu
"cmap W w
"cmap Q q
" Reselect visual block after in/dedent so we can in/dedent more
vnoremap < <gv
vnoremap > >gv
"bw: go s->type->and its placed everywhere though like with I

"" Disable Help key -> Set it to ESC
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

""" Filetypes
filetype on
au BufNewFile,BufRead *.asm set filetype=asmone
au BufNewFile,BufRead *.s set filetype=asmone
au BufNewFile,BufRead *.vcl set filetype=vcl
au BufRead,BufNewFile *.kt  set filetype=kotlin
au BufRead,BufNewFile *.jet set filetype=kotlin
au BufRead,BufNewFile *.sls set filetype=yaml
au BufRead,BufNewFile *.rs set filetype=rust
au BufRead,BufNewFile *.toml set filetype=toml
au BufRead,BufNewFile *.html set filetype=html
au BufRead,BufNewFile *.js set filetype=javascript
au BufRead,BufNewFile *.md set filetype=mkd

"Set the command window height to 2 lines, to avoid many cases of having to
"press <Enter> to continue" - this may work but i just cant get used to it.. fuck it
"pressing enter is better then losing a line of my window
"set cmdheight=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use <F11> to toggle between 'paste' and 'nopaste' -intendation
set pastetoggle=<F9>

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
"set showcmd

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

"http://stackoverflow.com/questions/7797068/copying-a-word-and-pasting-over-a-word#7797434
"paste over a word without loosing the buffer!!!
"xnoremap p pgvy <- deactivated using easyclip and remapping x & d back to usual works better

"ctrlp remaped to alt
let g:ctrlp_map = '<m-p>'

"ag / gag commands:
"e    to open file and close the quickfix window
"o    to open (same as enter)
"go   to preview file (open but maintain focus on ag.vim results)
"t    to open in new tab
"T    to open in new tab silently
"h    to open in horizontal split
"H    to open in horizontal split silently
"v    to open in vertical split
"gv   to open in vertical split silently
"q    to close the quickfix window
"Normal Mode
"gagiw to search the word
"gagi' to search the words inside single quotes.
"Visual Mode
"gag to search the selected text
"

"alt-y -> yank all lines in file
nmap <m-y> :%y+<CR>


if has("faslefalsefalsefalse")
    "lldb has a bug with rust, its cool but for now i have to switch to conquegdb
    "https://github.com/rust-lang/rust/issues/33062
    if has("nvim")
        "i want f8 - f12 to be my debugging keys. cant live without them
        "F11 is fullscreen though
        "lldb neovim debugger - main reason for neovim
        "go g->F1 to create a profile, then just y. if you did n then:
        ":CargoBuild
        ":LL run
        "return to normal with F2

        "there also is conque gdb that is the same thing just with gdb
        "here is a complete keymap for both: http://lldb.llvm.org/lldb-gdb.html
        "
        nmap <M-b> <Plug>LLBreakSwitch
        nmap <F9> <Plug>LLBreakSwitch
        vmap <F12> <Plug>LLStdInSelected
        nnoremap <F12> :LLstdin<CR>
        "Do a source level single step(in) in the currently selected thread.
        nnoremap g<F10> :LL step<CR>
        "Do a source level single step over in the currently selected thread.
        nnoremap <F10> :LL next<CR>
        nnoremap g<F1> :LLsession new<CR>
        nnoremap <F1> :LLmode debug<CR>
        nnoremap <F2> :LLmode code<CR>
        nnoremap <F5> :LL continue<CR>
        nnoremap g<F10> :LL process interrupt<CR>
        nnoremap gp :LL print <C-R>=expand('<cword>')<CR>
        vnoremap g<F12> :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>
    endif
else
    "Conque terminal -> Conque gdb
    "find help for it here
    ":help conque-gdb

    "If the |ConqueGdb| commands can't find GDB in the system path, then you might
    "need to specify the path to the GDB executable manually. However on Windows
    "Conque will also look for GDB in C:\MinGW\bin. To define the path to the GDB
    "executable you can change the value of |g:ConqueGdb_GdbExe|. By default this
    "option is:
    "let g:ConqueGdb_GdbExe = ''

    "When Conque GDB splits the GDB CLI window to open source files it will by
    "defaut split the window such that the source code will appear above the GDB
    "CLI window. You can change the value of |g:ConqueGdb_SrcSplit| to 'above',
    "'below', 'left' or 'right' if you want Conque GDB to split the GDB window
    "such that the source code will spilt above, below, left or right to the
    "GDB CLI window.
    "let g:ConqueGdb_SrcSplit = 'above'

    "up-down to scroll through history -> this means that commands issued via shortcuts. all inserted command in the conque terminal window should still work
    let g:ConqueGdb_SaveHistory = 0
    "This option specifies which keyboard key is used as prefix for the Conque GDBkeyboard mappings described below. By default it is:
    "let g:ConqueGdb_Leader = '<Leader>'
    "let g:ConqueGdb_Leader = '<F2>'
    "This option defines the keyboard mapping used to issue the GDB command run from any buffer. By default this is:
    "let g:ConqueGdb_Run = g:ConqueGdb_Leader . 'r' /run and re-run
    let g:ConqueGdb_Run = 'g'.'<F5>'
    "This option defines the mapping used to issue the continue command. This is by default:
    "let g:ConqueGdb_Continue = g:ConqueGdb_Leader . 'c'
    let g:ConqueGdb_Continue = '<F5>'
    "This mapping is used to issue the print GDB command, to print value of the
    "identifier under the cursor. By default it is:
    "let g:ConqueGdb_Print = g:ConqueGdb_Leader . 'p'
    let g:ConqueGdb_Print = '<F2>'
    "Mapping to issue the finish command. Default:
    "let g:ConqueGdb_Finish = g:ConqueGdb_Leader . 'f' /step out (of current function)
    let g:ConqueGdb_Finish = 'g'.'<F11>'
    "Mapping to issue GDB command next. Default: /step over
    "let g:ConqueGdb_Next = g:ConqueGdb_Leader . 'n'
    let g:ConqueGdb_Next = '<F10>'
    "Mapping to send the step command to GDB. Default: /step in
    "let g:ConqueGdb_Step = g:ConqueGdb_Leader . 's'
    let g:ConqueGdb_Step = '<F11>'
    "Mapping to execute the backtrace command. By default it is:
    "let g:ConqueGdb_Backtrace = g:ConqueGdb_Leader . 't'
    let g:ConqueGdb_Backtrace = 'g'.'<F10>'
    "This mapping is only supported on Unix having GDB 7.0+ with full python
    "support. See |conque-gdb-unix-requirements|. By default this mapping is:
    "let g:ConqueGdb_ToggleBreak = g:ConqueGdb_Leader . 'b'
    let g:ConqueGdb_ToggleBreak = '<F9>'
    "You might want to be able answer GDB confirmations (say y or n) without
    "having to go to the Conque GDB window. You can use the |ConqueGdbCommand|
    "command to achieve this:
    "this is also the way to do custom mappings:
    "nnoremap <silent> <F12>y :ConqueGdbCommand y<CR>
    "nnoremap <silent> <F12>n :ConqueGdbCommand n<CR>
    "ok new plan lets just type :ConqueGdbCommand when pressing F12 so we need only issue our
    "command and enter
    ":help key-notation
    "start: (append name of the executable by hand!)
    nnoremap g<F1> :ConqueGdb target/debug/
    "end:
    nnoremap <Leader><F1> :ConqueGdbCommand quit
    "issue any command .. tui enable and the threaviews do NOT work in conque.. debug the assembly standalone if needed(ctrl-x crl-a, ctrl-x ctrl-1/2/3..)
    "helpfull 'break foo' -> break on function foo();   break main.rs:6 -> break on line 6 in main.rs . ':Man gdb' or google are your firend!
    nnoremap <F12> :ConqueGdbCommand<Space>
endif

"rust ctags
let g:tagbar_type_rust = {
            \ 'ctagstype' : 'rust',
            \ 'kinds' : [
            \'T:types,type definitions',
            \'f:functions,function definitions',
            \'g:enum,enumeration names',
            \'s:structure names',
            \'m:modules,module names',
            \'c:consts,static constants',
            \'t:traits,traits',
            \'i:impls,trait implementations',
            \]
            \}

"no folding! https://stackoverflow.com/questions/5017009/confusion-about-vim-folding-how-to-disable#5017035
let g:vim_markdown_folding_disabled=1
set nofoldenable    " disable folding
set diffopt+=context:99999

"SHITY SOLUTION:
"capslock sanity that map capslock to escape while vim is open:
"https://stackoverflow.com/questions/2176532/how-to-map-caps-lock-key-in-vim
"au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
"This requires Linux with the xorg-xmodmap package installed.
"BETTER: JUST SET IN CINNAMON AT KEYBOARD THE CAPS LOCK KEY BEHAVIOUR TO ALSO BE AN ESCAPE KEY
"        .. since nobody uses it and to avoid situations like above

"insert mode mappings.. these are considered ineffective but are really helpfull sometimes when
"copying and pasting stuff.
imap <M-h> 		<Left>
imap <M-l> 		<Right>
imap <M-k> 		<Up>
imap <M-j> 		<Down>
imap <M-S-h> 	<S-Left>
imap <M-S-l> 	<S-Right>
"shitty map that goes one screen up and down regularly.. nope. lets just go up and down the
"completion
imap <M-S-k> 	<C-p>
imap <M-S-j> 	<C-n>
"this remap is only meant to be used for c-n, but can also be done with shift-alt-h/l this
"triggers autocompletion on existing wordmotions
imap <c-k> 		<C-p>
imap <c-j> 		<C-n>
imap <c-l> 		<C-n>

"easier smart case easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout

"incsearch!
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"auto nohlseatch - do anything but searchling and it goes away 
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"easymotion search.. press enter after search to jump to result - meh to much truble
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)

"incsearch easymotion mappings
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

