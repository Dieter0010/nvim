nnoremap @s i#!/data/data/com.termux/files/usr/bin/bash<esc><CR>

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif
:augroup END

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-i>'
let g:multi_cursor_select_all_word_key = '<A-i>'
let g:multi_cursor_start_key           = 'g<C-i>'
let g:multi_cursor_select_all_key      = 'g<A-i>'
let g:multi_cursor_next_key            = 'n'
let g:multi_cursor_prev_key            = 'N'
"let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key			   = '<Esc>'
