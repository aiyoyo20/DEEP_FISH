### 英文原版：
|option|abbreviation|Short explanation|
|---|---|---|
|'aleph'          | 'al'      |ASCII code of the letter Aleph (Hebrew)|
|'allowrevins'    | 'ari'     |allow CTRL-_ in Insert and Command-line mode|
|'altkeymap'      | 'akm'     |for default second language (Farsi/Hebrew)|
|'ambiwidth'      | 'ambw'    |what to do with Unicode chars of ambiguous width|
|'antialias'      | 'anti'    |Mac OS X: use smooth, antialiased fonts|
|'autochdir'      | 'acd'     |change directory to the file in the current window|
|'arabic'         | 'arab'    |for Arabic as a default second language|
|'arabicshape'    | 'arshape' |do shaping for Arabic characters|
|'autoindent'     | 'ai'      |take indent for new line from previous line|
|'autoread'       | 'ar'      |autom. read file when changed outside of Vim|
|'autowrite'      | 'aw'      |automatically write file if changed|
|'autowriteall'   | 'awa'     |as 'autowrite', but works with more commands|
|'background'     | 'bg'      |"dark" or "light", used for highlight colors|
|'backspace'      | 'bs'      |how backspace works at start of line|
|'backup'         | 'bk'      |keep backup file after overwriting a file|
|'backupcopy'     | 'bkc'     |make backup as a copy, don't rename the file|
|'backupdir'      | 'bdir'    |list of directories for the backup file|
|'backupext'      | 'bex'     |extension used for the backup file|
|'backupskip'     | 'bsk'     |no backup for files that match these patterns|
|'balloondelay'   | 'bdlay'   |delay in mS before a balloon may pop up|
|'ballooneval'    | 'beval'   |switch on balloon evaluation|
|'balloonexpr'    | 'bexpr'   |expression to show in balloon|
|'binary'         | 'bin'     |read/write/edit file in binary mode|
|'bioskey'        | 'biosk'   |MS-DOS: use bios calls for input characters|
|'bomb'           |           |prepend a Byte Order Mark to the file|
|'breakat'        | 'brk'     |characters that may cause a line break|
|'browsedir'      | 'bsdir'   |which directory to start browsing in|
|'bufhidden'      | 'bh'      |what to do when buffer is no longer in window|
|'buflisted'      | 'bl'      |whether the buffer shows up in the buffer list|
|'buftype'        | 'bt'      |special type of buffer|
|'casemap'        | 'cmp'     |specifies how case of letters is changed|
|'cdpath'         | 'cd'      |list of directories searched with ":cd"|
|'cedit'          |           |key used to open the command-line window|
|'charconvert'    | 'ccv'     |expression for character encoding conversion|
|'cindent'        | 'cin'     |do C program indenting|
|'cinkeys'        | 'cink'    |keys that trigger indent when 'cindent' is set|
|'cinoptions'     | 'cino'    |how to do indenting when 'cindent' is set|
|'cinwords'       | 'cinw'    |words where 'si' and 'cin' add an indent|
|'clipboard'      | 'cb'      |use the clipboard as the unnamed register|
|'cmdheight'      | 'ch'      |number of lines to use for the command-line|
|'cmdwinheight'   | 'cwh'     |height of the command-line window|
|'colorcolumn'    | 'cc'      |columns to highlight|
|'columns'        | 'co'      |number of columns in the display|
|'comments'       | 'com'     |patterns that can start a comment line|
|'commentstring'  | 'cms'     |template for comments; used for fold marker|
|'compatible'     | 'cp'      |behave Vi-compatible as much as possible|
|'complete'       | 'cpt'     |specify how Insert mode completion works|
|'completefunc'   | 'cfu'     |function to be used for Insert mode completion|
|'completeopt'    | 'cot'     |options for Insert mode completion|
|'concealcursor'  | 'cocu'    |whether concealable text is hidden in cursor line|
|'conceallevel'   | 'cole'    |whether concealable text is shown or hidden |
|'confirm'        | 'cf'      |ask what to do about unsaved/read-only files|
|'conskey'        | 'consk'   |get keys directly from console (MS-DOS only)|
|'copyindent'     | 'ci'      |make 'autoindent' use existing indent structure|
|'cpoptions'      | 'cpo'     |flags for Vi-compatible behavior|
|'cryptmethod'    | 'cm'      |type of encryption to use for file writing|
|'cscopepathcomp' | 'cspc'    |how many components of the path to show|
|'cscopeprg'      | 'csprg'   |command to execute cscope|
|'cscopequickfix' | 'csqf'    |use quickfix window for cscope results|
|'cscopetag'      | 'cst'     |use cscope for tag commands|
|'cscopetagorder' | 'csto'    |determines ":cstag" search order|
|'cscopeverbose'  | 'csverb'  |give messages when adding a cscope database|
|'cursorbind'     | 'crb'     |move cursor in window as it moves in other windows|
|'cursorcolumn'   | 'cuc'     |highlight the screen column of the cursor|
|'cursorline'     | 'cul'     |highlight the screen line of the cursor|
|'debug'          |           |set to "msg" to see all error messages|
|'define'         | 'def'     |pattern to be used to find a macro definition|
|'delcombine'     | 'deco'    |delete combining characters on their own|
|'dictionary'     | 'dict'    |list of file names used for keyword completion|
|'diff'           |           |use diff mode for the current window|
|'diffexpr'       | 'dex'     |expression used to obtain a diff file|
|'diffopt'        | 'dip'     |options for using diff mode|
|'digraph'        | 'dg'      |enable the entering of digraphs in Insert mode|
|'directory'      | 'dir'     |list of directory names for the swap file|
|'display'        | 'dy'      |list of flags for how to display text|
|'eadirection'    | 'ead'     |in which direction 'equalalways' works|
|'edcompatible'   | 'ed'      |toggle flags of ":substitute" command|
|'encoding'       | 'enc'     |encoding used internally|
|'endofline'      | 'eol'     |write <EOL> for last line in file|
|'equalalways'    | 'ea'      |windows are automatically made the same size|
|'equalprg'       | 'ep'      |external program to use for "=" command|
|'errorbells'     | 'eb'      |ring the bell for error messages|
|'errorfile'      | 'ef'      |name of the errorfile for the QuickFix mode|
|'errorformat'    | 'efm'     |description of the lines in the error file|
|'esckeys'        | 'ek'      |recognize function keys in Insert mode|
|'eventignore'    | 'ei'      |autocommand events that are ignored|
|'expandtab'      | 'et'      |use spaces when <Tab> is inserted|
|'exrc'           | 'ex'      |read .vimrc and .exrc in the current directory|
|'fileencoding'   | 'fenc'    |file encoding for multi-byte text|
|'fileencodings'  | 'fencs'   |automatically detected character encodings|
|'fileformat'     | 'ff'      |file format used for file I/O|
|'fileformats'    | 'ffs'     |automatically detected values for 'fileformat'|
|'filetype'       | 'ft'      |type of file, used for autocommands|
|'fillchars'      | 'fcs'     |characters to use for displaying special items|
|'fkmap'          | 'fk'      |Farsi keyboard mapping|
|'foldclose'      | 'fcl'     |close a fold when the cursor leaves it|
|'foldcolumn'     | 'fdc'     |width of the column used to indicate folds|
|'foldenable'     | 'fen'     |set to display all folds open|
|'foldexpr'       | 'fde'     |expression used when 'foldmethod' is "expr"|
|'foldignore'     | 'fdi'     |ignore lines when 'foldmethod' is "indent"|
|'foldlevel'      | 'fdl'     |close folds with a level higher than this|
|'foldlevelstart' | 'fdls'    |'foldlevel' when starting to edit a file|
|'foldmarker'     | 'fmr'     |markers used when 'foldmethod' is "marker"|
|'foldmethod'     | 'fdm'     |folding type|
|'foldminlines'   | 'fml'     |minimum number of lines for a fold to be closed|
|'foldnestmax'    | 'fdn'     |maximum fold depth|
|'foldopen'       | 'fdo'     |for which commands a fold will be opened|
|'foldtext'       | 'fdt'     |expression used to display for a closed fold|
|'formatlistpat'  | 'flp'     |pattern used to recognize a list header|
|'formatoptions'  | 'fo'      |how automatic formatting is to be done|
|'formatprg'      | 'fp'      |name of external program used with "gq" command|
|'formatexpr'     | 'fex'     |expression used with "gq" command|
|'fsync'          | 'fs'      |whether to invoke fsync() after file write|
|'gdefault'       | 'gd'      |the ":substitute" flag 'g' is default on|
|'grepformat'     | 'gfm'     |format of 'grepprg' output|
|'grepprg'        | 'gp'      |program to use for ":grep"|
|'guicursor'      | 'gcr'     |GUI: settings for cursor shape and blinking|
|'guifont'        | 'gfn'     |GUI: Name(s) of font(s) to be used|
|'guifontset'     | 'gfs'     |GUI: Names of multi-byte fonts to be used|
|'guifontwide'    | 'gfw'     |list of font names for double-wide characters|
|'guiheadroom'    | 'ghr'     |GUI: pixels room for window decorations|
|'guioptions'     | 'go'      |GUI: Which components and options are used|
|'guipty'         |           |GUI: try to use a pseudo-tty for ":!" commands|
|'guitablabel'    | 'gtl'     |GUI: custom label for a tab page|
|'guitabtooltip'  | 'gtt'     |GUI: custom tooltip for a tab page|
|'helpfile'       | 'hf'      |full path name of the main help file|
|'helpheight'     | 'hh'      |minimum height of a new help window|
|'helplang'       | 'hlg'     |preferred help languages|
|'hidden'         | 'hid'     |don't unload buffer when it is YXXYabandon|ed|
|'highlight'      | 'hl'      |sets highlighting mode for various occasions|
|'hlsearch'       | 'hls'     |highlight matches with last search pattern|
|'history'        | 'hi'      |number of command-lines that are remembered|
|'hkmap'          | 'hk'      |Hebrew keyboard mapping|
|'hkmapp'         | 'hkp'     |phonetic Hebrew keyboard mapping|
|'icon'           |           |let Vim set the text of the window icon|
|'iconstring'     |           |string to use for the Vim icon text|
|'ignorecase'     | 'ic'      |ignore case in search patterns|
|'imactivatekey'  | 'imak'    |key that activates the X input method|
|'imcmdline'      | 'imc'     |use IM when starting to edit a command line|
|'imdisable'      | 'imd'     |do not use the IM in any mode|
|'iminsert'       | 'imi'     |use :lmap or IM in Insert mode|
|'imsearch'       | 'ims'     |use :lmap or IM when typing a search pattern|
|'include'        | 'inc'     |pattern to be used to find an include file|
|'includeexpr'    | 'inex'    |expression used to process an include line|
|'incsearch'      | 'is'      |highlight match while typing search pattern|
|'indentexpr'     | 'inde'    |expression used to obtain the indent of a line|
|'indentkeys'     | 'indk'    |keys that trigger indenting with 'indentexpr'|
|'infercase'      | 'inf'     |adjust case of match for keyword completion|
|'insertmode'     | 'im'      |start the edit of a file in Insert mode|
|'isfname'        | 'isf'     |characters included in file names and pathnames|
|'isident'        | 'isi'     |characters included in identifiers|
|'iskeyword'      | 'isk'     |characters included in keywords|
|'isprint'        | 'isp'     |printable characters|
|'joinspaces'     | 'js'      |two spaces after a period with a join command|
|'key'            |           |encryption key|
|'keymap'         | 'kmp'     |name of a keyboard mapping|
|'keymodel'       | 'km'      |enable starting/stopping selection with keys|
|'keywordprg'     | 'kp'      |program to use for the "K" command|
|'langmap'        | 'lmap'    |alphabetic characters for other language mode|
|'langmenu'       | 'lm'      |language to be used for the menus|
|'laststatus'     | 'ls'      |tells when last window has status lines|
|'lazyredraw'     | 'lz'      |don't redraw while executing macros|
|'linebreak'      | 'lbr'     |wrap long lines at a blank|
|'lines'          |           |number of lines in the display|
|'linespace'      | 'lsp'     |number of pixel lines to use between characters|
|'lisp'           |           |automatic indenting for Lisp|
|'lispwords'      | 'lw'      |words that change how lisp indenting works|
|'list'           |           |show <Tab> and <EOL>|
|'listchars'      | 'lcs'     |characters for displaying in list mode|
|'loadplugins'    | 'lpl'     |load plugin scripts when starting up|
|'macatsui'       |           |Mac GUI: use ATSUI text drawing|
|'magic'          |           |changes special characters in search patterns|
|'makeef'         | 'mef'     |name of the errorfile for ":make"|
|'makeprg'        | 'mp'      |program to use for the ":make" command|
|'matchpairs'     | 'mps'     |pairs of characters that "%" can match|
|'matchtime'      | 'mat'     |tenths of a second to show matching paren|
|'maxcombine'     | 'mco'     |maximum nr of combining characters displayed|
|'maxfuncdepth'   | 'mfd'     |maximum recursive depth for user functions|
|'maxmapdepth'    | 'mmd'     |maximum recursive depth for mapping|
|'maxmem'         | 'mm'      |maximum memory (in Kbyte) used for one buffer|
|'maxmempattern'  | 'mmp'     |maximum memory (in Kbyte) used for pattern search|
|'maxmemtot'      | 'mmt'     |maximum memory (in Kbyte) used for all buffers|
|'menuitems'      | 'mis'     |maximum number of items in a menu|
|'mkspellmem'     | 'msm'     |memory used before \|:mkspell\| compresses the tree|
|'modeline'       | 'ml'      |recognize modelines at start or end of file|
|'modelines'      | 'mls'     |number of lines checked for modelines|
|'modifiable'     | 'ma'      |changes to the text are not possible|
|'modified'       | 'mod'     |buffer has been modified|
|'more'           |           |pause listings when the whole screen is filled|
|'mouse'          |           |enable the use of mouse clicks|
|'mousefocus'     | 'mousef'  |keyboard focus follows the mouse|
|'mousehide'      | 'mh'      |hide mouse pointer while typing|
|'mousemodel'     | 'mousem'  |changes meaning of mouse buttons|
|'mouseshape'     | 'mouses'  |shape of the mouse pointer in different modes|
|'mousetime'      | 'mouset'  |max time between mouse double-click|
|'mzquantum'      | 'mzq'     |the interval between polls for MzScheme threads|
|'nrformats'      | 'nf'      |number formats recognized for CTRL-A command|
|'number'         | 'nu'      |print the line number in front of each line|
|'numberwidth'    | 'nuw'     |number of columns used for the line number|
|'omnifunc'       | 'ofu'     |function for filetype-specific completion|
|'opendevice'     | 'odev'    |allow reading/writing devices on MS-Windows|
|'operatorfunc'   | 'opfunc'  |function to be called for |g@| operator|
|'osfiletype'     | 'oft'     |operating system-specific filetype information|
|'paragraphs'     | 'para'    |nroff macros that separate paragraphs|
|'paste'          |           |allow pasting text|
|'pastetoggle'    | 'pt'      |key code that causes 'paste' to toggle|
|'patchexpr'      | 'pex'     |expression used to patch a file|
|'patchmode'      | 'pm'      |keep the oldest version of a file|
|'path'           | 'pa'      |list of directories searched with "gf" et.al.|
|'preserveindent' | 'pi'      |preserve the indent structure when reindenting|
|'previewheight'  | 'pvh'     |height of the preview window|
|'previewwindow'  | 'pvw'     |identifies the preview window|
|'printdevice'    | 'pdev'    |name of the printer to be used for :hardcopy|
|'printencoding'  | 'penc'    |encoding to be used for printing|
|'printexpr'      | 'pexpr'   |expression used to print PostScript for :hardcopy|
|'printfont'      | 'pfn'     |name of the font to be used for :hardcopy|
|'printheader'    | 'pheader' |format of the header used for :hardcopy|
|'printmbcharset' | 'pmbcs'   |CJK character set to be used for :hardcopy|
|'printmbfont'    | 'pmbfn'   |font names to be used for CJK output of :hardcopy|
|'printoptions'   | 'popt'    |controls the format of :hardcopy output|
|'pumheight'      | 'ph'      |maximum height of the popup menu|
|'quoteescape'    | 'qe'      |escape characters used in a string|
|'readonly'       | 'ro'      |disallow writing the buffer|
|'redrawtime'     | 'rdt'     |timeout for 'hlsearch' and \|:match\| highlighting|
|'relativenumber' | 'rnu'     |show relative line number in front of each line|
|'remap'          |           |allow mappings to work recursively|
|'report'         |           |threshold for reporting nr. of lines changed|
|'restorescreen'  | 'rs'      |Win32: restore screen when exiting|
|'revins'         | 'ri'      |inserting characters will work backwards|
|'rightleft'      | 'rl'      |window is right-to-left oriented|
|'rightleftcmd'   | 'rlc'     |commands for which editing works right-to-left|
|'ruler'          | 'ru'      |show cursor line and column in the status line|
|'rulerformat'    | 'ruf'     |custom format for the ruler|
|'runtimepath'    | 'rtp'     |list of directories used for runtime files|
|'scroll'         | 'scr'     |lines to scroll with CTRL-U and CTRL-D|
|'scrollbind'     | 'scb'     |scroll in window as other windows scroll|
|'scrolljump'     | 'sj'      |minimum number of lines to scroll|
|'scrolloff'      | 'so'      |minimum nr. of lines above and below cursor|
|'scrollopt'      | 'sbo'     |how 'scrollbind' should behave|
|'sections'       | 'sect'    |nroff macros that separate sections|
|'secure'         |           |secure mode for reading .vimrc in current dir|
|'selection'      | 'sel'     |what type of selection to use|
|'selectmode'     | 'slm'     |when to use Select mode instead of Visual mode|
|'sessionoptions' | 'ssop'    |options for \|:mksession\||
|'shell'          | 'sh'      |name of shell to use for external commands|
|'shellcmdflag'   | 'shcf'    |flag to shell to execute one command|
|'shellpipe'      | 'sp'      |string to put output of ":make" in error file|
|'shellquote'     | 'shq'     |quote character(s) for around shell command|
|'shellredir'     | 'srr'     |string to put output of filter in a temp file|
|'shellslash'     | 'ssl'     |use forward slash for shell file names|
|'shelltemp'      | 'stmp'    |whether to use a temp file for shell commands|
|'shelltype'      | 'st'      |Amiga: influences how to use a shell|
|'shellxquote'    | 'sxq'     |like 'shellquote', but include redirection|
|'shiftround'     | 'sr'      |round indent to multiple of shiftwidth|
|'shiftwidth'     | 'sw'      |number of spaces to use for (auto)indent step|
|'shortmess'      | 'shm'     |list of flags, reduce length of messages|
|'shortname'      | 'sn'      |non-MS-DOS: Filenames assumed to be 8.3 chars|
|'showbreak'      | 'sbr'     |string to use at the start of wrapped lines|
|'showcmd'        | 'sc'      |show (partial) command in status line|
|'showfulltag'    | 'sft'     |show full tag pattern when completing tag|
|'showmatch'      | 'sm'      |briefly jump to matching bracket if insert one|
|'showmode'       | 'smd'     |message on status line to show current mode|
|'showtabline'    | 'stal'    |tells when the tab pages line is displayed|
|'sidescroll'     | 'ss'      |minimum number of columns to scroll horizontal|
|'sidescrolloff'  | 'siso'    |min. nr. of columns to left and right of cursor|
|'smartcase'      | 'scs'     |no ignore case when pattern has uppercase|
|'smartindent'    | 'si'      |smart autoindenting for C programs|
|'smarttab'       | 'sta'     |use 'shiftwidth' when inserting <Tab>|
|'softtabstop'    | 'sts'     |number of spaces that <Tab> uses while editing|
|'spell'          |           |enable spell checking|
|'spellcapcheck'  | 'spc'     |pattern to locate end of a sentence|
|'spellfile'      | 'spf'     |files where |zg| and |zw| store words|
|'spelllang'      | 'spl'     |language(s) to do spell checking for|
|'spellsuggest'   | 'sps'     |method(s) used to suggest spelling corrections|
|'splitbelow'     | 'sb'      |new window from split is below the current one|
|'splitright'     | 'spr'     |new window is put right of the current one|
|'startofline'    | 'sol'     |commands move cursor to first non-blank in line|
|'statusline'     | 'stl'     |custom format for the status line|
|'suffixes'       | 'su'      |suffixes that are ignored with multiple match|
|'suffixesadd'    | 'sua'     |suffixes added when searching for a file|
|'swapfile'       | 'swf'     |whether to use a swapfile for a buffer|
|'swapsync'       | 'sws'     |how to sync the swap file|
|'switchbuf'      | 'swb'     |sets behavior when switching to another buffer|
|'synmaxcol'      | 'smc'     |maximum column to find syntax items|
|'syntax'         | 'syn'     |syntax to be loaded for current buffer|
|'tabstop'        | 'ts'      |number of spaces that <Tab> in file uses|
|'tabline'        | 'tal'     |custom format for the console tab pages line|
|'tabpagemax'     | 'tpm'     |maximum number of tab pages for |-p| and "tab all"|
|'tagbsearch'     | 'tbs'     |use binary searching in tags files|
|'taglength'      | 'tl'      |number of significant characters for a tag|
|'tagrelative'    | 'tr'      |file names in tag file are relative|
|'tags'           | 'tag'     |list of file names used by the tag command|
|'tagstack'       | 'tgst'    |push tags onto the tag stack|
|'term'           |           |name of the terminal|
|'termbidi'       | 'tbidi'   |terminal takes care of bi-directionality|
|'termencoding'   | 'tenc'    |character encoding used by the terminal|
|'terse'          |           |shorten some messages|
|'textauto'       | 'ta'      |obsolete, use 'fileformats'|
|'textmode'       | 'tx'      |obsolete, use 'fileformat'|
|'textwidth'      | 'tw'      |maximum width of text that is being inserted|
|'thesaurus'      | 'tsr'     |list of thesaurus files for keyword completion|
|'tildeop'        | 'top'     |tilde command "~" behaves like an operator|
|'timeout'        | 'to'      |time out on mappings and key codes|
|'timeoutlen'     | 'tm'      |time out time in milliseconds|
|'title'          |           |let Vim set the title of the window|
|'titlelen'       |           |percentage of 'columns' used for window title|
|'titleold'       |           |old title, restored when exiting|
|'titlestring'    |           |string to use for the Vim window title|
|'toolbar'        | 'tb'      |GUI: which items to show in the toolbar|
|'toolbariconsize'| 'tbis'    |size of the toolbar icons (for GTK 2 only)|
|'ttimeout'       |           |time out on mappings|
|'ttimeoutlen'    | 'ttm'     |time out time for key codes in milliseconds|
|'ttybuiltin'     | 'tbi'     |use built-in termcap before external termcap|
|'ttyfast'        | 'tf'      |indicates a fast terminal connection|
|'ttymouse'       | 'ttym'    |type of mouse codes generated|
|'ttyscroll'      | 'tsl'     |maximum number of lines for a scroll|
|'ttytype'        | 'tty'     |alias for 'term'|
|'undodir'        | 'udir'    |where to store undo files|
|'undofile'       | 'udf'     |save undo information in a file|
|'undolevels'     | 'ul'      |maximum number of changes that can be undone|
|'undoreload'     | 'ur'      |max nr of lines to save for undo on a buffer reload|
|'updatecount'    | 'uc'      |after this many characters flush swap file|
|'updatetime'     | 'ut'      |after this many milliseconds flush swap file|
|'verbose'        | 'vbs'     |give informative messages|
|'verbosefile'    | 'vfile'   |file to write messages in|
|'viewdir'        | 'vdir'    |directory where to store files with :mkview|
|'viewoptions'    | 'vop'     |specifies what to save for :mkview|
|'viminfo'        | 'vi'      |use .viminfo file upon startup and exiting|
|'virtualedit'    | 've'      |when to use virtual editing|
|'visualbell'     | 'vb'      |use visual bell instead of beeping|
|'warn'           |           |warn for shell command when buffer was changed|
|'weirdinvert'    | 'wiv'     |for terminals that have weird inversion method|
|'whichwrap'      | 'ww'      |allow specified keys to cross line boundaries|
|'wildchar'       | 'wc'      |command-line character for wildcard expansion|
|'wildcharm'      | 'wcm'     |like 'wildchar' but also works when mapped|
|'wildignore'     | 'wig'     |files matching these patterns are not completed|
|'wildignorecase' | 'wic'     |ignore case when completing file names|
|'wildmenu'       | 'wmnu'    |use menu for command line completion|
|'wildmode'       | 'wim'     |mode for 'wildchar' command-line expansion|
|'wildoptions'    | 'wop'     |specifies how command line completion is done|
|'winaltkeys'     | 'wak'     |when the windows system handles ALT keys|
|'window'         | 'wi'      |nr of lines to scroll for CTRL-F and CTRL-B|
|'winheight'      | 'wh'      |minimum number of lines for the current window|
|'winfixheight'   | 'wfh'     |keep window height when opening/closing windows|
|'winfixwidth'    | 'wfw'     |keep window width when opening/closing windows|
|'winminheight'   | 'wmh'     |minimum number of lines for any window|
|'winminwidth'    | 'wmw'     |minimal number of columns for any window|
|'winwidth'       | 'wiw'     |minimal number of columns for current window|
|'wrap'           |           |long lines wrap and continue on the next line|
|'wrapmargin'     | 'wm'      |chars from the right where wrapping starts|
|'wrapscan'       | 'ws'      |searches wrap around the end of the file|
|'write'          |           |writing to a file is allowed|
|'writeany'       | 'wa'      |write to file with no need for "!" override|
|'writebackup'    | 'wb'      |make a backup before overwriting a file|
|'writedelay'     | 'wd'      |delay this many msec for each char (for debug)||||

