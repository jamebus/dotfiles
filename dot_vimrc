"
" ~/.vimrc -- VIM runtime configuration
"

set autoindent		" always set autoindenting on
set ruler		" show the cursor position all the time
set ls=2		" turn status bar on always
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
	filetype plugin on
endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
	filetype indent on
endif

" A more awesome status line™
if has('statusline')
	" Status line detail: (from Rafael Garcia-Suarez)
	" %f		file path
	" %y		file type between braces (if defined)
	" %([%R%M]%)	read-only, modified and modifiable flags between braces
	" %{'!'[&ff=='default_file_format']}
	"		shows a '!' if the file format is not the platform
	"		default
	" %{'$'[!&list]} shows a '*' if in list mode
	" %{'~'[&pm=='']} shows a '~' if in patchmode
	" (%{synIDattr(synID(line('.'),col('.'),0),'name')})
	"		only for debug : display the current syntax item name
	" %=		right-align following items
	" #%n		buffer number
	" %l/%L,%c%V	line number, total number of lines, and column number
	function SetStatusLineStyle()
		if &stl == '' || &stl =~ 'synID'
			let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%{'~'[&pm=='']}%=#%n %l/%L,%c%V "
		else
			let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})%=#%n %l/%L,%c%V "
		endif
	endfunc
	call SetStatusLineStyle()

	if has('title')
		set titlestring=%t%(\ [%R%M]%)
	endif

	if &t_Co > 2 || has("gui_running")
		highlight StatusLine	ctermfg=White ctermbg=DarkBlue cterm=bold guifg=White guibg=DarkBlue gui=bold
		highlight StatusLineNC	ctermfg=White ctermbg=DarkBlue cterm=NONE guifg=White guibg=DarkBlue gui=NONE
	endif
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

au Syntax html  setlocal ts=3 sw=3
au Syntax xhtml setlocal ts=3 sw=3
au Syntax wml   setlocal ts=3 sw=3
"au Syntax perl setlocal ts=3 sw=3
au Syntax xml   setlocal ts=3 sw=3
au Syntax xslt  setlocal ts=3 sw=3
au Syntax css   setlocal ts=3 sw=3
"au Syntax sh   setlocal ts=3 sw=3
au Syntax ruby  setlocal ts=2 sw=2
au Syntax vim   setlocal ts=2 sw=2 et sta
au Syntax javascript setlocal ts=3 sw=3

set modeline

" Lets me use one period after punctuation.
set nojs

if has("gui_running")
	setlocal spell spelllang=en_us
endif

"colorscheme tango

augroup filetype
	au BufRead */itsalltext/*.backpackit.com.* call Syn_backpack()
	au BufRead */itsalltext/mail.google.com.* call Syn_ticket()

	au BufRead /tmp/editserver.*.backpackit.com.* call Syn_backpack()
	au BufRead /tmp/editserver.mail.google.com.* call Syn_ticket()

	au BufRead /tmp/EditSession-*.backpackit.com-* call Syn_backpack()
	au BufRead /tmp/EditSession-mail.google.com-* call Syn_ticket()

	au BufRead README setlocal tw=75 sw=5 ts=5 et nojs
augroup END

function Syn_story()
	set ts=3 et tw=70
	so $VIMRUNTIME/syntax/html.vim
endfunction
au Syntax story call Syn_story()
map <F4> :set ft=story<CR>

function Syn_ticket()
	setlocal ts=4 sw=4 sts=4 et tw=70 ft=mail
endfunction
au Syntax ticket call Syn_ticket()

" Incomplete
function Syn_backpack()
	setlocal ts=4 sw=4 sts=4 et tw=0 lbr
	so $VIMRUNTIME/syntax/mail.vim
	so $VIMRUNTIME/syntax/html.vim
endfunction
au Syntax backpack call Syn_backpack()

set lcs=tab:>-,trail:-,eol:$

map ,h :new<CR>:edit $MYVIM/help.txt<CR>:set readonly<CR>
"map <F3> :so $MYVIM/engspchk.vim<CR>

so $MYVIM/uri-ref-20061101.vim

" === Mail and News ===

" ,ks = kill quoted sig (to remove those damn sigs for replies)
map ,ks G?^> *-- $<CR>d/^-- $<CR>

" ,kpq kill power quote
map ,kpq :%s/^> *[a-zA-Z]*>/> >/<C-M>

" Fix various other quote characters:
" ,fq = fix quoting
map ,fq :%s/^> *\([-":}\|*][ <C-I>]\)/> > /

" ,kts = kill to singnature (kills all quoted lines in the rest of the file
map ,kts :.,/^-- /g/^>/ d<CR>

" ,kdq = kill double quoted text
map ,kdq :.,/^-- /g/^> >/ d<CR>

" ,cs = change subject line
map ,cs 1G/^Subject: /e<CR>a(Was: <ESC>A)<ESC>%i

" ,at = Insert "Attach: " header for mutt
map ,at 1G/^$<CR>OAttach:<SP>
