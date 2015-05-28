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

"--- <F6>  タイムスタンプを挿入してinsertモードへ移行 ----
nnoremap tt  <ESC>i<C-R>=strftime("%Y/%m/%d")<CR>
"--- 
nnoremap pt <ESC>:!rm -f ~/php.tags; ctags --languages=php -f ~/php.tags `pwd`<CR>
nnoremap vt <ESC>:!rm -f ~/vim.tags; ctags --languages=vim -f ~/vim.tags `pwd`<CR>

" ファイルパスをコピー
nnoremap zp <ESC>:call system("pbcopy" , expand("%:"))<CR>
nnoremap zP <ESC>:call system("pbcopy" , expand("%:p"))<CR>

call submode#enter_with('bufmove', 'n', '', 'd>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 'd<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 'd+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 'd-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
"}}}


" key map
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <silent> <C-l> :NERDTreeFind<CR>

