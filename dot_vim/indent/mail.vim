"  vim: set sw=4 sts=4:
"  Maintainer   : James Kelly <james@hicag.org>
"  URL          : Coming Soon
"  Revised on   :
"  Language     : mail and news

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal indentexpr=GetEmailIndent()

" Only define the function once.
if exists("*GetEmailIndent")
    finish
endif

function GetEmailIndent()
    " Up on line
    let lnum = v:lnum - 1

    " If we are on a quoted line (ie moving a citation down a few lines)
    " leave things are they are.
    if getline(v:lnum) =~ '^>'
        return indent(v:lnum)
    endif

    " We need a blank line above the current line.
    " If we don't have that shiznit keep the current indent (of dewm).
    if getline(lnum) !~ '^\s*$'
        return indent(v:lnum)
    endif

    " Seek to prev non blank line
    let lnum = prevnonblank(v:lnum - 1)

    " Hit the start of the file, use zero indent.
    if lnum == 0
        return 0
    endif

    " If it's a citation indent
    let ind  = indent(v:lnum)
    let line = getline(lnum)
    if line =~ '^>'
        " let ind = ind + &sw
        let ind = &sw
    endif

    return ind
endfunction
