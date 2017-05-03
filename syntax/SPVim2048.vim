syntax clear
hi ColNumberSplit   gui=bold guifg=Grey ctermfg=DarkGreen
hi ColNumber2		gui=bold guibg=DarkGreen ctermfg=DarkGreen
hi ColNumber4		gui=bold guibg=DarkBlue ctermfg=DarkBlue
hi ColNumber8		gui=bold guibg=DarkCyan ctermfg=DarkCyan
hi ColNumber16		gui=bold guibg=DarkRed ctermfg=DarkRed
hi ColNumber32	    gui=bold guibg=DarkMagenta ctermfg=DarkMagenta
hi ColNumber64		gui=bold guibg=Red ctermfg=Red
hi ColNumber128		gui=bold guibg=Blue ctermfg=Blue
hi ColNumber256		gui=bold guibg=Magenta ctermfg=Magenta
hi ColNumber512		gui=bold guibg=White ctermfg=White
hi ColNumber1024	gui=bold guibg=Green ctermfg=Green
hi ColNumber2048    gui=bold guibg=Yellow ctermfg=Yellow guifg=Black
" │ 2 │ 4 │ 8 │ 16 │ 32 │ 64 │ 256 │ 512 │ 1024 │ 2048 │
syn match NumberSplit '│'
syn match NumberSplit '╭'
syn match NumberSplit '─'
syn match NumberSplit '╰'
syn match NumberSplit '┬'
syn match NumberSplit '┴'
syn match NumberSplit '╮'
syn match NumberSplit '╯'
syn match NumberSplit '┼'
syn match NumberSplit '├'
syn match NumberSplit '┤'

hi link NumberSplit ColNumberSplit

syn match Number2 '\s\+2\s\+'
hi link Number2 ColNumber2

syn match Number4 '\s\+4\s\+'
hi link Number4 ColNumber4

syn match Number8 '\s\+8\s\+'
hi link Number8 ColNumber8

syn match Number16 '\s\+16\s\+'
hi link Number16 ColNumber16

syn match Number32 '\s\+32\s\+'
hi link Number32 ColNumber32

syn match Number64 '\s\+64\s\+'
hi link Number64 ColNumber64

syn match Number128 '\s\+128\s\+'
hi link Number128 ColNumber128

syn match Number256 '\s\+256\s\+'
hi link Number256 ColNumber256

syn match Number512 '\s\+512\s\+'
hi link Number512 ColNumber512

syn match Number1024 '\s\+1024\s\+'
hi link Number1024 ColNumber1024

syn match Number2048 '\s\+2048\s\+'
hi link Number2048 ColNumber2048
