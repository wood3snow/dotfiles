let g:unite_enable_start_insert = 0
let g:unite_enable_split_vertically = 0
let g:unite_winwidth = 40


nmap                 ,u          [unite]

nnoremap <silent>    [unite]u    :<C-u>Unite
nnoremap <silent>    [unite]b    :<C-u>Unite buffer<CR>
nnoremap <silent>    [unite]f    :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>


nnoremap <silent>    [unite]m    :<C-u>Unite file_mru<CR>