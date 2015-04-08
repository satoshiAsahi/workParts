" Name: venus.vim
" Version: 0.0.2
" Author: Takuya Nakamura <tanakamura@crooz.co.jp>
" Usage:
"
" テンプレを開く
nmap tp :call VenusSwitchFile("tpl")<CR>
" テンプレ(スマホ)を開く
" nnoremap <Leader>s :call VenusSwitchFile("tplSp")<CR>
" コントローラーを開く
nmap cn :call VenusSwitchFile("Controller")<CR>
" インクルードファイルを開く
" nnoremap <Leader>i :call VenusSwitchFile("Include")<CR>


function! VenusSwitchFile(action)

  let target = VenusGetTargetFilePath(a:action)

  if findfile(target) != ""
    execute ":e " . target
  endif

endfunction

function! VenusGetTargetFilePath(action)

	let path = expand("%:p")

	if a:action == "tpl"

		if path =~ "tpl$"
			let path = substitute(path, "controller", "view\/SP", "")
			return substitute(path, "\.php", ".tpl", "")
		endif
	elseif a:action == "Controller"
		let path = substitute(path, "view\/SP", "controller", "")
		return substitute(path, "\.tpl", ".php", "")
	endif

endfunction
