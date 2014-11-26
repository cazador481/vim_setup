set nocompatible
filetype off "pathogen needs to run before plugin indent on
"{{{autoinstall neobundle


let iCanHazBundle=1
let bundle_readme=expand('~/.vim/bundle/neobundle/README.md')
if !filereadable(bundle_readme)

    echo "Installing Neobundle.."
    echo ""
    if has("unix")
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle
    elseif (match(hostname(),"ELASH1-MOBL") >=0)
        silent !mkdir /home/elash1/.vim/bundle
        silent !git clone https://github.com/Shougo/neobundle.vim.git /home/elash1/.vim/bundle/neobundle
    else
        silent !mkdir c:\home\eddie\.vim\bundle
        silent !git clone https://github.com/Shougo/neobundle.vim.git \home\eddie\.vim\bundle\neobundle
    endif
    let iCanHazBundle=0
endif
set rtp+=~/.vim/bundle/neobundle/
call neobundle#begin(expand('~/.vim/bundle/'))
"}}}
NeoBundleFetch 'http://github.com/Shougo/neobundle'
let g:neobundle#types#git#default_protocol='git'
"Add your bundles here
"{{{General bundles here
"  NeoBundle 'syntastic' "uber awesome syntax and errors highlighter

" NeoBundle 'http://github.com/bling/vim-airline'
NeoBundle 'jgdavey/tslime.vim'
NeoBundle 'godlygeek/tabular'
" NeoBundle 'http://github.com/cazador481/vim-systemverilog'
NeoBundle 'http://github.com/tpope/vim-eunuch' "file modification commands, like Unlink, Move
" NeoBundle 'http://github.com/tpope/vim-fugitive'
NeoBundle 'http://github.com/tpope/vim-surround'
NeoBundle 'http://github.com/tpope/vim-dispatch'
" NeoBundle 'embear/vim-foldsearch'
"should bundle menu
"NeoBundle 'http://github.com/mbadran/headlights

"{{{new Filetypes
NeoBundle 'http://github.com/cazador481/vim-nfo'
NeoBundle 'http://github.com/cazador481/vim-systemc'
"}}}
NeoBundle 'http://github.com/tpope/vim-repeat'
NeoBundle 'tomtom/tcomment_vim'
"{{{ TMUX
"TODO check for TMUX env set to enable
NeoBundle 'christoomey/vim-tmux-navigator'
" NeoBundle 'wellle/tmux-complete.vim'
"}}}

NeoBundle 'http://github.com/vim-scripts/taglist.vim'
NeoBundle 'http://github.com/SirVer/ultisnips'
"NeoBundle 'http://github.com/nathanaelkane/vim-indent-guides.git'
NeoBundle 'http://github.com/perrywky/vim-matchit'
NeoBundle 'http://github.com/kurkale6ka/vim-pairs'
NeoBundleLazy 'http://github.com/derekwyatt/vim-protodef'
autocmd FileType cpp NeoBundleSource vim-protodef
" NeoBundle 'http://github.com/vim-scripts/FSwitch'
NeoBundle 'http://github.com/kana/vim-textobj-user'
"NeoBundle 'http://github.com/bling/vim-bufferline'
" NeoBundle 'http://github.com/kien/ctrlp.vim'
NeoBundle 'http://github.com/xolox/vim-reload', {'depends' : 'xolox/vim-misc' }
NeoBundle 'mattn/gist-vim', {'depends' : 'mattn/webapi-vim' }
NeoBundle 'http://github.com/Shougo/unite.vim' 
NeoBundle 'Shougo/neocomplete.vim'

NeoBundleLazy 'vim-scripts/dbext.vim'
autocmd FileType sql NeoBundleSource dbext.vim
" NeoBundle 'vim-pipe'

" NeoBundle 'tomtom/checksyntax_vim', {'depends' : ['tomtom/quickfixsigns_vim','pydave/AsyncCommand'] }


