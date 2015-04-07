set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

filetype plugin indent on

"insert here your Neobundle plugins"
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-scripts/The-NERD-tree'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'drillbits/nyan-modoki.vim'
NeoBundle 'grep.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-abolish'
NeoBundle "tyru/caw.vim.git"
NeoBundle "ctrlpvim/ctrlp.vim"
" ctagsの自動生成plugin
NeoBundle 'szw/vim-tags'
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'
"{{{ windowのサイズを可変
NeoBundle 'kana/vim-submode'
NeoBundle 'vim-scripts/taglist.vim'

"{{{ 補完系
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
 
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
 
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"}}}

"{{{ key map系
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

call submode#enter_with('bufmove', 'n', '', 'd>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 'd<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 'd+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 'd-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
"}}}

"引数なしでvimを開くとNERDTreeを起動
let file_name = expand('%')
if has('vim_starting') &&  file_name == ''
	autocmd VimEnter * NERDTree ./
endif

" カラースキーム
colorscheme jellybeans
"colorscheme darkblue
" colorscheme molokai

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

"{{{ phpの設定
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_parent_error_close = 1
" let php_folding = 1

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

" backspaceキーで消せる範囲
set backspace=start,eol,indent

" vim-ref php manual {{{
NeoBundle 'thinca/vim-ref'
let g:ref_cache_dir=$HOME.'/.vim/vim-ref/cache'
let g:ref_phpmanual_path=$HOME.'/.vim/vim-ref/php-chunked-xhtml'
"}}}

"{{{ file grep
NeoBundle 'fuenor/qfixgrep'
" QuickFixウィンドウでもプレビューや絞り込みを有効化
let QFixWin_EnableMode = 1

" QFixHowm/QFixGrepの結果表示にロケーションリストを使用する/しない
let QFix_UseLocationList = 0
"}}}

"{{{
" スニペット
NeoBundle 'Shougo/neosnippet.vim'
"}}}


"--- <F6>  タイムスタンプを挿入してinsertモードへ移行 ----
nmap tt  <ESC>i<C-R>=strftime("%Y/%m/%d")<CR>
"--- 
nnoremap pt <ESC>:!ctags --languages=php -f ~/php.tags `pwd`<CR>

"{{{
" venus特有設定
" テンプレを開く
nmap tp :call VenusSwitchFile("tpl")<CR>
" テンプレ(スマホ)を開く
" nnoremap <Leader>s :call VenusSwitchFile("tplSp")<CR>
" コントローラーを開く
nmap cn :call VenusSwitchFile("Controller")<CR>

function! VenusSwitchFile(action)

  let target = VenusGetTargetFilePath(a:action)

  if findfile(target) != ""
    execute ":e " . target
  endif

endfunction

function! VenusGetTargetFilePath(action)

	let path = expand("%:p")

	if a:action == "tpl"
		let path = substitute(path, "controller", "view\/SP", "")
		return substitute(path, "\.php", ".tpl", "")
	elseif a:action == "Controller"
		let path = substitute(path, "view\/SP", "controller", "")
		return substitute(path, "\.tpl", ".php", "")
	endif

endfunction
"}}}



" check plugin
NeoBundleCheck
