let s:drawer = SpaceVim#api#import('unicode#box')
let s:number = SpaceVim#api#import('data#number')

function! vim2048#ui#redraw(...) abort
    if a:0 == 1
        call s:init()
    else
        call vim2048#ui#random_add_two() 
    endif
    let score = s:drawer.drawing_box(s:score, 1, 4, 10)
    let box = s:drawer.drawing_box(s:data,4,4,6)
    setl modifiable
    call setline(1, score)
    call setline(5, box)
    setl nomodifiable

endfunction

function! s:init() abort
    let s:data = map(range(16), '""')
    let s:score = ['score', 0, 'max score', 0]
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

function! vim2048#ui#random_add_two() abort
    let indexs = []
    let idx = 0
    for a in s:data
        if empty(a)
            call add(indexs, idx)
        endif
        let idx += 1
    endfor
    if len(indexs) > 0
        let s:data[s:number.random(0, len(indexs))] = 2
    endif
endfunction
