colorscheme default 
syntax enable           " enable syntax processing
set t_Co=256            " request terminal to use 256 colors
"set spell
"set spelllang=en_us
set autoindent
set smarttab
set tabstop=4           " number of visual spaces per tab
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4        " number of spaces with << and >>
set expandtab           " tabs are spaces
set number              " show line numbers
set wildmenu            " visual autocomplete for command menu
set showmatch           " hightlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight search matches
noremap <leader><space> :nohl<CR> 
"set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set mouse=a
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
"set colorcolumn=80      " highlight column 
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
function! Tabcomplete()
    let linea=strpart(getline('.'),-1,col('.')) "line until cursor
    let palabra=matchstr(linea,"[^ \s]*$") "current word 
    if (match(palabra,'/') != -1) "is there a / in there? if so filename completion. 
        return "\<C-X>\<C-F>" 
        elseif strlen(palabra)==0 "is the current word empty? 
        return "\<Tab>" 
    else 
        return "\<C-P>" 
    endif 
endfunction
imap <Tab> <C-R>=Tabcomplete()<CR>
imap jk <Esc>
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>
noremap <C-R> <C-W><C-R>
function! RunFile()
    execute "w"
    let extension = expand('%:e')
    if (extension == 'py')
        execute "!python3 %"
    endif
    if (extension == 'java')
        silent execute "!javac %"
        execute "!java %:r"
        "execute "!./rn"
    endif
endfunction
function! ToggleComment()
    let extension = expand('%:e')
    if (extension == 'py')
        let commentChar = "#"
    endif
    if (extension == 'java')
        let commentChar = "/"
    endif
    execute "normal! mq0"
    if commentChar == matchstr(getline('.'), '\%' . col('.') . 'c.') 
        if (extension == 'java')
            execute "normal! 2x\<esc>`q"
        endif
        if (extension == 'py')
            execute "normal! x\<esc>`q"
        endif
    else
        if (extension == 'java')
            let commentChar = "//"
        endif
        execute "normal! i".commentChar."\<esc>`q"
    endif
endfunction
noremap <leader><tab> :call RunFile()<CR>
noremap <leader>a :call ToggleComment()<CR>
set hidden
noremap <CR> o<esc>
noremap <leader><CR> O<esc>
noremap <tab> >>
noremap <S-tab> <<
