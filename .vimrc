set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
		NeoBundleFetch 'Shougo/neobundle.vim'
    call neobundle#end()
endif

"insert here your Neobundle plugins"
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'vim-scripts/The-NERD-tree'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'drillbits/nyan-modoki.vim'
NeoBundle 'grep.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-abolish'
NeoBundle "tyru/caw.vim.git"
NeoBundle "ctrlpvim/ctrlp.vim"
NeoBundle 'kana/vim-submode'
" ctagsの自動生成plugin
NeoBundle 'szw/vim-tags'
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'


"引数なしでvimを開くとNERDTreeを起動
let file_name = expand('%')
if has('vim_starting') &&  file_name == ''
	autocmd VimEnter * NERDTree ./
endif

" カラースキーム
colorscheme jellybeans

"----------------------------------------
" Indent
"----------------------------------------
" 画面に表示されるタブ幅
set tabstop=4
" タブをスペース展開
" set expandtab
" インデント時のスペース数
set shiftwidth=4
" タブが押された場合にtabstopでなく、shiftwidthの数だけインデントする
set smarttab
" 自動インデント
set autoindent

"----------------------------------------
" Search
"----------------------------------------
" シンタックスハイライト
syntax on

" 行番号の表示
set number
" 空白文字の表示
"set list
" カーソル行をハイライト
set cursorline
set cursorcolumn

" インクリメンタルサーチ
set incsearch
" 大文字小文字を区別しない
set ignorecase
" 大文字と小文字の両方が入力された場合のみ区別する
set smartcase
" 検索文字をハイライトする
set hlsearch
" 最終行まで検索したら先頭行に戻る
set wrapscan

"----------------------------------------
"" Other
"----------------------------------------
"" タブと行末半角スペースを強調する
":highlight TabSpace ctermbg=DarkBlue
":match TabSpace /\t\|\s\+$/
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
"ペースト時にオートインデント停止
:set paste

 " バックアップファイルを作成しない
set nobackup

filetype plugin on
filetype indent on

 " コメントの色を変える
highlight Comment ctermfg=LightCyan

 " 行を折り返す
set wrap

 " auto インデント
set smartindent

" key map
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <silent> <C-l> :NERDTreeFind<CR>

"行番号をマウスコピーした時についてこないように設定
set mouse=a

" vモードの置換連続ペースト用
"function! put_text_without_override_register()
"  let line_len = strlen(getline('.'))
"  execute "normal! `>"
"  let col_loc = col('.')
"  execute 'normal! gv"_x'
"  if line_len == col_loc
"    execute 'normal! p'
"  else 
"    execute 'normal! p'
"  endif
"endfunction
"xnoremap <silent> p :call Put_text_without_override_register()<CR>
"vnoremap <silent> p "0p
set clipboard+=unnamed,autoselect

" [Ctags設定]拡張子で読み込みタグ変更
au BufNewFile,BufRead *.php set tags+=$HOME/php.tags
" vim-tags
au BufNewFile,BufRead *.php let g:vim_tags_project_tags_command = "ctags --languages=php -f ~/php.tags `pwd` 2>/dev/null &"
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]> 

" phpの設定
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_parent_error_close = 1

" tplの設定
au BufNewFile,BufRead *.tpl set filetype=html

" vimproc {{{
NeoBundle 'Shougo/vimproc', {
\    'build' : {
\        'mac'  : 'make -f make_mac.mak',
\        'unix' : 'make -f make_unix.mak',},}
"}}}
" vim-quickrun {{{
NeoBundle 'thinca/vim-quickrun'
nnoremap <Leader>r :QuickRun<CR>
let g:quickrun_config = {
\    '_' : {
\        'hook/close_buffer/enable_failure':    1,
\        'hook/close_buffer/enable_empty_data': 1,
\        'runner':                              'vimproc',
\        'runner/vimproc/updatetime':           60,
\        'outputter':                           'multi:buffer:quickfix',
\        'outputter/buffer/split':              ':botright',
\        'outputter/buffer/close_on_empty':     1,},
\    'watchdogs_checker/_' : {
\        'hook/close_quickfix/enable_exit':           1,
\        'hook/back_window/enable_exit':              0,
\        'hook/back_window/priority_exit':            1,
\        'hook/quickfix_status_enable/enable_exit':   1,
\        'hook/quickfix_status_enable/priority_exit': 2,
\        'hook/qfsigns_update/enable_exit':           1,
\        'hook/qfsigns_update/priority_exit':         3,
\        'hook/qfstatusline_update/enable_exit':      1,
\        'hook/qfstatusline_update/priority_exit':    4,},
\    'watchdogs_checker/php' : {
\        'command':     'php',
\        'exec':        '%c -d error_reporting=E_ALL -d display_errors=1 -d display_startup_errors=1 -d log_errors=0 -d xdebug.cli_color=0 -l %o %s:p',
\        'errorformat': '%m\ in\ %f\ on\ line\ %l',},}
"}}}
" vim-watchdogs {{{
"NeoBundleLazy 'osyo-manga/vim-watchdogs', {
"\    'depends': ['thinca/vim-quickrun', 'osyo-manga/shabadou.vim', 'KazuakiM/vim-qfsigns', 'KazuakiM/vim-qfstatusline', 'dannyob/quickfixstatus'],
"\    'autoload' : {
"\        'filetypes': ['php'],},}
"let s:hooks = neobundle#get_hooks('vim-watchdogs')
"function! s:hooks.on_source(bundle)
"    "vim-qfsigns
"    nnoremap <Leader>sy :QfsignsJunmp<CR>
"    "vim-qfstatusline (This setting is userd at lightline)
"    "let g:Qfstatusline#UpdateCmd = function('lightline#update')
"    "vim-watchdogs
"    let g:watchdogs_check_BufWritePost_enable = 0
"    let g:watchdogs_check_BufWritePost_enables = {
"    \   'php' : 1,}
"    let g:watchdogs_check_CursorHold_enable = 1
"endfunction
"unlet s:hooks

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
""""""""""""""""""""""""""""""
set backspace=start,eol,indent

"{{{ file grep
NeoBundle 'fuenor/qfixgrep'
" QuickFixウィンドウでもプレビューや絞り込みを有効化
let QFixWin_EnableMode = 1

" QFixHowm/QFixGrepの結果表示にロケーションリストを使用する/しない
let QFix_UseLocationList = 0
"}}}

inoremap ( ()<ESC>i
inoremap <expr> ) ClosePair(')')
inoremap { {}<ESC>i
inoremap <expr> } ClosePair('}')
inoremap [ []<ESC>i
inoremap <expr> ] ClosePair(']')
" pair close checker.
" from othree vimrc ( http://github.com/othree/rc/blob/master/osx/.vimrc )
function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

" check plugin
NeoBundleCheck
