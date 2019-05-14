" *************************************************
" Plugin:  ToggleTY
" Version: 0.1.1
" Author:  William Findlay <william@wfindlay.com>
" License: MIT
" *************************************************

" This file is for keybindings.
" For function definitions and plugin logic, check out autoload/ToggleTY.vim

" User Defined Mappings and Defaults {{{

" Terminal Toggle Mapping {{{

" global
if !exists('g:ToggleTY_toggle_mapping')
    let g:ToggleTY_toggle_mapping = '<C-B>'
endif

" specific to normal mode
if !exists('g:ToggleTY_toggle_mapping_normal')
    let g:ToggleTY_toggle_mapping_normal = g:ToggleTY_toggle_mapping
endif

" specific to terminal mode
if !exists('g:ToggleTY_toggle_mapping_terminal')
    let g:ToggleTY_toggle_mapping_terminal = g:ToggleTY_toggle_mapping
endif

" specific to insert mode
if !exists('g:ToggleTY_toggle_mapping_insert')
    let g:ToggleTY_toggle_mapping_insert = g:ToggleTY_toggle_mapping
endif
" }}}

" }}}

" Map Keybindings From Above Section {{{

" Terminal Toggle Mapping {{{
command! ToggleTerminal call ToggleTY#ToggleTerminal()
execute "nnoremap" g:ToggleTY_toggle_mapping_normal   ":ToggleTerminal<CR>"
execute "tnoremap" g:ToggleTY_toggle_mapping_terminal "<C-\\><C-N>:ToggleTerminal<CR>"
execute "inoremap" g:ToggleTY_toggle_mapping_insert   "<C-O>:ToggleTerminal<CR>"
" }}}

" }}}
