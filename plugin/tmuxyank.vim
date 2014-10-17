if exists('g:tmuxyank_loaded') || &cp || v:version < 700
    finish
endif
let g:tmuxyank_loaded = 1

if !exists('g:tmuxyank_map')
    let g:tmuxyank_map = '<leader>ty'
endif

execute 'nnoremap <silent> ' . g:tmuxyank_map . ' :set operatorfunc=<SID>TmuxYank<cr>g@'
execute 'vnoremap <silent> ' . g:tmuxyank_map . ' :<c-u>call <SID>TmuxYank(visualmode())<cr>'

function! s:TmuxYank(type)
    let saved_unnamed_register = @@
    let tempfile = tempname()

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    try
        call writefile(split(@@,'\n'), tempfile)
        let error = system('tmux load-buffer ' . tempfile)
        if v:shell_error
            exec 'echoerr '.string(error[0:-2])
        endif
    finally
        call delete(tempfile)
    endtry
    let @@ = saved_unnamed_register
endfunction