"
NeoBundle 'http://github.com/kien/rainbow_parentheses.vim'
NeoBundle 'http://github.com/Shougo/vimproc', {
\ 'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\    }, }
" if has("unix") && (v:version >703 || has('patch584'))
"     NeoBundle 'Valloric/YouCompleteMe', {
"                 \'type:' : 'nosync', 
"                 \ 'disabled' :!has('unix'),
"                 \ 'vim_version' : '7.3.584'
"                 \}
" endif
""   , { 'build' : { 'unix' : 'cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/cpp -DPYTHON_INCLUDE_DIR=/usr/intel/pkgs/python/2.7.2/include/python2.7/ -DPYTHON_LIBRARY=/usr/intel/pkgs/python/2.7.2/lib/libpython2.7.so;make', } }

"}}}
"
"
"{{{perl bundles
" NeoBundle 'vim-scripts/perl-support.vim'
NeoBundle 'vim-perl/vim-perl'
" autocmd FileType perl NeoBundleSource perl-support.vim
NeoBundle 'cazador481/perlomni.vim'
autocmd FileType perl set omnifunc=perlcomplete#PerlComplete
" autocmd FileType perl NeoBundleSource perlomni.vim
"NeoBundle 'http://github.com/cazador481/vim-cute-perl.git'
"NeoBundle 'http://github.com/vim-scripts/perlprove.vim'
"}}}

"{{{color schemes
NeoBundle 'http://github.com/cazador481/ea_color'
NeoBundle 'tpope/vim-vividchalk'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'godlygeek/csapprox'
" NeoBundle 'w0ng/vim-hybrid'
"}}}

call neobundle#end()
"
if neobundle#is_installed('neobundle')
    call neobundle#end()
    NeoBundleCheck
endif
set exrc
filetype plugin indent on

syntax on
color ea
set visualbell
set tags=tags;
set nocompatible
set history=1000
set clipboard+=unnamedplus "uses x-11 clipboard
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
set diffopt+=icase " ignores case
set laststatus=2
set suffixesadd+=.gz
set hidden "allows buffers to be hidden while having unsaved changes
"{{{indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" set cindent
"}}}
func! s:etwd() "{{{ sets path to .git
    let cph = expand('%:p:h', 1)
    if match(cph, '\v^<.+>://') >= 0 | retu | en
    for mkr in ['.git/', '.hg/', '.vimprojects']
        let wd = call('find'.(mkr =~ '/$' ? 'dir' : 'file'), [mkr, cph.';'])
        if wd != '' | let &acd = 0 | brea | en
    endfo
    exe 'lc!' fnameescape(wd == '' ? cph : substitute(wd, mkr.'$', '.', ''))
endfunc "}}}



au BufEnter * cal s:etwd()
"{{{autochdir
"if exists('+autochdir')
"set autochdir
"else
"autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
"endif
"}}}
"{{{Tlist

nnoremap <silent> <F8> :Tlist<CR>
let tlist_perl_settings='perl;u:use;p:package;r:role;e:extends;c:constant;a:attribute;s:subroutine'
let Tlist_Show_One_File = 1
"}}}
map <S-Enter> O<ESC>
map <Enter> o<Esc>
"folding {{{
"maps space to page down
map <SPACE> <C-D> 

set foldenable
set foldmethod=syntax
set wildmenu
set wildmode=list:longest,full
set mouse=a "enables mouse mode in console
"}}}
"Get completion to work sanely {{{
"inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>" 
inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>" 
 set completeopt=longest
" set completeopt=longest,menuone
"}}}
"{{{ temp directory
if has("unix")
    set dir=/tmp "sets the temp directory for swap files
else
    set dir=$TEMP
endif
"}}}

"supertab settings {{{
if neobundle#is_installed('supertab')
    let g:SuperTabLongestHighlight=1
    let g:SuperTabDefaultCompletionType = "context"
endif

"}}}
"{{{ remap meta keys for enhcomentify
"map <C-c> <M-c> 
"}}}
"{{{UltiSnips
 if neobundle#is_installed('ultisnips')
     let g:UltiSnipSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

"let g:UltiSnipsExpandTrigger="<tab>"
"     "let g:UltiSnipsJumpForwardTrigger="<tab>"
"     "let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"     let g:UltiSnipsEditSplit ="vertical"
"     function! g:UltiSnips_Complete()
"         call UltiSnips_ExpandSnippet()
"         if g:ulti_expand_res == 0
"             if pumvisible()
"                 return "\<C-n>"
"             else
"                 call UltiSnips_JumpForwards()
"                 if g:ulti_jump_forwards_res == 0
"                     return "\<TAB>"
"                 endif
"             endif
"         endif
"         return ""
"     endfunction

"{{{ #ultisnips and unite 
function! UltiSnipsCallUnite()
    Unite -start-insert -winheight=100 -immediately -no-empty ultisnips
    return ''
endfunction

  inoremap <silent> <F12> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
  nnoremap <silent> <F12> a<C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
"}}}
 
    "inoremap <tab>=g:UltiSnips_Complete()
    " au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"    let g:UltiSnipsJumpForwardTrigger="<leader>j"
endif
"}}}
"perl-support {{{
let perl_fold=1
let g:Perl_GlobalTemplateFile=$HOME.'/.vim/bundle/perl-support.vim/perl-support/templates/Templates'

let g:Perl_TemplateOverriddenMsg='yes'
let g:Perl_DirectRun='yes'
"}}}
"{{{make Control-direction switch between windows
" nmap <silent> <C-k> <C-w><C-k>
" nmap <silent> <C-k> <C-w><C-j>
" nmap <silent> <C-k> <C-w><C-h>
" nmap <silent> <C-k> <C-w><C-l>
"}}}

"{{{ Nerd Commenter
let g:NERDCustomDelimiters = { 'verilog_systemverilog': { 'left': '//', }, }
"}}}
if neobundle#is_installed('rainbow_parenthesis.vim') "{{{
    au VimEnter * RainbowParenthesesActivate
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
endif
"}}}
"{{{indent_guides
let g:indent_guides_start=1
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1
"}}}
function! Is_hd() "{{{
    perl <<EOF
    sub is_hd {
    my $hostname = `hostname`;
    my $t        = 0;
    if ( $hostname =~ /hd/ ) {
        $t = 1;
        }
        VIM::DoCommand "let retVal=". $t;

        }
EOF
perl is_hd
    if exists('retVal')
     return retVal
    endif
endfunction "}}}

if has("multi_byte")  "{{{ 
    "if Is_hd()
        if &termencoding == ""
            let &termencoding = &encoding
        endif
        if !has('gui_running')
                    " set t_Co=256
                    "set 256 colors*/
        endif
        set encoding=utf-8
        setglobal fileencoding=utf-8
       " set ambiwidth=double
        
    "endif
endif "}}}

if neobundle#is_installed('ctrlp.vim') "{{{
"     let g:ctrlp_user_command={
"                 \ 'types': {
"                 \ 1: ['git', 'cd %s && git ls-files'],
"                 \ },
"                 \ 'fallback': 'find %s -type f'
"                 \}
    let g:ctrp_root_markers=['.crucible', 'TOT']
endif "}}}
if neobundle#is_installed('unite.vim') "{{{
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    noremap <C-p> :execute 'Unite -start-insert file_rec/async:'.unite#util#path2project_directory(findfile("TOT",getcwd().";"))<cr> 
    noremap <leader>b :Unite -start-insert buffer <cr>
    let g:unite_source_grep_command = 'ag --ignore .build'
    let g_unite_source_file_rec_max_cache_files=0
    call unite#custom#source('file_rec,file_rec/async','max_candidates',0)
    "nnoremap <leader>fc :<C-u>Unite -start-insert -no-split -buffer-name=file_vcs file/vcs<CR> 
    "VCS file mapping 
    " show executed commmand
    " define shortcut so that I can use :Unite ack:g:some_method to search some_method from gem directory

    function! s:escape_visual(...) "{{{
        let escape = a:0 ? a:1 : ''
        normal `<
        let s = col('.') - 1
        normal `>
        let e = col('.') - 1
        let line = getline('.')
        let pat = line[s : e]
        return escape(pat, escape)
    endfunction"}}}
    function! s:visual_unite_input() "{{{
        return s:escape_visual(" ")
    endfunction"}}}
    function! s:visual_unite_arg() "{{{
        return s:escape_visual(' :\')
    endfunction"}}}
endif

"}}}

if neobundle#is_installed('YouCompleteMe') "{{{

    let g:ycm_collect_identifiers_from_comments_and_strings=1
    let g:ycm_seed_identifiers_with_syntax = 1
    let g:ycm_add_preview_to_completeopt = 1
    let g:ycm_server_user_vim_stdout=1
    let g:ycm_server_log_level='debug'
    let g:ycm_key_list_select_completion=['<TAB>']
endif
"}}}
if neobundle#is_installed('vim-airline') "{{{
    set noshowmode

    let g:airline_theme='powerlineish'
    let g:airline_enable_branch=1
    "let g:airline_powerline_fonts=1
    let g:airline_detect_whitespace = 1
    let g:airline#extensions#hunks#non_zero_only = 1

    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show=1
    let g:airline#extensions#tabline#formatter = 'unique_tail'
    "        let g:airline#extension#bufferline#eabled=1
    "        let g:airline#extension#branch#enabled=1
"if !exists('g:airline_symbols')
  "let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"

endif

"}}}
if neobundle#is_installed('neocomplete.vim') "{{{
" Use neocomplete.
	let g:neocomplete#enable_at_startup = 1
	" Use smartcase.
	let g:neocomplete#enable_smart_case = 1
	" Set minimum syntax keyword length.
	let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#auto_completion_start_length=3
	let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
    let g:neocomplete#enable_refresh_always=1



	" Define dictionary.
	let g:neocomplete#sources#dictionary#dictionaries = {
	    \ 'default' : '',
	    \ 'vimshell' : $HOME.'/.vimshell_hist',
	    \ 'scheme' : $HOME.'/.gosh_completions'
	    \ }

	" Define keyword.
	if !exists('g:neocomplete#keyword_patterns')
	    let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns['default'] = '\h\w*'

	" Plugin key-mappings.
	inoremap <expr><C-g>     neocomplete#undo_completion()
	inoremap <expr><C-l>     neocomplete#complete_common_string()

	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
	  return neocomplete#close_popup() . "\<CR>"
	  " For no inserting <CR> key.
	  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
	endfunction
	" <TAB>: completion.
		inoremap <expr><Tab>  neocomplete#start_manual_complete()
"	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y>  neocomplete#close_popup()
	inoremap <expr><C-e>  neocomplete#cancel_popup()
	" Close popup by <Space>.
	"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

	" AutoComplPop like behavior.
	"let g:neocomplete#enable_auto_select = 1

	" Shell like behavior(not recommended).
	"set completeopt+=longest
	"let g:neocomplete#enable_auto_select = 1
	"let g:neocomplete#disable_auto_complete = 1
	"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

	" Enable omni completion.
	" Enable heavy omni completion.
	if !exists('g:neocomplete#sources#omni#input_patterns')
	  let g:neocomplete#sources#omni#input_patterns = {}
	endif
	if !exists('g:neocomplete#force_omni_input_patterns')
	  let g:neocomplete#force_omni_input_patterns = {}
	endif
	"let g:neocomplete#sources#omni#input_patterns.php =
	"\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
	"let g:neocomplete#sources#omni#input_patterns.c =
	"\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
	"let g:neocomplete#sources#omni#input_patterns.cpp =
	"\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

	" For perlomni.vim setting.
	" https://github.com/c9s/perlomni.vim
	let g:neocomplete#sources#omni#input_patterns.perl =
	\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

	" For smart TAB completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
	        \ <SID>check_back_space() ? "\<TAB>" :
	        \ neocomplete#start_manual_complete()
	  function! s:check_back_space() "{{{
	    let col = col('.') - 1
	    return !col || getline('.')[col - 1]  =~ '\s'
	  endfunction"}}}
" <TAB>: completion.
endif
"}}}
if neobundle#is_installed('neocomplcache.vim') "{{{
    "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Enable heavy features.
    " Use camel case completion.
    "let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    "let g:neocomplcache_enable_underbar_completion = 1

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()
    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return neocomplcache#smart_close_popup() . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><Tab>  neocomplcache#start_manual_complete()

    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()
    " Close popup by <Space>.
    inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplcache_enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplcache_enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplcache_enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplcache_enable_auto_select = 1
    "let g:neocomplcache_disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplcache_omni_patterns.perl = '\h\w*->\|\h\w*->\h\w*\|\h\w*::\|\h\w*::\h\w*'
endif
"}}}
"quick saving {{{
nmap <silent> <Leader>w :update<CR>
"}}}

"{{{ arrow key to buffer map
map <C-LEFT> :bp<CR>
map <C-RIGHT> :bn<CR>
"}}}
"{{{ middle mouse map
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
map <C-S-Insert> <MiddleMouse>
map! <C-S-Insert> <MiddleMouse>
"}}}
"{{{ use silver search
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor\ --hidden
    let g:unite_source_rec_async_command= 'ag --nocolor --nogroup -g ""'
    if neobundle#is_installed('ctrlp.vim') "{{{
        let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
    endif
    "}}}
endif "}}}
"TODO: fix rainbow parent
" if neobundle#is_installed('rainbow_parentheses.vim') "{{{
"
"     au VimEnter * RainbowParenthesesToggle
"     au Syntax * RainbowParenthesesLoadRound
"     au Syntax * RainbowParenthesesLoadSquare
"     au Syntax * RainbowParenthesesLoadBraces
" endif 
"}}}

if neobundle#is_installed('syntastic') "{{{
    let syntastic_perl_checkers=['perlcritic', 'perl']
    let g:syntastic_perl_lib_path=['./lib', '/home/scratch.eash/NV-rtltime/lib/']
    let g:syntastic_enable_perl_checker=0
endif "}}}


let g:sql_type_default='mysql'

if neobundle#is_installed('dbext.vim') "{{{
    let g:dbext_default_profile_fullchip_ro= 'type=MYSQL:user=fullchipsims_ro:passwd=CB2ea79!:dbname=gpu_fullchip_sims:host=gpu-db-gpufullchipsims-read'
    let g:dbext_default_profile_fullchip_dev= 'type=MYSQL:user=fullchipsims_dev:passwd=dev:dbname=GPUFullchipSims:host=gpu-db-gpufullchipsims-dev'
endif "}}}

" Disable auto comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o "Makes copying and pasting using mosh work better


"clipboard with xclip 
vmap <C-c> :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!xclip -selection c<CR>u
nmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>
" vim: set fdm=marker:
