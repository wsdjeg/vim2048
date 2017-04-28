let s:drawer = SpaceVim#api#import('unicode#box')
let s:number = SpaceVim#api#import('data#number')

function! vim2048#ui#redraw(...) abort
    if a:0 == 1
        call s:init()
    endif
    let box = s:drawer.drawing_box(s:data,4,4,4)
    setl modifiable
    call setline(1, box)
    setl nomodifiable

endfunction

function! s:init() abort
    let s:data = map(range(16), '""')
    let n = s:number.random(0, 16)
    let s:data[n] = 2
    let m = s:number.random(0, 16)
    while m == n
        let m = s:number.random(0, 16)
    endwhile
    let s:data[m] = 2
endfunction

function! vim2048#ui#update(data) abort
    let s:data = a:data
    call vim2048#ui#redraw()
endfunction

function! vim2048#ui#get_data() abort
    return s:data
endfunction
