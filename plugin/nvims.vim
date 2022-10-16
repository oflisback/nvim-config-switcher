if exists("g:loaded_nvimcs")
    finish
endif
let g:loaded_nvimcs = 1

command! -nargs=1 NVSCSwitch lua require("nvimcs-plugin").switch(<f-args>)
command! -nargs=0 NVSList lua require("nvimcs-plugin").list()
