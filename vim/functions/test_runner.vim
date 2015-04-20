function! s:runTests()
    exec ":!bin/mtest ".@%
endfunction
command! RunTests :call s:runTests()
nmap <leader>t :RunTests<cr>

function! s:runNearestTest()
    let spec_line_number = line('.')
    exec ":!bin/mtest " . @% . ":" . spec_line_number
endfunction
command! RunNearestTest :call s:runNearestTest()
nmap <leader>n :RunNearestTest<cr>

function! s:runRuby()
    exec ":!ruby ".@%
endfunction
command! RunRuby :call s:runRuby()
nmap <leader>r :RunRuby<cr>
