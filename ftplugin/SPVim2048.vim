if exists('g:_SPVim2048_ftplugin')
  finish
else
  let g:_SPVim2048_ftplugin = 1
endif
function! SPVim2048#statusline(...)
    if &ft ==# 'SPVim2048'
        call airline#extensions#apply_left_override('Vim2048', '')
        " Alternatively, set the various w:airline_section variables
        "let w:airline_section_a = 'SpaceVimPluginManager'
        "let w:airline_section_b = ''
        "let w:airline_section_c = ''
        "let w:airline_render_left = 1
        "let w:airline_render_right = 0
    endif
endfunction
try
    call airline#add_statusline_func('SPVim2048#statusline')
catch
endtry
