let vimsettings = '~/.vim/settings'
let uname = system("uname -s")

for fpath in split(globpath(vimsettings, '*.vim'), '\n')

"  if uname[:4] ==? "linux"
"    continue " skip mac mappings for linux
"  endif

"  if uname[:4] !=? "linux"
"    continue " skip linux mappings for mac
"  endif

  exe 'source' fpath
endfor
