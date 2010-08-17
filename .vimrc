" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
" 	Derek Odegard's .vimrc file!!!
"
" 	Based on Steve Francia's .vimrc [http://spf13.com]
" }

" Setup Bundle Support {
" The next two lines ensure that the ~/.vim/bundle/ system works
	runtime! autoload/pathogen.vim
	silent! call pathogen#runtime_append_all_bundles()
" }

" Basics {
	set nocompatible 		" must be first line
" }
 
" General {
	filetype plugin indent on  	" Automatically detect file types.
	set foldmethod=marker
	set vb                      " visual bell
	syntax on 					" syntax highlighting
	set mouse=a					" automatically enable mouse usage
	"set autochdir 				" always switch to the current file directory.. 
	" not every vim is compiled with this, use the following line instead
     "autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
	scriptencoding utf-8
	set autowrite
	set diffopt=filler,iwhite
	set shortmess+=filmnrxoOtT     	" abbrev. of messages (avoids 'hit enter')
	" set spell 		 	     	" spell checking on
	let mapleader=','
	set wildignore=*.o,*.obj,**/cache/**
	
	
	" Setting up the directories {
		set backup 						" backups are nice ...
		set backupdir=$HOME/.vimbackup  " but not when they clog .
		set directory=$HOME/.vimswap 	" Same for swap files
		set viewdir=$HOME/.vimviews 	" same but for view files
		
		" Creating directories if they don't exist
		silent execute '!mkdir -p $HOME/.vimbackup'
		silent execute '!mkdir -p $HOME/.vimswap'
		silent execute '!mkdir -p $HOME/.vimviews'
		au BufWinLeave * silent! mkview  "make vim save view (state) (folds, cursor, etc)
		au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)
	" }
" }

" Vim UI {
	colorscheme buttercream
	set tabpagemax=15 				" only show 15 tabs
	set showmode                   	" display the current mode

	set cursorline  				" highlight current line
	hi cursorline guibg=#333333 	" highlight bg color of current line
	hi CursorColumn guibg=#333333   " highlight cursor

	if has('cmdline_info')
		set ruler                  	" show the ruler
		"set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) a ruler on steroids
		set rulerformat=%33([col:\ %02v]\ \ line:\ \(%l\/%L\)%=%P%)
		set showcmd                	" show partial commands in status line and
									" selected characters/lines in visual mode
	endif

	if has('statusline')
		"set laststatus=1           	 show statusline only if there are > 1 windows
		set laststatus=2
		" Use the commented line if fugitive isn't installed
		"set statusline=%<%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P " a statusline, also on steroids
		set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
	endif

	set noea                        " don't make windows equal size
	set backspace=indent,eol,start 	" backspace for dummys
	set linespace=0 				" No extra spaces between rows
	set nu 							" Line numbers on
	set showmatch                  	" show matching brackets/parenthesis
	set incsearch 					" find as you type search
	set hlsearch 					" highlight search terms
	set winminheight=0 				" windows can be 0 line high 
	set ignorecase 					" case insensitive search
	set smartcase 					" case sensitive when uc present
	set wildmenu 					" show list instead of just completing
	set wildmode=list:longest,full 	" command <Tab> completion, list matches, then longest common part, then all.
	set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap to
	set scrolljump=5 				" lines to scroll when cursor leaves screen
	set scrolloff=3 				" minimum lines to keep above and below cursor
	set foldenable  				" auto fold code
	set gdefault					" the /g flag on :s substitutions by default

" }

" Formatting {
	set nowrap                     	" wrap long lines
	set autoindent                 	" indent at the same level of the previous line
	set shiftwidth=4               	" use indents of 4 spaces
	set noexpandtab 	       		" tabs are tabs, not spaces
	set tabstop=4 					" an indentation every four columns
	set matchpairs+=<:>            	" match, to be used with % 
	set pastetoggle=<F12>          	" pastetoggle (sane indentation on pastes)
	"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
" }

" File Types {

augroup filetypedetect
	au! BufRead,BufNewFile *.twig		setfiletype htmljinja
	au! BufRead,BufNewFile *.less		setfiletype css
augroup END

" }

" Key Mappings {

	" Easier moving in tabs and windows
	map <C-J> <C-W>j<C-W>_
	map <C-K> <C-W>k<C-W>_
	map <C-H> <C-W>h<C-W>_
	map <C-H> gT
	map <C-L> gt

	" Stupid shift key fixes
	map:W :w 						
	map:WQ :wq
	map:wQ :wq
	map:Q :q

	" Yank from the cursor to the end of the line, to be consistent with C and D.
	nnoremap Y y$

	" Shortcuts
	" Change Working Directory to that of the current file
    cmap cwd lcd %:p:h

	nnoremap ' `
	nnoremap ` '

	"command-t file finder
	nmap <silent> <Leader>f :CommandT<CR>
	map <silent> <Leader>t :TlistToggle<CR>
	map <silent> <Leader>n :NERDTreeToggle<CR>
	
" }

" Plugins {

	" AutoCloseTag {
		" Make it so AutoCloseTag works for xml and xhtml files as well
		au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
	" }

	" PIV {
		let g:DisableAutoPHPFolding = 0
	" }
	
	" Supertab {
		"let g:SuperTabDefaultCompletionType = "context"
		let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
	" }

	" ShowMarks {
		let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
		" Don't leave on by default, use :ShowMarksOn to enable
		let g:showmarks_enable = 0
		" For marks a-z
		highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
		" For marks A-Z
		highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
		" For all other marks
		highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
		" For multiple marks on the same line.
		highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen
	" }
	
	" Ctags {
		let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
	" }

	" Misc { 
		"let g:checksyntax_auto = 0

		"comment out line(s) in visual mode
		"vmap o :call NERDComment(1, 'toggle')<CR>

		let g:NERDShutUp=1
		let b:match_ignorecase = 1
	" }

" }

" GUI Settings {
	if has('gui_running')
		set guioptions-=T          	" remove the toolbar
		set guioptions-=m
		set lines=300 columns=300
		winpos 0 0
		colorscheme jhlight
		set mousehide
		set guicursor=a:blinkwait60000-blinkon600-blinkoff300
	endif
" }

" Windows Compatible {
	" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
	" across (heterogeneous) systems easier. 
	if has('win32') || has('win64')
	  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
	endif
" }

cd ~/apps/www
