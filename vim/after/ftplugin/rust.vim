setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWrite *.rs :silent exec "!rusty-tags vi --start-dir=" . expand('%:p:h') . "&"
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo
"https://github.com/rust-lang/rust.vim/issues/118
"autocmd FileType rust let g:syntastic_rust_checkers = ['rustc']
autocmd FileType rust let g:syntastic_rust_checkers = ['cargo']
