filetype off "pathogen needs to run before plugin indent on
"{{{autoinstall vundle


let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)

   echo "Installing Vundle.."
   echo ""
   if has("unix")
      silent !mkdir -p ~/.vim/bundle
      silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
   elseif (match(hostname(),"ELASH1-MOBL") >=0)
      silent !mkdir /home/elash1/.vim/bundle
      silent !git clone https://github.com/gmarik/vundle /home/elash1/.vim/bundle/vundle
   else
      silent !mkdir /home/eddie/.vim/bundle
      silent !git clone https://github.com/gmarik/vundle /home/eddie/.vim/bundle/vundle
   endif
   let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"}}}
Bundle 'gmarik/vundle'
"Add your bundles here
"    Bundle 'Syntastic' "uber awesome syntax and errors highlighter
"{{{My bundles here
"Bundle 'http://github.com/tpope/vim-fugitive'
Bundle 'bling/vim-bufferline'
Bundle 'http://github.com/cazador481/perl-support.vim.git'
Bundle 'http://github.com/vim-scripts/a.vim.git'
Bundle 'http://github.com/ervandew/supertab'
"Bundle 'http://github.com/gerw/EnhCommentify.vim'
Bundle 'http://github.com/scrooloose/nerdcommenter'
Bundle 'http://github.com/fholgado/minibufexpl.vim.git'
Bundle 'http://github.com/cazador481/ea_color'
Bundle 'http://github.com/petdance/vim-perl'
"Bundle 'http://github.com/vim-scripts/vim-perl'
Bundle 'http://github.com/vim-scripts/taglist.vim'
Bundle 'https://github.com/SirVer/ultisnips.git'
Bundle 'https://github.com/vim-scripts/verilog_systemverilog_fix.git'
Bundle 'https://github.com/nathanaelkane/vim-indent-guides.git'
Bundle 'cazador481/vim-systemc'
Bundle 'perrywky/vim-matchit'
Bundle 'tomasr/molokai'
Bundle 'Lokaltog/powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'ewiplayer/vim-protodef'
Bundle 'FSwitch'
Bundle 'Shougo/vimproc'
Bundle 'https://github.com/cazador481/vim-cute-perl.git'
if has("unix") && (v:version <703 || has('patch584'))
   Bundle 'Valloric/YouCompleteMe' 
endif
"}}}
"


if iCanHazVundle == 0
   echo "Installing Bundles, please ignore key map error messages"
   echo ""
   :BundleInstall
endif

set exrc
filetype plugin on
filetype indent on
filetype plugin indent on

syntax on
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
set t_Co=256 "set 256 colors*/
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
set background=dark
let g:load_doxygen_syntax=1
set number
set ic
set diffopt+=iwhite " ignores white space
"{{{indent
set tabstop=4
set shiftwidth=4
set expandtab
set cindent
"}}}
"{{{autochdir
"if exists('+autochdir')
   "set autochdir
"else
   "autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
"endif
"}}}
let g:EnhCommentifyUseAltKeys='yes'
"{{{Tlist

nnoremap <silent> <F8> :Tlist<CR>
let tlist_perl_settings='perl;u:use;p:package;r:role;e:extends;c:constant;a:attribute;s:subroutine'
let Tlist_Show_One_File = 1
"}}}
"{{{window map change
map <C-J> <C-w>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-l> <C-W>l<C-W>_
"}}}
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplForceSyntaxEnable=1
map <S-Enter> O<ESC>
map <Enter> o<Esc>
"folding {{{
set foldenable
set foldmethod=syntax
set wildmenu
set wildmode=list:longest,full
set mouse=a "enables mouse mode in console
"}}}
"Get completion to work sanely {{{
"inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
"inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>" 
"inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>" 
"}}}
"{{{ temp directory
if has("unix")
   set dir=/tmp "sets the temp directory for swap files
else
   set dir=$TEMP
endif
"}}}

"supertab settings {{{
let g:SuperTabLongestHighlight=1
let g:SuperTabDefaultCompletionType = "context"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"}}}
"{{{ remap meta keys for enhcomentify
"map <C-c> <M-c> 
"}}}
"{{{UltiSnips
let g:UltiSnipSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit ="vertical"

"}}}
"perl-support {{{
let g:Perl_GlobalTemplateFile=$HOME.'/.vim/bundle/perl-support.vim/perl-support/templates/Templates'

let g:Perl_TemplateOverriddenMsg='yes'
"}}}
"perl settings {{{
autocmd FileType perl set equalprg=perltidy
function! Perl()


   let perl_fold=1
   set showmatch
   "my perl includes pod
   let perl_include_pod;
   " syntax color ocmpex things like @(${"foo});
   let perl_include_pod=1
endfunction
"}}}
"{{{make Control-direction switch between windows
nmap <silent> <C-k> <C-w><C-k>
nmap <silent> <C-k> <C-w><C-j>
nmap <silent> <C-k> <C-w><C-h>
nmap <silent> <C-k> <C-w><C-l>
"}}}

set guifontset=Inconsolata\ 16 
"{{{ Nerd Commenter
let g:NERDCustomDelimiters = { 'verliog_systemverilog': { 'left': '#', }, }
"}}}

"{{{indent_guides
let g:indent_guides_start=1
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1
"}}}
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
  set ambiwidth=double
endif



" vim: set fdm=marker:
