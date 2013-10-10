if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
au! BufRead,BufNewFile *.probgen	setfiletype perl
au! BufRead,BufNewFile *.prob setfiletype perl
au! BufRead,BufNewFile *.tc	setfiletype perl
au! BufRead,BufNewFile *.res.? setfiletype res
au! BufRead,BufNewfile *.int setfiletype ihdl
au! BufRead,BufNewfile *.params setfiletype ihdl
au! BufRead,BufNewfile *.hdl setfiletype ihdl
au! BufRead,BufNewfile *.ifc setfiletype ihdl
au! BufRead,BufNewfile *.sig setfiletype ihdl
au! BufRead,BufNewfile *.nfo setfiletype nfo
au! BufRead,BufNewfile *.hdl setfiletype perl
au! BufRead,BufNewfile *.udf setfiletype perl
augroup END
