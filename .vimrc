set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'

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


"引数なしでvimを開くとNERDTreeを起動
let file_name = expand('%')
if has('vim_starting') &&  file_name == ''
	autocmd VimEnter * NERDTree ./
endif


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

"行番号をマウスコピーした時についてこないように設定
set mouse=a

set clipboard+=unnamed,autoselect

" [Ctags設定]拡張子で読み込みタグ変更
au BufNewFile,BufRead *.php set tags+=$HOME/php.tags
" vim-tags
au BufNewFile,BufRead *.php let g:vim_tags_project_tags_command = "ctags --languages=php -f ~/php.tags `pwd` 2>/dev/null &"
" tagsジャンプの時に複数ある時は一覧表示

" VimScriptのctags
au BufNewFile,BufRead *.vim set tags+=$HOME/vim.tags
au BufNewFile,BufRead *.vim let g:vim_tags_project_tags_command = "ctags --languages=vim -f ~/vim.tags `pwd` 2>/dev/null &"


nnoremap <C-]> g<C-]> 

"{{{ phpの設定
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_parent_error_close = 1
" let php_folding = 1


" 辞書登録
autocmd FileType php :set dictionary+=~/.vim/php.dict
"}}}
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

" {{{{ 終了
call neobundle#end()
" }}}}


" カラースキーム
colorscheme jellybeans
"colorscheme darkblue
" colorscheme molokai


"{{{
" 自前のプラグインを読み込む
runtime! myPlugin/*.vim
runtime! plugin/*.vim
"}}}

"{{{
" phpドキュメント
imap <C-o> :set paste<CR>:exe PhpDoc()<CR>:set nopaste<CR>i
nnoremap <C-i> :call PhpDocSingle()<CR>i
"}}}

"{{{
" log
let g:neobundle#log_filename = "/tmp/neobundle.log"
"}}}


" check plugin
NeoBundleCheck
