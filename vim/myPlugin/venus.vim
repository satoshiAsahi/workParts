"{{{
" venus特有設定
" テンプレを開く
nmap tp :call VenusSwitchFile("tpl")<CR>
" コントローラーを開く
nmap cn :call VenusSwitchFile("Controller")<CR>

function! VenusSwitchFile(action)

  let target = VenusGetTargetFilePath(a:action)

let _log = expand(":ls")
" echomsg string(target)
" message

  if findfile(target) != ""
    let _bufNum = bufnr(target)
" echomsg string(_bufNum)
" message
" バッファ番号が存在するタブを閉じる
	if _bufNum > 0
	    execute ":bd" . _bufNum
	endif
" 新しいタブを開く
    execute ":tabnew " . target
  else
	echo "対象がない！！"
  endif

endfunction

function! VenusGetTargetFilePath(action)

	let path = expand("%:p")
	"管理画面と表画面の切り分け

	if match(path ,'crooz_ec') > 0

		if match(path , 'reuselist') > 0
			let _dir = 'templates_pc'
		elseif match(path , 'mobile') > 0
			let _dir = 'templates_html5'
		else
			let _dir = 'templates'
		endif

		if a:action == "tpl"
			let path = substitute(path, "controller\/", _dir . "\/", "")
			return substitute(path, "\.php", ".tpl", "")
		elseif a:action == "Controller"
			let path = substitute(path, _dir."\/", "controller\/", "")
			return substitute(path, "\.tpl", ".php", "")
		endif

	else
		if match(path , '/admin/') > 0
			let dir="PC"
		else
			let dir="SP"
		endif

		if a:action == "tpl"
			let path = substitute(path, "controller", "view\/".dir, "")
			return substitute(path, "\.php", ".tpl", "")
		elseif a:action == "Controller"
			let path = substitute(path, "view\/".dir, "controller", "")
			return substitute(path, "\.tpl", ".php", "")
		endif

	endif

endfunction
"}}}
