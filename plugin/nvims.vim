if exists("g:loaded_nvims")
    finish
endif
let g:loaded_nvims = 1

command! -nargs=1 NVSCSwitch lua require("nvims-plugin").switch(<f-args>)
command! -nargs=0 NVSList lua require("nvims-plugin").list()
