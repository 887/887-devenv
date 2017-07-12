"This .vimrc is  nevoim compatible and can be used in both
"neovim needs python*-support (installed seperatley) -> :help nvim-python
"on arch its in the community repo ->
"sudo pacman community/python-nvim
"sudo pacman community/python2-nvim

"ctags setup for any language:
"put section from this Wiki in your ~/ctags file
"https://github.com/majutsushi/tagbar/wiki#rust

"Plugins:
set shell=bash
if !has("nvim")
    set nocompatible              " be iMproved, required
endif
filetype off                  " required

":PlugUpdate -> update and install plugins!
":PlugUpgrade -> upgrade 'junegunn/vim-plug' itself
":UpdateRemotePlugins -> for python 2/3 plugins like lldb!
" ============ vim-plug ===========
call plug#begin('~/.vim/plugged')
" ============ /vim-plug ===========

Plug 'scrooloose/syntastic' ", { 'tag': '3.6.0' }
"no need, neonvim has :man command build in, its enough
"Plug 'powerman/vim-plugin-viewdoc'
"Plug 'rust-lang/rust.vim', { 'commit': '2946a05c94c8ab8e047abdce3c775c48d734ee17' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
"function! DoRemote(arg)
    "only when really needed:
    "UpdateRemotePlugins
"endfunction
if has("nvim")
    Plug 'Shougo/deoplete.nvim' ", { 'do': function('DoRemote') }
    "deoplete has this new preview window feture.. i don't like it!
    "disable preview completly
    set completeopt-=preview
    "just close preview after completion
    "autocmd CompleteDone * pclose!

    "RLS destoys everything at the moment due to overriding the racer completion options
    "Plug 'autozimu/LanguageClient-neovim', { 'for': 'rust' } ", 'do': function('DoRemote')}

    "for rls support:
    "rustup default nightly
    "rustup update nightly
    "rustup component add rls
    "rustup component add rust-analysis
    "rustup component add rust-src
    let g:LanguageClient_serverCommands = {
                \ 'rust': [$HOME . '/.cargo/bin/rls'],
                \ }
    " Automatically start language servers.
    let g:LanguageClient_autoStart = 1
else
    Plug 'Shougo/neocomplete.vim'
endif

"vim-ctrlspace is a big addon that allows perfect buffer/tab management and is the basis for a
"perfect running vim-airline pluing. In short: you can't live without it!!
Plug 'vim-ctrlspace/vim-ctrlspace'

"this shows the function parameters in the statusline!
Plug 'Shougo/echodoc.vim'
autocmd VimEnter * call echodoc#enable() "has to be enabled on vim enter

Plug 'qpkorr/vim-bufkill'
"complete from tmux panes
Plug 'wellle/tmux-complete.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'wellle/targets.vim'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'christoomey/vim-sort-motion'
"Plug 'michaeljsmith/vim-indent-object'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'sjl/badwolf'
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'shougo/unite.vim'
Plug 'dan-t/rusty-tags', { 'for': 'rust' }
"Plug 'Raimondi/delimitMate'
Plug 'timonv/vim-cargo', { 'for': 'rust' }
Plug '887/cargo.vim', { 'for': 'rust' }
Plug 'scrooloose/nerdcommenter'
Plug 'jlanzarotta/bufexplorer'
Plug 'chaoren/vim-wordmotion'
"Plug 'vim-scripts/EasyClipRing.vim'
"Plug 'severin-lemaignan/vim-minimap'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
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
"Plug 'rking/ag.vim'
Plug 'mhinz/vim-grepper'
Plug 'Chun-Yang/vim-action-ag'
Plug 'majutsushi/tagbar'
Plug 'milkypostman/vim-togglelist'
Plug 'cespare/vim-toml'
Plug 'airblade/vim-rooter'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'djoshea/vim-autoread'
"see description in .tmux.conf for colors before starting Vim
Plug 'edkolev/tmuxline.vim'
"lldb disabled for now, gdb works better
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-obsession'

if executable("lldb") && has("nvim")
    Plug 'critiqjo/lldb.nvim'
else
    Plug 'vim-scripts/Conque-GDB'
endif

" ============ vim -plug ===========
" Add plugins to &runtimepath
call plug#end()
" ============ /vim -plug ===========

filetype plugin on
filetype plugin indent on    " required

"PluginSettings:
"experimental rust racer features:
let g:racer_insert_paren = 1
let g:racer_experimental_completer = 1
let g:rustfmt_fail_silently=1
"let g:rustfmt_autosave = 1
"let g:ycm_rust_src_path = '/usr/src/rust/src'
"vim has build in formating on the '=' key
let g:ycm_rust_src_path = $RUST_SRC_PATH
"tabar setup for rust:
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
"ctrlp remapped to alt
let g:ctrlp_map = '<m-p>'
"auto remove trailing spaces on save.. oh the lifetime i have spend
"https://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim#356130
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
"only root manually
let g:rooter_manual_only = 1
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'
" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

"Syntax Highlighting:
syntax enable
colorscheme badwolf
"omni completion disabled (slows down vim), neocomplete/deoplete with ctags work better anyway
"http://vim.wikia.com/wiki/Omni_completion
"set omnifunc=syntaxcomplete#Complete
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
"enable mouse support
set mouse=a
"line numbers!
set number
set relativenumber
"do not display annoying "save file" before opening a new one (even though its in a new buffer)
"(its because vim might crash when loading the new file)
set hidden
"display special chars for spaces and tabs to visualize them better
set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
"let vim do the indenting most of the time
set autoindent
"load filetype-specific indent files
filetype indent on
"tabs to spaces
set expandtab
set tabstop=4
set shiftwidth=4
"incremeantal search and smart case search.. It's so much better
set incsearch
set ignorecase
set smartcase

" check file change every 4(=checktime) seconds ('CursorHold') and reload the buffer upon detecting change
set autoread
au CursorHold * checktime

set dir=~/tmp
"having no swapfile means vim uses more memory because everything lands in memmory -> no problem
"90% of the time i use vim to develop software and safe like every 30 seconds, same with configfiles
"swapfiles are usefull under certain conditions.. But i can live without them so:
set noswapfile
au FileType rust,rs set textwidth=99
"Make the 100th column stand out (100v = 100th column)
highlight ColorColumn ctermbg=blue
au FileType rust,rs call matchadd('colorcolumn', '\%100v', 100)
set hlsearch
"set clipboard to system clipboard: https://github.com/svermeulen/vim-easyclip
"requires the 'xclip' package, otherwise easyclip complaints on start
set clipboard=unnamedplus
" ask instead of failing to save files:
set confirm
" Better command-line completion (visual autocomplete for command menu)
set wildmenu
"
"dont show mode information in the last line(its in vim-airline anyway)
set noshowmode
"redraw only when we need to
"set lazyredraw
" highlight matching [{()}]
"set showmatch

"Show partial commands in the last line of the screen (right side, annoying, off)
"set showcmd
"no timeouts for special characters: (certain combos insert unexpected chars otherwise)
set ttimeout ttimeoutlen=1
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
"Vim build in spell checking
set spell
set spelllang=en_us
"hi SpellBad guibg=#ff2929 ctermbg=224
"hi SpellBad guibg=#0000ff ctermbg=blue
hi SpellBad	cterm=underline gui=underline guibg=NONE ctermbg=NONE
hi SpellCap	cterm=underline gui=underline guibg=NONE ctermbg=NONE
hi SpellRare cterm=underline gui=underline guibg=NONE ctermbg=NONE
hi SpellLocal cterm=underline gui=underline guibg=NONE ctermbg=NONE
"no folding!
"https://stackoverflow.com/questions/5017009/confusion-about-vim-folding-how-to-disable#5017035
let g:vim_markdown_folding_disabled=1
set nofoldenable    " disable folding
set diffopt+=context:99999

"Filetypes:
filetype on
au BufNewFile,BufRead *.asm set filetype=asmone
au BufNewFile,BufRead *.s set filetype=asmone
au BufNewFile,BufRead *.vcl set filetype=vcl
au BufRead,BufNewFile *.kt  set filetype=kotlin
au BufRead,BufNewFile *.jet set filetype=kotlin
au BufRead,BufNewFile *.sls set filetype=yaml
au BufRead,BufNewFile *.rs set filetype=rust
au BufRead,BufNewFile *.rust set filetype=rust
au BufRead,BufNewFile *.toml set filetype=toml
au BufRead,BufNewFile *.html set filetype=html
au BufRead,BufNewFile *.js set filetype=javascript
au BufRead,BufNewFile *.md set filetype=mkd
au BufRead,BufNewFile *.conf setf dosini

" Delimitmate
"au FileType \* let b:delimitMate_autoclose = 0
"au FileType rust,rs let b:delimitMate_autoclose = 0

" If using html auto complete (complete closing tag)
"au FileType xml,html,xhtml let b:delimitMate_matchpairs = "(:),[:],{:}"
"au FileType rust,rs let b:delimitMate_matchpairs = "(:),[:],{:}"
"au FileType rust,rs let b:delimitMate_matchpairs = "[:],{:}"

"this needs to be set as the system/terminal font
"gnome-terminal: edit -> profile preferences -> general -> text appearance -> custom font -> seach
"for this: (but also leave it as a setting here)
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11

"let vim use the correct term colors, nvim inherits this option and complaints when you override it
if !has("nvim")
    set term=xterm-256color
    "this is to suppress the empty space when searching with / . Only works in Vim, not Nvim
    set t_ut=
endif
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

"Function Commands:
"(The rest is for GDB/LLDB further down)
"" Disable Help key -> Set it to ESC
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
"toggle between absolute and relative line numbers
let g:NumberToggleTrigger="g<F2>"
"ALSO: SET KEYBOARD CAPS LOCK KEY BEHAVIOR TO ALSO BE AN ESCAPE KEY IN YOUR OS-WINDOW MANAGER
"nerdtree:
nmap <silent> <F3> :NERDTreeToggle<CR>
nmap <silent> g<F3> :NERDTreeFind<CR>
"undotree:
nnoremap    <F4>    :UndotreeToggle<cr>
"tabgar:
nmap <silent> <F6> :TagbarToggle<CR>:echo<CR>
"new cifforig command to diff current buffer to last safe! this is usefull for diffing .vimrc
"changes etc.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis | %foldopen!
nmap <silent> <F7> :DiffOrig<CR>:echo<CR>
"save with shift-f7
nmap <silent> g<F7> :w<CR>
" Press g,F8 to toggle highlighting on/off, and show current value.
noremap <silent> g<F8> :set hlsearch! hlsearch?<CR>:echo<CR>
"hit f8 to hide current search till next time
"disabled in favour of ctrl-l
nnoremap <silent> <F8> :nohlsearch<CR>:echo<CR>
" Use <F11> to toggle between 'paste' and 'nopaste' -intendation
set pastetoggle=g<F9>

"vim-airline:
":h airline

let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_tabs = 0
"let g:airline#extensions#tabline#tab_min_count = 2
"let g:airline#extensions#tabline#show_buffers = 1
"show buffer number in tabline for easier switching
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
"let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 0
"rename label for buffers (default: 'buffers') (c)
let g:airline#extensions#tabline#buffers_label = 'b'
"rename label for tabs (default: 'tabs') (c)
let g:airline#extensions#tabline#tabs_label = 't'


"this makes vim-airline allways visible. very usefull
set laststatus=2
"sticking with syntastic instead of neomake works better
""autocmd! BufWritePost * Neomake
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#trailing_format = 't[%s]'

"Unicode airline symbols
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
"let g:airline_symbols.space = "\ua0"
"airline symbols
" let g:airline_symbols.readonly = ''

"Commands:
"(add some redundant uppercase commands for people with fat fingers like me)
command E :e
command W :w
command Wa :wa
command WA :wa
command Q :q
command Qa :qa
command QA :qa
command Q1 :q!
command Qa1 :qa!
command QA1 :qa!
map q: :q

"Keybindings:
"Disable ExMode
map Q <nop>
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy:
map Y y$
"alt-y -> yank all lines in file
nmap <m-y> :%y+<CR>
" Reselect visual block after in/dedent so we can in/dedent more
vnoremap < <gv
vnoremap > >gv
"bw: go s->type->and its placed everywhere though like with I
"go up/down 3 lines instead of 1 when scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
"C-L refreshes the screen and turns off search highlighting
nnoremap <C-L> :nohl<CR><C-L>
"make gtgT switch buffers instead of tabs
nnoremap <silent> gt :bn<CR>
nnoremap <silent> gT :bp<CR>
"no we need to rebind the tab buttons -> they are on ctrl-g + t/T http://vim.wikia.com/wiki/Using_tab_pages
"tab next is on: <CG>t
"tab prev is on: <CG>T
"tab new/new tab has no hotkey but has the commmand :tabnew
"
"this uses vim-buffkill to keep windows intact: https://github.com/qpkorr/vim-bufkill
nnoremap gq :BD<CR>
"these all point pressing gt with alt results in the buffexplorer window:
nnoremap <silent> <m-g><m-t> :BufExplorer<CR>
nnoremap <silent> g<m-t> :BufExplorer<CR>
nnoremap <silent> <m-g>t :BufExplorer<CR>
"tabs aren't buffers but we should map these anyway
nnoremap <silent> <c-g>t :tabnext<CR>
nnoremap <silent> <c-g>T :tabprevious<CR>
nnoremap <silent> <c-g>1 :b 1<CR>
nnoremap <silent> <c-g>2 :b 2<CR>
nnoremap <silent> <c-g>3 :b 3<CR>
nnoremap <silent> <c-g>4 :b 4<CR>
nnoremap <silent> <c-g>5 :b 5<CR>
nnoremap <silent> <c-g>6 :b 6<CR>
nnoremap <silent> <c-g>7 :b 7<CR>
nnoremap <silent> <c-g>8 :b 8<CR>
nnoremap <silent> <c-g>9 :b 9<CR>
nnoremap <silent> g1 :b 1<CR>
nnoremap <silent> g2 :b 2<CR>
nnoremap <silent> g3 :b 3<CR>
nnoremap <silent> g4 :b 4<CR>
nnoremap <silent> g5 :b 5<CR>
nnoremap <silent> g6 :b 6<CR>
nnoremap <silent> g7 :b 7<CR>
nnoremap <silent> g8 :b 8<CR>
nnoremap <silent> g9 :b 9<CR>

"Rust Mappings for vim-racer
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

"Rust mappings for rls (rust language server)
if has("nvim")
    au FileType rust nnoremap <silent> gF :call LanguageClient_textDocument_hover()<CR>
    au FileType rust nnoremap <silent> gD :call LanguageClient_textDocument_definition()<CR>
    "note: gR is usally visual replace mode, something i do not use
    au FileType rust nnoremap <silent> gR :call LanguageClient_textDocument_rename()<CR>
endif

"insert mode mappings.. these are considered ineffective but are really helpfull sometimes:
imap <M-h> 		<Left>
imap <M-l> 		<Right>
imap <M-S-h> 	<S-Left>
imap <M-S-l> 	<S-Right>
"this remap is only meant to be used for c-n, but can also be done with shift-alt-h/l this
"triggers auto completion on existing word motions
imap <c-k> 		<C-p>
imap <c-j> 		<C-n>
imap <c-l> 		<C-n>

"Vim Wordmotion:
"these target CamelCase and snake_case words:
let g:wordmotion_mappings = {
            \ 'w' : '<M-w>',
            \ 'b' : '<M-b>',
            \ 'e' : '<M-e>',
            \ 'ge' : 'g<M-e>',
            \ 'aw' : 'a<M-w>',
            \ 'iw' : 'i<M-w>'
            \ }

"Easyclip:
"Type :Yanks to see the last yanks, paste 'em with "1/2/3p
"https://github.com/svermeulen/vim-easyclip#black-hole-redirection
let g:EasyClipUsePasteToggleDefaults = 0
nmap <c-p> <plug>EasyClipSwapPasteForward
"cant mal c-s .. this is scroll lock aka terminal stop.. use c-q to quit it
nmap <c-i> <plug>EasyClipSwapPasteBackwards
"make easyclip auto formats its pastes:
let g:EasyClipAutoFormat = 1
"reenable some default vim bindings. i like my x/d cuting, only v(isual)p(aste) goes into _
let g:EasyClipUseCutDefaults = 0
"this only redirects paste-over if we map the keys back like below
let g:EasyClipEnableBlackHoleRedirect = 1
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
nmap <TAB> <TAB>
"leave this one alone:
"nmap C C
"these do not work because we have ConqueGDB print variable here!
"<leader>p - Same as p except does not auto-format text. This is only relevant if the auto-format option is enabled
"<leader>P - Same as P except does not auto-format text. This is only relevant if the auto-format option is enabled"
"but these do:
"g<leader>P - Same as <leader>P but preserves the current cursor position
"g<leader>p - Same as <leader>p but preserves the current cursor position
"also use ctrl-m for cuting. Doesn't bite, works!
nmap <c-m> <Plug>MoveMotionPlug
xmap <c-m> <Plug>MoveMotionXPlug
nmap <c-m><c-m> <Plug>MoveMotionLinePlug
"share yanks between vim instances - disabled, we use the system clipboard instead
"let g:EasyClipShareYanks = 1
"let g:EasyClipShareYanksFile = ".easyclip"
"let g:EasyClipShareYanksDirectory = "$HOME/tmp"

"Spellchecking:
"]s — move to the next misspelled word
"[s — move to the previous misspelled word
"zg — add a word to the dictionary
"zug — undo the addition of a word to the dictionary
"z= — view spelling suggestions for a misspelled word
"
"Plugin Documentations:
"http://vimawesome.com/plugin/vim-multiple-cursors
"press ctrl-n (after initial ctrl-n, ctrl-x to skip, ctrl-p for previous) on anything, it gets highlighted/searched and
"you puke rainbows when you go in visual/insert mode lol :)
"
"http://vimawesome.com/plugin/tabular
"in visual mode! :Tab /CharForTabAlignment -> magic
"
"http://vimawesome.com/plugin/easymotion
"<Leader><Leader>w/b/e -> magic
"
"https://github.com/tpope/vim-surround
"s = sorround key motion.. so ysiw = yank sorround in word ] = [word]
"or change sorrundings with cs for example:
"-> 'Hello world!' -> cs'<q> -> <q>Hello world!</q>
"-> To go full circle, press cst" to get -> "Hello world!"
"for change in visual mode use captial -> v S" -> "Hello world"
"
"http://vimawesome.com/plugin/vim-signature
"vim mark sign jumping and viewing on the left
"
"https://github.com/kshenoy/vim-signature/issues/106
"hide all markers bug
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

"Ag / g-Ag (the_silver_searcher) Commands:
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

"replace grep with ripgrep in vim!
if executable('rg')
    set grepprg=rg\ --no-heading\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif
"vim-grepper replaces ag for the momment
"https://github.com/mhinz/vim-grepper/wiki/example-configurations-and-mappings
nnoremap <leader>gr :Grepper -tool rg<cr>
nnoremap <leader>rg :Grepper -tool rg<cr>
nnoremap grg :Grepper -tool rg<cr>
let g:grepper = {}
let g:grepper.tools = ['rg']
let g:grepper.next_tool = '<tab>'
let g:grepper.jump = 0
let g:grepper.simple_prompt = 1
let g:grepper.quickfix = 1
let g:grepper.open = 1
let g:grepper.switch = 1
let g:grepper.highlight = 1

"rg (rg = <leader>rg
"note the following has mouse support:
"vimgrep uses the qucikfix window that and thus useses the "help quickfix" commands these are:
"You can use :.cc to jump to the error under the cursor.
":cc[!] [nr] <- must first call CC!!!!!!
":[count]cn[ext][!]
":[count]cN[ext][!]
":[count]cp[revious][!]
"current window:
":ll[!] [nr]
":[count]lne[xt][!]	Same as ":cnext", except the location list for the
":copen open location list
":close close location list

"Location-List navigation is essentially the same but with ll
":ll (re)open location list
":.ll = under cursor
":ln(ext)
":lp(previous)
":ll[!] [number]
":..and it also works with :3ln etc
":lopen open location list
":lclose close location list

"cgdb shortcuts:
"`F5'Send a run command to GDB.
"`F6'Send a continue command to GDB.
"`F7'Send a finish command to GDB.
"`F8'Send a next command to GDB.
"`F10'Send a step command to GDB.
"`spacebar'Sets a breakpoint at the current line number.
"`t'Sets a temporary breakpoint at the current line number.
"`i'Puts the user into "GDB mode".
"`I'Puts the user into "TTY mode".

