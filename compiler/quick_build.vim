" Vim Compiler File
" Compiler:     runs perl's Test::Unit 'prove'
" Maintainer:   harmen-cpan@millionmonkeys.nl
" OriginalMaintainer:   Christian J. Robinson <infynity@onewest.net>
" Creation:  2005 Jul 28
" Creation:  2005 Jul 29
"
" Installation:
" - Copy this file to ~/.vim/compiler/
" - Add to yor .vimrc: 
"   au BufRead,BufNewFile *.t set filetype=perl | compiler perlprove

if exists("current_compiler")
  finish
endif
let current_compiler = "quick_build"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:path = expand('<sfile>:p:h')
let s:savecpo = &cpo
set cpo&vim

" Usage: :make - prove the current testfile
"        :make t - run prove and give arguments to prove ('t' in this case)
" prove is called with '-l -v'
" The /dev/stdout trick is to make sure vim only gets prove's STDERR
" CompilerSet &makeprg="/p/srvr10nm/lv/bin/quick_compile\ $*\ \\\|&\ expand(s:path)/vlog-filter.pl"
let g:ea="/p/srvr10nm/lv/bin/quick_compile\ $*\ \\\|&\ ".s:path."/vlog-filter.pl"
" let &makeprg=/p/srvr10nm/lv/bin/quick_compile\ $*\ \\\|&\ expand(s:path)/vlog-filter.pl"
let &l:makeprg=g:ea
let &efm='%-GWarning-[LIB-NO-EXT]'
let &efm.=',%-GParsing%.%#'
let &efm.=',%-GBack to file%.%#'
let &efm.=',%E\ \ "%f"\,,%C\ \ %l:%m,%-C,%Z'
let &efm.=',%EError-%.%#,%C%f\,\ %l,%C%m,%Z'
let &efm.=',%W%>Warning-%m,%C%f\,\ %l,%C%m,%Z'

"
"   Error-[SE] Syntax error
"     Following verilog source has syntax error :
"     "/nfs/site/disks/ltdn_lrb_disk1100/knh/work/valnic02/elash1/build/sb/verif/common/testbench/ll_bfm/sb/rlink_sb_driver.sv",
"     2: token is 'rlink_iosf_db_driver_base'
"     class rlink_iosf_sb_driver_slave  extends rlink_iosf_db_driver
" CompilerSet errorformat='%E\ \ "%f"\,,%C\ \ %l:%m,%-C,%Z'
 "CompilerSet errorformat=%E\ \ \"%f\",%Z
 "           " \%C\ \ %l:%m,
 "           "\%-C,%Z
" Explanation:
" 1  : verilog syntax_error


let &cpo = s:savecpo
unlet s:savecpo