### 翻译:

| 配置项名称        | 缩写词    | 简要说明                                                  |
| ---               | ---       | ---                                                       |
| 'aleph'           | 'al'      | Aleph 字母 (希伯来语) 的 ASCII 代码                       |
| 'allowrevins'     | 'ari'     | 允许插入和命令行模式的 CTRL-_                             |
| 'altkeymap'       | 'akm'     | 缺省的第二语言 (波斯语/希伯来语)                          |
| 'ambiwidth'       | 'ambw'    | 如何处理有多种宽度的 Unicode 字符                         |
| 'antialias'       | 'anti'    | Mac OS X: 用平滑反锯齿的字体                              |
| 'autochdir'       | 'acd'     | 根据当前窗口的文件切换目录                                |
| 'arabic'          | 'arab'    | 使用阿拉伯语为缺省的第二语言                              |
| 'arabicshape'     | 'arshape' | 阿拉伯语的字型重整                                        |
| 'autoindent'      | 'ai'      | 根据上一行决定新行的缩进                                  |
| 'autoread'        | 'ar'      | 有 Vim 之外的改动时自动重读文件                           |
| 'autowrite'       | 'aw'      | 有改动时自动写回文件                                      |
| 'autowriteall'    | 'awa'     | 类似于 'autowrite'，但适用于更多命令                      |
| 'background'      | 'bg'      | "dark" 或 "light"，用于色彩的高亮                         |
| 'backspace'       | 'bs'      | 在一行开头按退格键如何处理                                |
| 'backup'          | 'bk'      | 覆盖文件时保留备份文件                                    |
| 'backupcopy'      | 'bkc'     | 文件备份使用复制而不是换名                                |
| 'backupdir'       | 'bdir'    | 备份文件使用的目录列表                                    |
| 'backupext'       | 'bex'     | 备份文件使用的扩展名                                      |
| 'backupskip'      | 'bsk'     | 匹配这些模式的文件不予备份                                |
| 'balloondelay'    | 'bdlay'   | 弹出气泡之前的延迟 (以毫秒计)                             |
| 'ballooneval'     | 'beval'   | 打开气泡表达式求值功能                                    |
| 'balloonexpr'     | 'bexpr'   | 计算气泡显示内容的表达式                                  |
| 'belloff'         | 'bo'      | 关闭响铃                                                  |
| 'binary'          | 'bin'     | 二进制方式读/写/编辑文件                                  |
| 'bioskey'         | 'biosk'   | MS-DOS: 用 bios 调用取得字符输入                          |
| 'bomb'            |           | 文件头附加字节顺序标记 (Byte Order Mark)                  |
| 'breakat'         | 'brk'     | 可以在此断行的字符                                        |
| 'breakindent'     | 'bri'     | 换行时重复缩进                                            |
| 'breakindentopt'  | 'briopt'  | 用于'breakindent'的配置                                   |
| 'browsedir'       | 'bsdir'   | 开始浏览文件的目录                                        |
| 'bufhidden'       | 'bh'      | 缓冲区不再在窗口显示时的行为                              |
| 'buflisted'       | 'bl'      | 缓冲区是否显示在缓冲区列表中                              |
| 'buftype'         | 'bt'      | 缓冲区的特殊类型                                          |
| 'casemap'         | 'cmp'     | 指定字母大小写如何改变                                    |
| 'cdpath'          | 'cd'      | ":cd" 搜索的目录列表                                      |
| 'cedit'           |           | 打开命令行窗口的键                                        |
| 'charconvert'     | 'ccv'     | 完成字符编码转换的表达式                                  |
| 'cindent'         | 'cin'     | 实现 C 程序的缩进                                         |
| 'cinkeys'         | 'cink'    | 设置 'cindent' 时启动缩进的键                             |
| 'cinoptions'      | 'cino'    | 设置 'cindent' 时如何缩进                                 |
| 'cinwords'        | 'cinw'    | 'si' 和 'cin' 在这些词后加入额外的缩进                    |
| 'clipboard'       | 'cb'      | 使用剪贴板作为无名的寄存器                                |
| 'cmdheight'       | 'ch'      | 命令行使用的行数                                          |
| 'cmdwinheight'    | 'cwh'     | 命令行窗口的高度                                          |
| 'colorcolumn'     | 'cc'      | 高亮显示列                                                |
| 'columns'         | 'co'      | 显示屏幕的列数                                            |
| 'comments'        | 'com'     | 可以开始注释行的模式                                      |
| 'commentstring'   | 'cms'     | 注释的样板；用于折叠的标志                                |
| 'compatible'      | 'cp'      | 尽可能做到与 Vi 兼容                                      |
| 'complete'        | 'cpt'     | 指定插入模式的自动补全如何工作                            |
| 'completefunc'    | 'cfu'     | 插入模式补全使用的函数                                    |
| 'completeopt'     | 'cot'     | 插入模式补全使用的选项                                    |
| 'concealcursor'   | 'cocu'    | 是否隐藏光标所在行的文本的模式                            |
| 'conceallevel'    | 'cole'    | whether concealable text is shown or hidden               |
| 'confirm'         | 'cf'      | 询问如何处理未保存/只读的文件                             |
| 'conskey'         | 'consk'   | 直接从控制台读入键击 (只限于 MS-DOS)                      |
| 'copyindent'      | 'ci'      | 使得 'autoindent' 使用已有的缩进结构                      |
| 'cpoptions'       | 'cpo'     | 设定 Vi-兼容的行为                                        |
| 'cryptmethod'     | 'cm'      | 把缓冲区写入到文件时所用的加密方法                        |
| 'cscopepathcomp'  | 'cspc'    | 显示路径多少部分                                          |
| 'cscopeprg'       | 'csprg'   | 执行 cscope 的命令                                        |
| 'cscopequickfix'  | 'csqf'    | 用 quickfix 窗口得到 cscope 的结果                        |
| 'cscoperelative'  | 'csre'    | cscope.out 所在位置的目录名 (通常是项目的根目录) 用作前缀 |
| 'cscopetag'       | 'cst'     | 用 cscope 处理标签命令                                    |
| 'cscopetagorder'  | 'csto'    | 决定 ":cstag" 的搜索顺序                                  |
| 'cscopeverbose'   | 'csverb'  | 增加 cscope 数据库时给出消息                              |
| 'cursorbind'      | 'crb'     | 用于绑定多个窗口之间的光标，使其同步位置                  |
| 'cursorcolumn'    | 'cuc'     | 高亮光标所在屏幕列                                        |
| 'cursorline'      | 'cul'     | 高亮光标所在屏幕行                                        |
| 'debug'           |           | 设为 "msg" 可以看到所有的错误消息                         |
| 'define'          | 'def'     | 查找宏定义所使用的模式                                    |
| 'delcombine'      | 'deco'    | 在单独使用时删除组合用字符                                |
| 'dictionary'      | 'dict'    | 关键字自动补全所用的文件名                                |
| 'diff'            |           | 当前窗口使用 diff 模式                                    |
| 'diffexpr'        | 'dex'     | 得到 diff 文件所用的表达式                                |
| 'diffopt'         | 'dip'     | 使用 diff 模式的选项                                      |
| 'digraph'         | 'dg'      | 允许插入模式时输入二合字母                                |
| 'directory'       | 'dir'     | 交换文件所用的目录名列表                                  |
| 'display'         | 'dy'      | 如何显示文本的标志位列表                                  |
| 'eadirection'     | 'ead'     | 'equalalways' 工作的方向                                  |
| 'edcompatible'    | 'ed'      | 切换 ":substitute" 命令的标志位                           |
| 'encoding'        | 'enc'     | 内部使用的编码方式                                        |
| 'endofline'       | 'eol'     | 文件最后一行写入换行符                                    |
| 'equalalways'     | 'ea'      | 自动使所有窗口大小相同                                    |
| 'equalprg'        | 'ep'      | "=" 命令使用的外部命令                                    |
| 'errorbells'      | 'eb'      | 有错误信息时响铃                                          |
| 'errorfile'       | 'ef'      | QuickFix 模式的错误文件名                                 |
| 'errorformat'     | 'efm'     | 错误文件行格式的描述                                      |
| 'esckeys'         | 'ek'      | 插入模式下识别功能键                                      |
| 'eventignore'     | 'ei'      | 忽略的自动命令事件                                        |
| 'expandtab'       | 'et'      | 键入  时使用空格                                          |
| 'exrc'            | 'ex'      | 在当前目录里读入 .vimrc 和 .exrc                          |
| 'fileencoding'    | 'fenc'    | 多字节文本的文件编码                                      |
| 'fileencodings'   | 'fencs'   | 参与自动检测的字符编码                                    |
| 'fileformat'      | 'ff'      | 文件输入输出使用的格式                                    |
| 'fileformats'     | 'ffs'     | 参与自动检测的 'fileformat' 的格式                        |
| 'fileignorecase'  | 'fic'     | ignore case when using file names                         |
| 'filetype'        | 'ft'      | 自动命令使用的文件类型                                    |
| 'fillchars'       | 'fcs'     | 显示特殊项目所使用的字符                                  |
| 'fixendofline'    | 'fixeol'  | 确保文件以 <EOL>结尾                                      |
| 'fkmap'           | 'fk'      | 波斯键盘映射                                              |
| 'foldclose'       | 'fcl'     | 当光标离开时关闭折叠                                      |
| 'foldcolumn'      | 'fdc'     | 设定指示折叠的列宽度                                      |
| 'foldenable'      | 'fen'     | 设置为显示所用打开的折叠                                  |
| 'foldexpr'        | 'fde'     | 当 'foldmethod' 为 "expr" 时使用的表达式                  |
| 'foldignore'      | 'fdi'     | 当 'foldmethod' 为 "indent" 时忽略的行                    |
| 'foldlevel'       | 'fdl'     | 当折叠级别高于此值时关闭折叠                              |
| 'foldlevelstart'  | 'fdls'    | 开始编辑文件的 'foldlevel'                                |
| 'foldmarker'      | 'fmr'     | 当 'foldmethod' 为 "marker" 时的标志                      |
| 'foldmethod'      | 'fdm'     | 折叠的类型                                                |
| 'foldminlines'    | 'fml'     | 折叠关闭所需的最少行数                                    |
| 'foldnestmax'     | 'fdn'     | 最大折叠深度                                              |
| 'foldopen'        | 'fdo'     | 打开折叠所使用的命令                                      |
| 'foldtext'        | 'fdt'     | 显示关闭的折叠所用的表达式                                |
| 'formatexpr'      | 'fex'     | "gq" 命令使用的表达式                                     |
| 'formatlistpat'   | 'flp'     | 识别列表头部的模式                                        |
| 'formatoptions'   | 'fo'      | 自动排版完成的方式                                        |
| 'formatprg'       | 'fp'      | "gq" 命令使用的外部程序                                   |
| 'fsync'           | 'fs'      | 文件写回后是否激活 fsync()                                |
| 'gdefault'        | 'gd'      | 缺省打开 ":substitute" 的 'g' 标志                        |
| 'grepformat'      | 'gfm'     | 'grepprg' 的输出格式                                      |
| 'grepprg'         | 'gp'      | ":grep" 使用的程序                                        |
| 'guicursor'       | 'gcr'     | GUI: 光标形状和闪烁的设置                                 |
| 'guifont'         | 'gfn'     | GUI: 使用的字体名                                         |
| 'guifontset'      | 'gfs'     | GUI: 使用的多字节字体名                                   |
| 'guifontwide'     | 'gfw'     | 双倍宽度字符的字体名列表                                  |
| 'guiheadroom'     | 'ghr'     | GUI: 用于窗口装饰的像素空间                               |
| 'guioptions'      | 'go'      | GUI: 使用的部件和选项                                     |
| 'guipty'          |           | GUI: ":!" 命令尝试仿终端                                  |
| 'guitablabel'     | 'gtl'     | GUI: 标签页定制的标签                                     |
| 'guitabtooltip'   | 'gtt'     | GUI: 标签页定制的工具提示                                 |
| 'helpfile'        | 'hf'      | 主帮助文件的完整路径名                                    |
| 'helpheight'      | 'hh'      | 新帮助窗口的最小高度                                      |
| 'helplang'        | 'hlg'     | 首选帮助语言                                              |
| 'hidden'          | 'hid'     | 当缓冲区被放弃 (\| abandon  \|) 时不卸载之                |
| 'highlight'       | 'hl'      | 设置若干场合下的高亮模式                                  |
| 'history'         | 'hi'      | 记住的命令行的行数                                        |
| 'hkmap'           | 'hk'      | 希伯来语的键盘映射                                        |
| 'hkmapp'          | 'hkp'     | 希伯来语的音节 (phonetic) 键盘映射                        |
| 'hlsearch'        | 'hls'     | 高亮最近的匹配搜索模式                                    |
| 'icon'            |           | 让 Vim 设定窗口图标的文本                                 |
| 'iconstring'      |           | Vim 图标文本所用的字符串                                  |
| 'ignorecase'      | 'ic'      | 搜索模式时忽略大小写                                      |
| 'imactivatefunc'  | 'imaf'    | 激活 X 输入方法 (X input method)调用的函数                |
| 'imactivatekey'   | 'imak'    | 激活 X 输入方法 (X input method) 的键击                   |
| 'imcmdline'       | 'imc'     | 开始编辑命令行时使用 IM                                   |
| 'imdisable'       | 'imd'     | 任何模式下不使用 IM                                       |
| 'iminsert'        | 'imi'     | 插入模式下使用 :lmap 或 IM                                |
| 'imsearch'        | 'ims'     | 输入搜索模式时使用 :lmap 或 IM                            |
| 'imstatusfunc'    | 'imsf'    | 获取 X 输入方法 (X input method) 状态时调用的函数         |
| 'include'         | 'inc'     | 查找包含文件所使用的模式                                  |
| 'includeexpr'     | 'inex'    | 处理包含文件行所使用的表达式                              |
| 'incsearch'       | 'is'      | 输入搜索模式时同时高亮部分的匹配                          |
| 'indentexpr'      | 'inde'    | 得到一行的缩进位置的表达式                                |
| 'indentkeys'      | 'indk'    | 使用 'indentexpr' 时启动缩进的键                          |
| 'infercase'       | 'inf'     | 关键字自动补全的匹配调整大小写                            |
| 'insertmode'      | 'im'      | 开始编辑文件时进入插入模式                                |
| 'isfname'         | 'isf'     | 文件和路径名可用的字符                                    |
| 'isident'         | 'isi'     | 标识符可用的字符                                          |
| 'iskeyword'       | 'isk'     | 关键字可用的字符                                          |
| 'isprint'         | 'isp'     | 可显示的字符                                              |
| 'joinspaces'      | 'js'      | 连接命令在句号之后加两个空格                              |
| 'key'             |           | 加密密钥                                                  |
| 'keymap'          | 'kmp'     | 键盘映射名                                                |
| 'keymodel'        | 'km'      | 允许用键击开始/停止选择                                   |
| 'keywordprg'      | 'kp'      | "K" 命令所使用的程序                                      |
| 'langmap'         | 'lmap'    | 其他语言模式用的字母表字符                                |
| 'langmenu'        | 'lm'      | 菜单使用的语言                                            |
| 'langnoremap'     | 'lnr'     | 不准使用 'langmap' 映射字符                               |
| 'laststatus'      | 'ls'      | 当最近的窗口有状态行时提示                                |
| 'lazyredraw'      | 'lz'      | 执行宏时不重画                                            |
| 'linebreak'       | 'lbr'     | 在空白处回绕长行                                          |
| 'lines'           |           | 显示屏幕的行数                                            |
| 'linespace'       | 'lsp'     | 字符之间的像素行数                                        |
| 'lisp'            |           | 自动 lisp 缩进                                            |
| 'lispwords'       | 'lw'      | 改变 lisp 缩进方式的单词                                  |
| 'list'            |           | 显示  和                                                  |
| 'listchars'       | 'lcs'     | list 模式下显示用的字符                                   |
| 'loadplugins'     | 'lpl'     | 启动时调入插件脚本                                        |
| 'luadll'          |           | 制定Lua shared library的名字                              |
| 'macatsui'        |           | Mac GUI: 使用 ATSUI 文本绘制                              |
| 'magic'           |           | 改变搜索模式所用的特殊字符                                |
| 'makeef'          | 'mef'     | ":make" 所用的错误文件名                                  |
| 'makeprg'         | 'mp'      | ":make" 命令所用的程序                                    |
| 'matchpairs'      | 'mps'     | "%" 能匹配的字符对                                        |
| 'matchtime'       | 'mat'     | 显示匹配括号的时间 (以十分之一秒计)                       |
| 'maxcombine'      | 'mco'     | 显示的最大组合用字符数                                    |
| 'maxfuncdepth'    | 'mfd'     | 用户函数的最大递归深度                                    |
| 'maxmapdepth'     | 'mmd'     | 映射的最大递归深度                                        |
| 'maxmem'          | 'mm'      | 单个缓冲区可用的最大内存 (以千字节计)                     |
| 'maxmempattern'   | 'mmp'     | 模式匹配使用的最大内存 (以千字节计)                       |
| 'maxmemtot'       | 'mmt'     | 所有缓冲区可用的最大内存 (以千字节计)                     |
| 'menuitems'       | 'mis'     | 菜单可用的最大项目数                                      |
| 'mkspellmem'      | 'msm'     | 在 \|:mkspell \| 压缩树前可用的内存                       |
| 'modeline'        | 'ml'      | 在文件开头或结尾识别模式行                                |
| 'modelines'       | 'mls'     | 模式行的检查行数                                          |
| 'modifiable'      | 'ma'      | 可否修改文本                                              |
| 'modified'        | 'mod'     | 缓冲区已被修改                                            |
| 'more'            |           | 全屏显示时暂停列表                                        |
| 'mouse'           |           | 允许使用鼠标点击                                          |
| 'mousefocus'      | 'mousef'  | 键盘焦点追随鼠标点击                                      |
| 'mousehide'       | 'mh'      | 输入时隐藏鼠标指针                                        |
| 'mousemodel'      | 'mousem'  | 改变鼠标按钮的含义                                        |
| 'mouseshape'      | 'mouses'  | 不同模式下改变鼠标指针的形状                              |
| 'mousetime'       | 'mouset'  | 鼠标双击之间的最大时间                                    |
| 'mzquantum'       | 'mzq'     | MzScheme 线程的轮询间隔                                   |
| 'nrformats'       | 'nf'      | CTRL-A 命令识别的数字格式                                 |
| 'number'          | 'nu'      | 行前显示行号                                              |
| 'numberwidth'     | 'nuw'     | 行号使用的列数                                            |
| 'omnifunc'        | 'ofu'     | 文件类型特定补全使用的函数                                |
| 'opendevice'      | 'odev'    | 允许读写设备                                              |
| 'operatorfunc'    | 'opfunc'  |                                                           | g@       | 操作符调用的函数            |
| 'osfiletype'      | 'oft'     | 操作系统特定的文件格式信息                                |
| 'packpath'        | 'pp'      | list of directories used for packages                     |
| 'paragraphs'      | 'para'    | 分隔段落的 nroff 宏                                       |
| 'paste'           |           | 允许粘贴文本                                              |
| 'pastetoggle'     | 'pt'      | 切换 'paste' 的键盘代码                                   |
| 'patchexpr'       | 'pex'     | 用于给文件打补丁的表达式                                  |
| 'patchmode'       | 'pm'      | 保留文件最老的版本                                        |
| 'path'            | 'pa'      | "gf" 等命令搜索用的目录列表                               |
| 'perldll'         |           | 指定 Perl dynamic library的名字                           |
| 'preserveindent'  | 'pi'      | 重排时保持原有的缩进结构                                  |
| 'previewheight'   | 'pvh'     | 预览窗口的高度                                            |
| 'previewwindow'   | 'pvw'     | 标识预览窗口                                              |
| 'printdevice'     | 'pdev'    | 用于 :hardcopy 的打印机名                                 |
| 'printencoding'   | 'penc'    | 用于打印的编码方式                                        |
| 'printexpr'       | 'pexpr'   | 用于 :hardcopy 打印 PostScript 的表达式                   |
| 'printfont'       | 'pfn'     | 用于 :hardcopy 的字体名                                   |
| 'printheader'     | 'pheader' | 用于 :hardcopy 的页眉格式                                 |
| 'printmbcharset'  | 'pmbcs'   | 用于 :hardcopy 的 CJK 字符集                              |
| 'printmbfont'     | 'pmbfn'   | 用于 :hardcopy 的 CJK 输出的字体名                        |
| 'printoptions'    | 'popt'    | 控制 :hardcopy 输出格式                                   |
| 'pumheight''      | 'ph'      | 弹出窗口的最大高度                                        |
| 'pythondll'       |           | name of the Python 2 dynamic library                      |
| 'pythonthreedll'  |           | name of the Python 3 dynamic library                      |
| 'quoteescape'     | 'qe'      | 字符串里使用的转义字符                                    |
| 'readonly'        | 'ro'      | 禁止写入缓冲区                                            |
| 'redrawtime'      | 'rdt'     | timeout for 'hlsearch' and                                | :match   | highlighting                |
| 'regexpengine'    | 're'      | default regexp engine to use                              |
| 'relativenumber'  | 'rnu'     | 显示相对行号                                              |
| 'remap'           |           | 允许映射可以递归调用                                      |
| 'renderoptions'   | 'rop'     | options for text rendering on Windows                     |
| 'report'          |           | 报告行改变的行数下限                                      |
| 'restorescreen'   | 'rs'      | Win32: 退出时恢复屏幕                                     |
| 'revins'          | 'ri'      | 字符插入会反向进行                                        |
| 'rightleft'       | 'rl'      | 窗口为从右到左模式                                        |
| 'rightleftcmd'    | 'rlc'     | 从右到左模式工作的编辑命令                                |
| 'rubydll'         |           | name of the Ruby dynamic library                          |
| 'ruler'           | 'ru'      | 标尺，在状态行里显示光标的行号和列号                      |
| 'rulerformat'     | 'ruf'     | 定制标尺格式                                              |
| 'runtimepath'     | 'rtp'     | 用于运行时文件的目录列表                                  |
| 'scroll'          | 'scr'     | 用 CTRL-U 和 CTRL-O 滚动的行数                            |
| 'scrollbind'      | 'scb'     | 其他窗口滚动时滚动当前窗口                                |
| 'scrolljump'      | 'sj'      | 滚动所需的最少行数                                        |
| 'scrolloff'       | 'so'      | 光标上下的最少行数                                        |
| 'scrollopt'       | 'sbo'     | 'scrollbind' 的行为方式                                   |
| 'sections'        | 'sect'    | 分隔小节的 nroff 宏                                       |
| 'secure'          |           | 在当前目录下以安全模式读入 .vimrc                         |
| 'selection'       | 'sel'     | 使用何种选择方式                                          |
| 'selectmode'      | 'slm'     | 何时使用选择模式而不是可视模式                            |
| 'sessionoptions'  | 'ssop'    | :mksession 的选项                                         |
| 'shell'           | 'sh'      | 使用外部命令的 shell 程序名字                             |
| 'shellcmdflag'    | 'shcf'    | 执行命令所使用的 shell 的参数                             |
| 'shellpipe'       | 'sp'      | 把 ":make" 结果输出到错误文件的字符串                     |
| 'shellquote'      | 'shq'     | 括起 shell 命令的字符                                     |
| 'shellredir'      | 'srr'     | 把过滤命令的输出存到暂时文件的字符串                      |
| 'shellslash'      | 'ssl'     | shell 文件名使用正斜杠                                    |
| 'shelltemp'       | 'stmp'    | shell 命令是否使用临时文件                                |
| 'shelltype'       | 'st'      | Amiga: 影响如何使用 shell                                 |
| 'shellxescape'    | 'sxe'     | characters to escape when 'shellxquote' is (              |
| 'shellxquote'     | 'sxq'     | 类似于 'shellquote'，但包括重定向                         |
| 'shiftround'      | 'sr'      | 缩进列数对齐到 shiftwidth 的整数倍                        |
| 'shiftwidth'      | 'sw'      | (自动) 缩进使用的步进单位，以空白数目计                   |
| 'shortmess'       | 'shm'     | 缩短消息长度的标志位列表                                  |
| 'shortname'       | 'sn'      | 非 MS-DOS: 文件名假定为 8.3 字符                          |
| 'showbreak'       | 'sbr'     | 用于提示回绕行开始的字符串                                |
| 'showcmd'         | 'sc'      | 在状态行里显示 (部分) 命令                                |
| 'showfulltag'     | 'sft'     | 自动补全标签时显示完整的标签匹配模式                      |
| 'showmatch'       | 'sm'      | 插入括号时短暂跳转到匹配的括号                            |
| 'showmode'        | 'smd'     | 在状态行上显示当前模式的消息                              |
| 'showtabline'     | 'stal'    | 是否显示标签页行                                          |
| 'sidescroll'      | 'ss'      | 横向滚动的最少列数                                        |
| 'sidescrolloff'   | 'siso'    | 在光标左右最少出现的列数                                  |
| 'smartcase'       | 'scs'     | 模式中有大写字母时不忽略大小写                            |
| 'smartindent'     | 'si'      | C 程序智能自动缩进                                        |
| 'smarttab'        | 'sta'     | 插入  时使用 'shiftwidth'                                 |
| 'softtabstop'     | 'sts'     | 编辑时  使用的空格数                                      |
| 'spell'           |           | 打开拼写检查                                              |
| 'spellcapcheck'   | 'spc'     | 定位句子尾部的模式                                        |
| 'spellfile'       | 'spf'     |                                                           | zg       | 和                          | zw | 保存单词的文件 |
| 'spelllang'       | 'spl'     | 拼写检查使用的语言                                        |
| 'spellsuggest'    | 'sps'     | 提供拼写校正建议的方法                                    |
| 'splitbelow'      | 'sb'      | 分割窗口时新窗口在当前窗口之下                            |
| 'splitright'      | 'spr'     | 新窗口在当前窗口之右                                      |
| 'startofline'     | 'sol'     | 命令移动光标到行的第一个空白 (译者注: 应为非空白)         |
| 'statusline'      | 'stl'     | 状态行的定制格式                                          |
| 'suffixes'        | 'su'      | 多个匹配所忽略的后缀                                      |
| 'suffixesadd'     | 'sua'     | 搜索文件时附加的后缀                                      |
| 'swapfile'        | 'swf'     | 缓冲区是否使用交换文件                                    |
| 'swapsync'        | 'sws'     | 和交换文件同步的方式                                      |
| 'switchbuf'       | 'swb'     | 设置切换到别的缓冲区时的行为                              |
| 'synmaxcol'       | 'smc'     | 寻找语法项目的最大列数                                    |
| 'syntax'          | 'syn'     | 读入当前缓冲区的语法                                      |
| 'tabline'         | 'tal'     | 终端标签页行的定制格式                                    |
| 'tabpagemax'      | 'tpm'     |                                                           | -p       | 和 "tab all" 的最大标签页数 |
| 'tabstop'         | 'ts'      | 在文件里使用的空格数                                      |
| 'tagbsearch'      | 'tbs'     | 标签文件里用二分法查找                                    |
| 'tagcase'         | 'tc'      | how to handle case when searching in tags files           |
| 'taglength'       | 'tl'      | 标签里的有效字符数                                        |
| 'tagrelative'     | 'tr'      | 标签文件里的文件名是相对路径                              |
| 'tags'            | 'tag'     | 标签命令使用的文件名列表                                  |
| 'tagstack'        | 'tgst'    | 把标签推入标签栈                                          |
| 'tcldll'          |           | name of the Tcl dynamic library                           |
| 'term'            |           | 终端名                                                    |
| 'termbidi'        | 'tbidi'   | 终端支持双向文本                                          |
| 'termencoding'    | 'tenc'    | 终端使用的编码方式                                        |
| 'terse'           |           | 简化部分消息                                              |
| 'textauto'        | 'ta'      | 已废止，用 'fileformats'                                  |
| 'textmode'        | 'tx'      | 已废止，用 'fileformat'                                   |
| 'textwidth'       | 'tw'      | 插入文本的最大宽度                                        |
| 'thesaurus'       | 'tsr'     | 关键字自动补全所用的同义词字典                            |
| 'tildeop'         | 'top'     | 波浪命令 "~" 以操作符方式工作                             |
| 'timeout'         | 'to'      | 映射和键盘代码等待超时                                    |
| 'timeoutlen'      | 'tm'      | 超时时间 (以毫秒计)                                       |
| 'title'           |           | 让 Vim 设置窗口标题                                       |
| 'titlelen'        |           | 用于窗口标题的 'columns' 比例                             |
| 'titleold'        |           | 旧的标题，用于退出时恢复                                  |
| 'titlestring'     |           | 用于 Vim 窗口标题的字符串                                 |
| 'toolbar'         | 'tb'      | GUI: 工具栏显示何种项目                                   |
| 'toolbariconsize' | 'tbis'    | 工具栏图标的大小 (只适用于 GTK 2)                         |
| 'ttimeout'        |           | 映射等待超时                                              |
| 'ttimeoutlen'     | 'ttm'     | 键盘代码超时时间 (以毫秒计)                               |
| 'ttybuiltin'      | 'tbi'     | 在外部 termcap 之前先用内建的 termcap                     |
| 'ttyfast'         | 'tf'      | 指示一个快速的终端连接                                    |
| 'ttymouse'        | 'ttym'    | 鼠标产生代码的类型                                        |
| 'ttyscroll'       | 'tsl'     | 滚动的最大行数                                            |
| 'ttytype'         | 'tty'     | 'term' 的别名                                             |
| 'undodir'         | 'udir'    | 临时文件存储目录                                          |
| 'undofile'        | 'udf'     | 在文件中保持撤销信息                                      |
| 'undolevels'      | 'ul'      | 最多可以撤销的改变个数                                    |
| 'undoreload'      | 'ur'      | 在缓冲区重载时保存撤销信息的最大行数                      |
| 'updatecount'     | 'uc'      | 刷新交换文件所需的字符数                                  |
| 'updatetime'      | 'ut'      | 刷新交换文件所需的毫秒数                                  |
| 'verbose'         | 'vbs'     | 给出详细信息                                              |
| 'verbosefile'     | 'vfile'   | 消息写入的文件                                            |
| 'viewdir'         | 'vdir'    | :mkview 存储文件的所在目录                                |
| 'viewoptions'     | 'vop'     | 指定 :mkview 保存的内容                                   |
| 'viminfo'         | 'vi'      | 启动和退出时使用 .viminfo 文件                            |
| 'virtualedit'     | 've'      | 何时使用虚拟编辑                                          |
| 'visualbell'      | 'vb'      | 使用可视铃声而不是响铃                                    |
| 'warn'            |           | 当缓冲区改变时，对 shell 命令给出警告                     |
| 'weirdinvert'     | 'wi'      | 用于有特殊反转方法的终端                                  |
| 'whichwrap'       | 'ww'      | 允许指定键跨越行边界                                      |
| 'wildchar'        | 'wc'      | 用于通配符扩展的命令行字符                                |
| 'wildcharm'       | 'wcm'     | 同 'wildchar'，但对映射情况也适用                         |
| 'wildignore'      | 'wig'     | 匹配这些模式的文件不会参与自动补全                        |
| 'wildignorecase'  | 'wic'     | 对文件名和目录的补全忽略大小写                            |
| 'wildmenu'        | 'wmnu'    | 命令行自动补全所使用的菜单                                |
| 'wildmode'        | 'wim'     | 'wildchar' 命令行扩展所用的模式                           |
| 'wildoptions'     | 'wop'     | 指定如何完成命令行补全。                                  |
| 'winaltkeys'      | 'wak'     | 何时窗口系统处理 ALT 键                                   |
| 'window'          | 'wi'      | nr of lines to scroll for CTRL-F and CTRL-B               |
| 'winheight'       | 'wh'      | 当前窗口的最少行数                                        |
| 'winfixheight'    | 'wfh'     | 打开/关闭窗口时保持窗口高度                               |
| 'winfixwidth'     | 'wfw'     | 打开/关闭窗口时保持窗口宽度                               |
| 'winminheight'    | 'wmh'     | 任何窗口的最少行数                                        |
| 'winminwidth'     | 'wmw'     | 任何窗口的最少列数                                        |
| 'winwidth'        | 'wiw'     | 当前窗口的最少列数                                        |
| 'wrap'            |           | 长行回绕并在下一行继续                                    |
| 'wrapmargin'      | 'wm'      | 使 (硬) 回绕开始的从右侧起算的字符数                      |
| 'wrapscan'        | 'ws'      | 搜索在文件尾折回文件头                                    |
| 'write'           |           | 允许写入文件                                              |
| 'writeany'        | 'wa'      | 写入文件不需 "!" 强制                                     |
| 'writebackup'     | 'wb'      | 覆盖文件时建立备份                                        |
| 'writedelay'      | 'wd'      | 每个字符延迟 (以毫秒计) (用于调试)                        |
