function! tabline#activate() abort
    let l:tabs = []
    for l:i in range(1, tabpagenr('$'))
        let l:buf = tabpagebuflist(l:i)[tabpagewinnr(l:i) - 1]
        let l:name = fnamemodify(bufname(l:buf), ':t')
        if empty(l:name)
            let l:name = '[No Name]'
        endif
        let l:sel = (l:i == tabpagenr()) ? '%#TabLineSel#' : '%#TabLine#'
        let l:modified = getbufvar(l:buf, '&modified') ? ' [+d]' : ''
        let l:tabs += [printf('%s%%%dT %s%s %d ', l:sel, l:i, l:name, l:modified, l:i)]
    endfor
    return join(l:tabs, '') . '%#TabLineFill#%T'
endfunction
