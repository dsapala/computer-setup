let g:syntastic_go_checkers = 'gofmt'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" augroup AutoSyntastic
"   autocmd!
"   autocmd BufWritePost *.c,*.cpp call s:syntastic()
" augroup END
" function! s:syntastic()
"   SyntasticCheck
"   call lightline#update()
" endfunction

" let g:syntastic_c_compiler_options = '-std=gnu11'
" let g:syntastic_cpp_compiler_options = '-std=gnu++11'
let g:syntastic_c_compiler_options = '-std=gnu99'
let g:syntastic_cpp_compiler_options = '-std=gnu++98'
" let g:syntastic_c_include_dirs = ['/Users/dsapala/nacl/nacl_sdk/pepper_49/include', '/usr/local/Cellar/emscripten/1.36.5/libexec/system/include/libc', '/usr/local/Cellar/emscripten/1.36.5/libexec/system/include/emscripten']
" let g:syntastic_cpp_include_dirs = ['/Users/dsapala/nacl/nacl_sdk/pepper_49/include', '/usr/local/Cellar/emscripten/1.36.5/libexec/system/include/libcxx', '/usr/local/Cellar/emscripten/1.36.5/libexec/system/include/emscripten']
" let g:syntastic_c_include_dirs = ['/usr/local/Cellar/emscripten/1.36.5/libexec/system/include/libc', '/usr/local/Cellar/emscripten/1.36.5/libexec/system/include/emscripten']
" let g:syntastic_cpp_include_dirs = ['/usr/local/Cellar/emscripten/1.36.5/libexec/system/include/libcxx', '/usr/local/Cellar/emscripten/1.36.5/libexec/system/include/emscripten']
" let g:syntastic_c_include_dirs = ['/Users/dsapala/nacl/nacl_sdk/pepper_49/include']
" let g:syntastic_cpp_include_dirs = ['/Users/dsapala/nacl/nacl_sdk/pepper_49/include']

