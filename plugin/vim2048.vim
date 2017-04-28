function! vim2048#start() abort
    tabnew
    setlocal buftype=nofile bufhidden=wipe nobuflisted nolist noswapfile nowrap cursorline nomodifiable nospell
    call vim2048#ui#redraw(1)
    call s:defmappings()
endfunction


function! s:defmappings() abort
    nnoremap <silent> <buffer> h :call vim2048#logic#left()<cr>
    nnoremap <silent> <buffer> j :call vim2048#logic#down()<cr>
    nnoremap <silent> <buffer> k :call vim2048#logic#up()<cr>
    nnoremap <silent> <buffer> l :call vim2048#logic#right()<cr>
    nnoremap <silent> <buffer> <Left> :call vim2048#logic#left()<cr>
    nnoremap <silent> <buffer> <Down> :call vim2048#logic#down()<cr>
    nnoremap <silent> <buffer> <Up> :call vim2048#logic#up()<cr>
    nnoremap <silent> <buffer> <Right> :call vim2048#logic#right()<cr>
endfunction
