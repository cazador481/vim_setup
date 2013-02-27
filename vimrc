filetype off "pathogen needs to run before plugin indent on

"{{{autoinstall vundle


let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
   echo "Installing Vundle.."
   echo ""
   silent !mkdir -p ~/.vim/bundle
   silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
   let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
"Add your bundles here
"    Bundle 'Syntastic' "uber awesome syntax and errors highlighter
"{{{My bundles here
Bundle 'http://github.com/tpope/vim-fugitive'
Bundle 'http://github.com/cazador481/perl-support.vim.git'
Bundle 'http://github.com/vim-scripts/a.vim.git'
Bundle 'http://github.com/ervandew/supertab'
Bundle 'http://github.com/gerw/EnhCommentify.vim'
Bundle 'http://github.com/fholgado/minibufexpl.vim.git'
Bundle 'http://github.com/cazador481/ea_color'
Bundle 'http://github.com/petdance/vim-perl'
Bundle 'http://github.com/vim-scripts/vim-perl'
Bundle 'http://github.com/vim-scripts/taglist.vim'
Bundle 'https://github.com/SirVer/ultisnips.git'
Bundle 'https://github.com/vim-scripts/verilog_systemverilog_fix.git'
"}}}


if iCanHazVundle == 0
   echo "Installing Bundles, please ignore key map error messages"
   echo ""
   :BundleInstall
endif

"}}}
filetype plugin indent on

syntax on
color ea
set visualbell
set tags=tags;
set nocompatible
set history=1000
set clipboard+=unnamed "uses x-11 clipboard
set ruler
set cmdheight=2
set backspace=2 "make backspace work normal
set showmatch
set so=10
set tabstop=3
set shiftwidth=3
set background=dark
set cindent
set number
set expandtab
set ic
set diffopt+=iwhite " ignores white space
"set path=.,/home/elash1/vesta-work/**,/home/elash1/hive/**,/mc/rtl/int/tnc.latest/hdl/src
if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif
let g:EnhCommentifyUseAltKeys='yes'
"{{{Tlist

nnoremap <silent> <F8> :Tlist<CR>
let tlist_perl_settings='perl;u:use;p:package;r:role;e:extends;c:constant;a:attribute;s:subroutine'
let Tlist_Show_One_File = 1
"}}}
map <C-J> <C-w>j<C-W>_
map <C-K> <C-W>k<C-W>_
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplForceSyntaxEnable=1
map <S-Enter> O<ESC>
map <Enter> o<Esc>
set exrc
filetype indent on
filetype plugin on
"folding {{{
set foldenable
set foldmethod=syntax
let perl_fold=1
set wildmenu
set wildmode=list:longest,full
set mouse=a "enables mouse mode in console
"}}}
"Get completion to work sanely {{{
"inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
"inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>" 
"inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>" 
"}}}

"let g:Perl_PerlTags	= "enable"
set dir=/tmp "sets the temp directory for swap files

"supertab settings {{{
let g:SuperTabLongestHighlight=1
let g:SuperTabDefaultCompletionType = "context"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"}}}
"
"perl-support {{{
let g:Perl_GlobalTemplateFile=$HOME.'/.vim/bundle/perl-support.vim/perl-support/templates/Templates'

let g:Perl_TemplateOverriddenMsg='yes'
"}}}
"{{{ remap meta keys for enhcomentify
map <C-c> <M-c> 
"}}}
"{{{UltiSnips
let g:UltiSnipSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"}}}

"
"{{{UltiSnips
let g:UltiSnipSinppetsDir="~/.vim/UltiSnips"

"perl settings {{{
function! Perl()


set showmatch
"my perl includes pod
let perl_include_pod;
" syntax color ocmpex things like @(${"foo});
let perl_include_pod=1
endfunction
"}}}
set guifontset=Inconsolata\ 16 
" vim: set fdm=marker:
