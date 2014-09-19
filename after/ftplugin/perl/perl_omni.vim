"{{{ Perl omni functions
" call  s:rule({
"     \'only':1,
"     \'head': '^has\s\+\w\+' ,
"     \'context': '^\s*$' ,
"     \'backward': '\w*$',
"     \'comp': function('s:CompMooseAttribute') } )
"}}}


