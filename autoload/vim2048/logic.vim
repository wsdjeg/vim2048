let s:score = 0

function! vim2048#logic#up() abort
    let data = s:merge_up(s:split_list(vim2048#ui#get_data()))
    call vim2048#ui#update(data, s:score)
    let s:score = 0
endfunction
function! vim2048#logic#down() abort
    let data = s:merge_down(s:split_list(vim2048#ui#get_data()))
    call vim2048#ui#update(data, s:score)
    let s:score = 0
endfunction
function! vim2048#logic#right() abort
    let data = s:merge_right(s:split_list(vim2048#ui#get_data()))
    call vim2048#ui#update(data, s:score)
    let s:score = 0
endfunction
function! vim2048#logic#left() abort
    let data = s:merge_left(s:split_list(vim2048#ui#get_data()))
    call vim2048#ui#update(data, s:score)
    let s:score = 0
endfunction


function! s:split_list(data) abort
    return [
                \ [
                \ a:data[0], a:data[1], a:data[2], a:data[3]
                \ ],
                \ [
                \ a:data[4], a:data[5], a:data[6], a:data[7]
                \ ],
                \ [
                \ a:data[8], a:data[9], a:data[10], a:data[11]
                \ ],
                \ [
                \ a:data[12], a:data[13], a:data[14], a:data[15]
                \ ]
                \ ]
endfunction

" a list with 4 items
function! s:merge(l) abort
    let l = filter(a:l, '!empty(v:val)')
    if len(l) == 0
        return ['','','','']
    elseif len(l) == 1
        return [l[0],'','','']
    elseif len(l) == 2
        if l[0] == l[1]
            let s:score += l[0] * 2
            return [l[0] * 2, '','','']
        else
            return [l[0], l[1],'','']
        endif
    elseif len(l) == 3
        if l[0] == l[1]
            let s:score += l[0] * 2
            return [l[0] * 2, l[2],'','']
        elseif l[1] == l[2]
            let s:score += l[1] * 2
            return [l[0], l[1] * 2,'','']
        else
            return [l[0], l[1], l[2],'']
        endif
    else
        if l[0] == l[1]
            if l[2] == l[3]
            let s:score += l[0] * 2 + l[2] * 2
                return [l[0] * 2, l[2] * 2,'','']
            else
            let s:score += l[0] * 2
                return [l[0] * 2, l[2], l[3],'']
            endif
        elseif l[1] == l[2]
            let s:score += l[1] * 2
            return [l[0], l[1] * 2, l[3],'']
        else
            if l[2] == l[3]
            let s:score += l[2] * 2
                return [l[0], l[1], l[2] * 2,'']
            else
                return [l[0], l[1], l[2], l[3]]
            endif
        endif
    endif
endfunction

function! s:merge_up(data) abort
    let l0 = s:merge([a:data[0][0], a:data[1][0], a:data[2][0], a:data[3][0]])
    let l1 = s:merge([a:data[0][1], a:data[1][1], a:data[2][1], a:data[3][1]])
    let l2 = s:merge([a:data[0][2], a:data[1][2], a:data[2][2], a:data[3][2]])
    let l3 = s:merge([a:data[0][3], a:data[1][3], a:data[2][3], a:data[3][3]])
    return [
                \ l0[0],l1[0],l2[0],l3[0],
                \ l0[1],l1[1],l2[1],l3[1],
                \ l0[2],l1[2],l2[2],l3[2],
                \ l0[3],l1[3],l2[2],l3[3],
                \ ]
endfunction

function! s:merge_down(data) abort
    let l0 = s:merge([a:data[3][0], a:data[2][0], a:data[1][0], a:data[0][0]])
    let l1 = s:merge([a:data[3][1], a:data[2][1], a:data[1][1], a:data[0][1]])
    let l2 = s:merge([a:data[3][2], a:data[2][2], a:data[1][2], a:data[0][2]])
    let l3 = s:merge([a:data[3][3], a:data[2][3], a:data[1][3], a:data[0][3]])
    return [
                \ l0[3],l1[3],l2[3],l3[3],
                \ l0[2],l1[2],l2[2],l3[2],
                \ l0[1],l1[1],l2[1],l3[1],
                \ l0[0],l1[0],l2[0],l3[0],
                \ ]
endfunction

function! s:merge_right(data) abort
    let l0 = s:merge([a:data[0][3], a:data[0][2], a:data[0][1], a:data[0][0]])
    let l1 = s:merge([a:data[1][3], a:data[1][2], a:data[1][1], a:data[1][0]])
    let l2 = s:merge([a:data[2][3], a:data[2][2], a:data[2][1], a:data[2][0]])
    let l3 = s:merge([a:data[3][3], a:data[3][2], a:data[3][1], a:data[3][0]])
    return [
                \ l0[3],l0[2],l0[1],l0[0],
                \ l1[3],l1[2],l1[1],l1[0],
                \ l2[3],l2[2],l2[1],l2[0],
                \ l2[3],l3[2],l3[1],l3[0],
                \ ]
endfunction

function! s:merge_left(data) abort
    let l0 = s:merge(a:data[0])
    let l1 = s:merge(a:data[1])
    let l2 = s:merge(a:data[2])
    let l3 = s:merge(a:data[3])
    return l0 + l1 + l2 + l3
endfunction
