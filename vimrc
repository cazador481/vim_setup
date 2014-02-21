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
call neobundle#rc()
"}}}
NeoBundleFetch 'http://github.com/Shougo/neobundle'
"Add your bundles here
"    Bundle 'Syntastic' "uber awesome syntax and errors highlighter
"{{{My bundles here
NeoBundle 'http://github.com/bling/vim-airline'
NeoBundle 'godlygeek/tabular'
NeoBundle 'http://github.com/cazador481/ea_color'
NeoBundle 'tpope/vim-vividchalk'
NeoBundleLazy 'http://github.com/cazador481/perl-support.vim.git'
autocmd FileType perl NeoBundleSource perl-support.vim
NeoBundleLazy 'https://github.com/c9s/perlomni.vim'
autocmd FileType perl NeoBundleSource perlomni.vim
      "NeoBundle 'http://github.com/cazador481/vim-cute-perl.git'
NeoBundle 'http://github.com/cazador481/vim-systemverilog'
NeoBundle 'http://github.com/tpope/vim-fugitive'
NeoBundle 'http://github.com/tpope/vim-surround'
NeoBundle 'http://github.com/tpope/vim-dispatch'
NeoBundle 'embear/vim-foldsearch'
"should bundle menu
"NeoBundle 'http://github.com/mbadran/headlights

NeoBundle 'http://github.com/cazador481/vim-nfo'
NeoBundle 'http://github.com/cazador481/vim-systemc'
"NeoBundle 'http://github.com/scrooloose/nerdcommenter'
"NeoBundle 'http://github.com/tpope/vim-commentary'
NeoBundle 'http://github.com/tpope/vim-repeat'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'http://github.com/vim-scripts/perlprove.vim'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'http://github.com/vim-scripts/taglist.vim'
NeoBundle 'http://github.com/SirVer/ultisnips'
"NeoBundle 'http://github.com/nathanaelkane/vim-indent-guides.git'
NeoBundle 'http://github.com/perrywky/vim-matchit'
NeoBundle 'http://github.com/kurkale6ka/vim-pairs'
NeoBundleLazy 'http://github.com/derekwyatt/vim-protodef'
autocmd FileType cpp NeoBundleSource vim-protodef
NeoBundle 'http://github.com/vim-scripts/FSwitch'
NeoBundle 'http://github.com/kana/vim-textobj-user'
"NeoBundle 'http://github.com/bling/vim-bufferline'
NeoBundle 'http://github.com/kien/ctrlp.vim'
NeoBundle 'http://github.com/xolox/vim-reload', {'depends' : 'xolox/vim-misc' }
"NeoBundle 'http://github.com/Shougo/unite.vim' 
"if has("unix") && version <704
"    NeoBundle 'http://github.com/Shougo/neocomplcache.vim' 
"NeoBundle  'http://github.com/JazzCore/neocomplcache-ultisnips'

"endif

"NeoBundle 'm2mdas/unite-file-vcs'
"
"NeoBundle 'http://github.com/kien/rainbow_parentheses.vim'
"NeoBundle 'http://github.com/Shougo/vimshell.vim'
NeoBundle 'http://github.com/Shougo/vimproc', {
            \ 'build' : {
            \     'windows' : 'make -f make_mingw32.mak',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    }, }
if has("unix") && (v:version >703 || has('patch584'))
    NeoBundle 'Valloric/YouCompleteMe', {
                \'type:' : 'nosync', 
                \ 'disabled' :!has('unix'),
                \ 'vim_version' : '7.3.584'
                \}
endif
   ""   , { 'build' : { 'unix' : 'cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/cpp -DPYTHON_INCLUDE_DIR=/usr/intel/pkgs/python/2.7.2/include/python2.7/ -DPYTHON_LIBRARY=/usr/intel/pkgs/python/2.7.2/lib/libpython2.7.so;make', } }

"}}}
"
"
"if iCanHazBundle == 0
"echo "Installing Bundles, please ignore key map error messages"
"echo ""
if neobundle#is_installed('neobundle')
NeoBundleCheck
endif
set exrc
filetype plugin indent on

syntax on
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
color vividchalk
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
set relativenumber
set number
set ic
set diffopt+=iwhite " ignores white space
set diffopt+=icase " ignores case
set laststatus=2
"{{{indent
set tabstop=4
set shiftwidth=4
set expandtab
set cindent
"}}}
func! s:etwd() "{{{ sets path to .git
    let cph = expand('%:p:h', 1)
    if match(cph, '\v^<.+>://') >= 0 | retu | en
    for mkr in ['.git/', '.hg/', '.vimprojects']
        let wd = call('find'.(mkr =~ '/$' ? 'dir' : 'file'), [mkr, cph.';'])
        if wd != '' | let &acd = 0 | brea | en
    endfo
    exe 'lc!' fnameescape(wd == '' ? cph : substitute(wd, mkr.'$', '.', ''))
endfunc

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
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplForceSyntaxEnable=1
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

    
    "inoremap <tab>=g:UltiSnips_Complete()
    " au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"    let g:UltiSnipsJumpForwardTrigger="<leader>j"
endif
"}}}
"perl-support {{{
let g:Perl_GlobalTemplateFile=$HOME.'/.vim/bundle/perl-support.vim/perl-support/templates/Templates'

let g:Perl_TemplateOverriddenMsg='yes'
"}}}
"{{{make Control-direction switch between windows
" nmap <silent> <C-k> <C-w><C-k>
" nmap <silent> <C-k> <C-w><C-j>
" nmap <silent> <C-k> <C-w><C-h>
" nmap <silent> <C-k> <C-w><C-l>
"}}}

set guifontset=Inconsolata\ 16 
"set guifont=MyFont\ for\ Powerline
"{{{ Nerd Commenter
let g:NERDCustomDelimiters = { 'verilog_systemverilog': { 'left': '//', }, }
"}}}
"{{{ Rainbow Parentheses
"NeoBundle 'http://github.com/kien/rainbow_parentheses.vim'
if neobundle#is_installed('rainbow_parenthesis.vim')
    au VimEnter * RainbowParenthesesToggle
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

if has("multi_byte")  
    "if Is_hd()
        if &termencoding == ""
            let &termencoding = &encoding
        endif
        if !has('gui_running')
                    "set t_Co = 256 "set 256 colors*/
        endif
        set encoding=utf-8
        setglobal fileencoding=utf-8
       " set ambiwidth=double
        
    "endif
endif

if neobundle#is_installed('ctrlp.vim')
    let g:ctrlp_user_command={
                \ 'types': {
                \ 1: ['git', 'cd %s && git ls-files'],
                \ },
                \ 'fallback': 'find %s -type f'
                \}
endif
"{{{ unite settings
if neobundle#is_installed('unite')
    noremap <C-p> :Unite file_rec/async<cr> "file open
    "nnoremap <leader>fc :<C-u>Unite -start-insert -no-split -buffer-name=file_vcs file/vcs<CR> 
    "VCS file mapping 
    command! UniteAckToggleCase :let g:unite_source_ack_ignore_case=!g:unite_source_ack_ignore_case|let g:unite_source_ack_ignore_case
    " show executed commmand
    let g:unite_source_ack_enable_print_cmd = 1
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

    "{{{ unite ack
    nnoremap <silent> <Space>a  :<C-u>exe "Unite -buffer-name=ack ack::" . escape(expand('<cword>'),' :\')<CR>
    vnoremap <silent> <Space>a  :<C-u>exe "Unite -buffer-name=ack ack::" . <SID>visual_unite_arg()<CR>
    nnoremap <silent> <Space>A  :<C-u>UniteResume ack<CR>

    command! UniteAckToggleCase :let g:unite_source_ack_ignore_case=!g:unite_source_ack_ignore_case|let g:unite_source_ack_ignore_case

    " shortcut
    let g:unite_source_ack_targetdir_shortcut = {
                \ 'bundle': '$HOME/.vim/bundle/',
                \ 'unite': "$HOME/.vim/bundle/unite.vim",
                \ }

    " set filter to use converter_ack_shortcut to let candidate cosmically
    " converted with shortcut
    call unite#custom_filters('ack', ['matcher_default', 'sorter_default', 'converter_ack_shortcut'])
    " command which use shortcut
    command! -nargs=1 SearchBundle :Unite ack:bundle:<args>
    command! -nargs=1 SearchGem    :Unite ack:gem:<args>
    command! -nargs=1 SearchUnite  :Unite ack:unite:<args>
    command! -nargs=1 SearchNeco   :Unite ack:neco:<args>
endif
"}}}
"}}}
let g:neocomplcache_enable_at_startup=1

if neobundle#is_installed('YouCompleteMe') "{{{

    let g:ycm_collect_identifiers_from_comments_and_strings=1
    let g:ycm_seed_identifiers_with_syntax = 1
    let g:ycm_add_preview_to_completeopt = 1
    let g:ycm_server_user_vim_stdout=1
    let g:ycm_server_log_level='debug'
    let g:ycm_key_list_select_completion=['<TAB>']
endif
"}}}
"{{{airline
if neobundle#is_installed('vim-airline')
    set noshowmode

    let g:airline_theme='powerlineish'
    let g:airline_enable_branch=1
    let g:airline_powerline_fonts=1
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
"{{{neocomplcache
if neobundle#is_installed('neocomplcache.vim')
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
    let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif
"}}}
"quick saving {{{
nmap <silent> <Leader>w :update<CR>
"}}}
"IndentGuidesDisable

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

set suffixesadd+=.gz

au FileType verilog_systemverilog compiler quick_build
" vim: set fdm=marker:
