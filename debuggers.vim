" "this is the lldb/gdb switch, both should roughly have the same keybindings:
" if executable("lldb") && has("nvim")
"     "lldb has a bug with rust, its cool but for now i have to switch to conquegdb
"     "https://github.com/rust-lang/rust/issues/33062
"
"     "i want f8 - f12 to be my debugging keys. Cant live without them
"     "F11 is fullscreen though
"     "lldb neovim debugger - main reason for neovim
"     "go g->F1 to create a profile, then just y. If you did n then:
"     ":CargoBuild
"     ":LL run
"     "return to normal with F2
"
"     "there also is conque gdb that is the same thing just with gdb
"     "here is a complete keymap for both: http://lldb.llvm.org/lldb-gdb.html
"     "
"     nmap <M-b> <Plug>LLBreakSwitch
"     nmap <F9> <Plug>LLBreakSwitch
"     vmap <F12> <Plug>LLStdInSelected
"     nnoremap <F12> :LLstdin<CR>
"     "Do a source level single step(in) in the currently selected thread.
"     nnoremap <F11> :LL step<CR>
"     "Do a source level single step over in the currently selected thread.
"     nnoremap <F10> :LL next<CR>
"     nnoremap <F1> :LLsession new<CR>
"     nnoremap <F7> :LLmode debug<CR>
"     nnoremap g<F7> :LLmode code<CR>
"     nnoremap <F5> :LL continue<CR>
"     nnoremap g<F10> :LL process interrupt<CR>
"     nnoremap <F8> :LL print <C-R>=expand('<cword>')<CR>
"     vnoremap g<F12> :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>
" else
"     "Conque terminal -> Conque gdb
"     "find help for it here
"     ":help conque-gdb
"
"     "If the |ConqueGdb| commands can't find GDB in the system path, then you might
"     "need to specify the path to the GDB executable manually. However on Windows
"     "Conque will also look for GDB in C:\MinGW\bin. To define the path to the GDB
"     "executable you can change the value of |g:ConqueGdb_GdbExe|. By default this
"     "option is:
"     "let g:ConqueGdb_GdbExe = ''
"     "let g:ConqueGdb_GdbExe = $HOME . '/.cargo/bin/rust-gdb'
"
"     "When Conque GDB splits the GDB CLI window to open source files it will by
"     "defaut split the window such that the source code will appear above the GDB
"     "CLI window. You can change the value of |g:ConqueGdb_SrcSplit| to 'above',
"     "'below', 'left' or 'right' if you want Conque GDB to split the GDB window
"     "such that the source code will spilt above, below, left or right to the
"     "GDB CLI window.
"     "let g:ConqueGdb_SrcSplit = 'above'
"
"     "up-down to scroll through history -> this means that commands issued via shortcuts. all inserted command in the conque terminal window should still work
"     let g:ConqueGdb_SaveHistory = 0
"     "This option specifies which keyboard key is used as prefix for the Conque GDBkeyboard mappings described below. By default it is:
"     "let g:ConqueGdb_Leader = '<Leader>'
"     "let g:ConqueGdb_Leader = '<F2>'
"     "This option defines the keyboard mapping used to issue the GDB command run from any buffer. By default this is:
"     "let g:ConqueGdb_Run = g:ConqueGdb_Leader . 'r' /run and re-run
"     let g:ConqueGdb_Run = 'g'.'<F5>'
"     "This option defines the mapping used to issue the continue command. This is by default:
"     "let g:ConqueGdb_Continue = g:ConqueGdb_Leader . 'c'
"     let g:ConqueGdb_Continue = '<F5>'
"     "This mapping is used to issue the print GDB command, to print value of the
"     "identifier under the cursor. By default it is:
"     "let g:ConqueGdb_Print = g:ConqueGdb_Leader . 'p'
"     let g:ConqueGdb_Print = '<F8>'
"     "Mapping to issue the finish command. Default:
"     "let g:ConqueGdb_Finish = g:ConqueGdb_Leader . 'f' /step out (of current function)
"     let g:ConqueGdb_Finish = 'g'.'<F11>'
"     "Mapping to issue GDB command next. Default: /step over
"     "let g:ConqueGdb_Next = g:ConqueGdb_Leader . 'n'
"     let g:ConqueGdb_Next = '<F10>'
"     "Mapping to send the step command to GDB. Default: /step in
"     "let g:ConqueGdb_Step = g:ConqueGdb_Leader . 's'
"     let g:ConqueGdb_Step = '<F11>'
"     "Mapping to execute the backtrace command. By default it is:
"     "let g:ConqueGdb_Backtrace = g:ConqueGdb_Leader . 't'
"     let g:ConqueGdb_Backtrace = 'g'.'<F10>'
"     "This mapping is only supported on Unix having GDB 7.0+ with full python
"     "support. See |conque-gdb-unix-requirements|. By default this mapping is:
"     "let g:ConqueGdb_ToggleBreak = g:ConqueGdb_Leader . 'b'
"     let g:ConqueGdb_ToggleBreak = '<F9>'
"     "You might want to be able answer GDB confirmations (say y or n) without
"     "having to go to the Conque GDB window. You can use the |ConqueGdbCommand|
"     "command to achieve this:
"     "this is also the way to do custom mappings:
"     "nnoremap <silent> <F12>y :ConqueGdbCommand y<CR>
"     "nnoremap <silent> <F12>n :ConqueGdbCommand n<CR>
"     "ok new plan lets just type :ConqueGdbCommand when pressing F12 so we need only issue our
"     "command and enter
"     ":help key-notation
"     "start: (append name of the executable by hand!)
"     nnoremap g<F1> :ConqueGdb target/debug/
"     "end:
"     nnoremap <Leader><F1> :ConqueGdbCommand quit
"     "issue any command .. tui enable and the threaviews do NOT work in conque.. debug the assembly Standalone if needed(ctrl-x crl-a, ctrl-x ctrl-1/2/3..)
"     "helpfull 'break foo' -> break on function foo();   break main.rs:6 -> break on line 6 in main.rs . ':Man gdb' or google are your firend!
"     nnoremap <F12> :ConqueGdbCommand<Space>
" endif

