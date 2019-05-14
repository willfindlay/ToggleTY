" *************************************************
" Plugin:  ToggleTY
" Version: 0.1.1
" Author:  William Findlay <william@wfindlay.com>
" License: MIT
" *************************************************

" This file is for function definitions and plugin logic.
" For keybindings, check out plugin/ToggleTY.vim

" User Defined Settings {{{

" height of terminal window
if !exists('g:ToggleTY_height')
    let g:ToggleTY_height = 15
endif

" placement of terminal window
if !exists('g:ToggleTY_position')
    let g:ToggleTY_position = 'bot'
else
    " correct bottom to bot
    if g:ToggleTY_position =~? 'bottom'
        let g:ToggleTY_position = 'bot'
    endif
endif

" }}}

" Function Definitions {{{

" toggle the terminal window
function! ToggleTY#ToggleTerminal() abort
    " buf number and winnr of __Terminal__
    let term_winnr = bufwinnr('__Terminal__')
    let term_bufnr = bufnr('__Terminal__')
    if term_bufnr == -1
        " open the terminal
        let s:prev_winnr = winnr()
        execute g:ToggleTY_position . ' ' . g:ToggleTY_height . ' new'
        execute 'term'
        file __Terminal__
        setlocal bufhidden=hide
        setlocal nobuflisted
        setlocal foldcolumn=0
        setlocal nofoldenable
        setlocal nonumber
        setlocal noswapfile
        setlocal winfixheight
        setlocal winfixwidth
        startinsert
    else
        if term_winnr != -1
            " close the terminal
            execute term_winnr . 'close'
            execute s:prev_winnr . 'wincmd w'
        else
            echo winnr()
            let s:prev_winnr = winnr()
            execute g:ToggleTY_position . ' ' . g:ToggleTY_height . ' split' . ' +buffer' . term_bufnr
            startinsert
        endif
    endif
endfunction

" }}}