"this is the lldb/gdb switch, both should roughly have the same keybindings:
if executable("lldb") && has("nvim")
    "lldb has a bug with rust, its cool but for now i have to switch to conquegdb
    "https://github.com/rust-lang/rust/issues/33062

    "i want f8 - f12 to be my debugging keys. Cant live without them
    "F11 is fullscreen though
    "lldb neovim debugger - main reason for neovim
    "go g->F1 to create a profile, then just y. If you did n then:
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
    nnoremap <F11> :LL step<CR>
    "Do a source level single step over in the currently selected thread.
    nnoremap <F10> :LL next<CR>
    nnoremap g<F1> :LLsession new<CR>
    nnoremap <F1> :LLmode debug<CR>
    nnoremap <F2> :LLmode code<CR>
    nnoremap <F5> :LL continue<CR>
    nnoremap g<F10> :LL process interrupt<CR>
    nnoremap gp :LL print <C-R>=expand('<cword>')<CR>
    vnoremap g<F12> :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>
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
    let g:ConqueGdb_GdbExe = $HOME . '/.cargo/bin/rust-gdb'

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
    "issue any command .. tui enable and the threaviews do NOT work in conque.. debug the assembly Standalone if needed(ctrl-x crl-a, ctrl-x ctrl-1/2/3..)
    "helpfull 'break foo' -> break on function foo();   break main.rs:6 -> break on line 6 in main.rs . ':Man gdb' or google are your firend!
    nnoremap <F12> :ConqueGdbCommand<Space>
endif

"Easymotion:
"easier smart case easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout
"Incsearch:
nmap /  <Plug>(incsearch-forward)
nmap ?  <Plug>(incsearch-backward)
nmap g/ <Plug>(incsearch-stay)
"auto nohlseatch - do anything but searching and it goes away
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
"incsearch easymotion mappings
map <M-/> <Plug>(incsearch-easymotion-/)
map <M-?> <Plug>(incsearch-easymotion-?)
map g<M-/> <Plug>(incsearch-easymotion-stay)

"vim autocomplete:
"This is an option from an other plugin that does nothing if you don't have it http://www.vim.org/scripts/script.php?script_id=1879
"let g:acp_enableAtStartup = 0
if has("nvim")
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_smart_case = 1
    let g:deoplete#sources#syntax#min_keyword_length = 1
    "You probably need to increase the size limit on deoplete#tag#cache_limit_size. The default is 500000 which is ~500KiB. Add another zero to it to make it ~5MiB:
    "default:                           500000
    "my rusty-tags.vi size was          1459153
    let deoplete#tag#cache_limit_size = 50000000
else
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 1
    "You probably need to increase the size limit on deoplete#tag#cache_limit_size. The default is 500000 which is ~500KiB. Add another zero to it to make it ~5MiB:
    "default:                              500000
    "my rusty-tags.vi size was             1459153
    let neocomplete#tag#cache_limit_size = 5000000
endif

"Rust Tags + compile + Syntax checker options
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWrite *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&"
autocmd BufRead,BufNewFile *.rs,*.rust compiler cargo
"https://github.com/rust-lang/rust.vim/issues/118
"autocmd FileType rust let g:syntastic_rust_checkers = ['rustc']
autocmd FileType rust let g:syntastic_rust_checkers = ['cargo']


"NeoSnippet:
"SuperTab like snippets behavior.
imap <expr><TAB>
            \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" :
            \ pumvisible() ? "\<Space>" :
            \ "\<TAB>"

"don't leave line just go next and prev here
imap <expr><M-k>
            \ pumvisible() ? "\<C-p>" :
            \ ""
imap <expr><M-j>
            \ pumvisible() ? "\<C-n>" :
            \ ""

"Default shortcuts i allways forget:
"vim increment:
"C-a
"vim decrement:
"C-x
":Errors -> show location list with for errors/warnings.
"Doubleclick on entry with the mouse to access it
"To access with keyboard first use :ll to activate it then you can use:
":.ll to go to the location under cursor
":ln(ext) or lp(previous) etc, see cc list explanation up above
"ERROS USES THE LOCATION LIST, RIPGREP USES THE CC ((C/Q)UICK CORRECTION)
