" *************************************************
" Plugin:  ToggleTY
" Author:  William Findlay <william@wfindlay.com>
" License: MIT
" *************************************************

" This file is for keybindings.
" For function definitions and plugin logic, check out autoload/ToggleTY.vim

" User Defined Mappings and Defaults {{{

" global toggle mapping
if !exists('g:ToggleTY_toggle_button')
    let g:ToggleTY_toggle_button = '<C-B>'
endif
" specific to normal mode
if !exists('g:ToggleTY_toggle_button_normal')
    let g:ToggleTY_toggle_button_normal = g:ToggleTY_toggle_button
endif
" specific to visual mode
if !exists('g:ToggleTY_toggle_button_visual')
    let g:ToggleTY_toggle_button_visual = g:ToggleTY_toggle_button
endif
" specific to terminal mode
if !exists('g:ToggleTY_toggle_button_terminal')
    let g:ToggleTY_toggle_button_terminal = g:ToggleTY_toggle_button
endif
" specific to insert mode
if !exists('g:ToggleTY_toggle_button_insert')
    let g:ToggleTY_toggle_button_insert = g:ToggleTY_toggle_button
endif

" }}}

" Map Keybindings From Above Section {{{

"
command! ToggleTerminal call ToggleTY#ToggleTerminal()
execute "nnoremap" g:ToggleTY_toggle_button_normal   ":ToggleTerminal<CR>"
execute "vnoremap" g:ToggleTY_toggle_button_visual   ":ToggleTerminal<CR>"
execute "tnoremap" g:ToggleTY_toggle_button_terminal "<C-\\><C-N>:ToggleTerminal<CR>"
execute "inoremap" g:ToggleTY_toggle_button_insert   "<C-O>:ToggleTerminal<CR>"

" }}}
