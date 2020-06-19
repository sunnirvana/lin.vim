" filetype mapping
autocmd BufRead,BufNewFile *.hql set filetype=sql
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.hs set filetype=haskell
autocmd BufRead,BufNewFile *Makefile* set filetype=make
autocmd BufRead,BufNewFile *.ll set filetype=llvm
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set ai
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set sw=4
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set ts=4
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set sts=4
autocmd FileType javascript,html,css,xml,vue set ai
autocmd FileType javascript,html,css,xml,vue set sw=2
autocmd FileType javascript,html,css,xml,vue set ts=2
autocmd FileType javascript,html,css,xml,vue set sts=2
autocmd FileType vue syntax sync fromstart
