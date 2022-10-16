if exists("g:loaded_nvcs")
    finish
endif
let g:loaded_nvcs = 1

command! -nargs=1 NVCSSwitch lua require("nvcs").switch(<f-args>)
command! -nargs=0 NVCSList lua require("nvcs").list()
