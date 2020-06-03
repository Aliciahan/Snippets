" 以下是Bundle插件管理库的设置
" ----------------------------------------------------
set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须
set encoding=utf-8

silent! color dracula

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
silent! call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
silent! Plugin 'VundleVim/Vundle.vim'
silent! Plugin 'vim-scripts/The-NERD-tree'
silent! Plugin 'vim-scripts/taglist.vim'
silent! Plugin 'Valloric/YouCompleteMe'
silent! Plugin 'SirVer/ultisnips'
silent! Plugin 'honza/vim-snippets'
silent! Plugin 'kien/ctrlp.vim'
silent! Plugin 'mileszs/ack.vim'
silent! Plugin 'altercation/vim-colors-solarized'
silent! Plugin 'vim-voom/VOoM'
silent! Plugin 'vim-syntastic/syntastic'
silent! Plugin 'luochen1990/rainbow'
silent! Plugin 'ekalinin/Dockerfile.vim'
silent! Plugin 'tomasr/molokai'
silent! Plugin 'tpope/vim-endwise'
silent! Plugin 'tpope/vim-rails'
silent! Plugin 'tpope/vim-surround'
silent! Plugin 'vim-ruby/vim-ruby'
silent! Plugin 'pangloss/vim-javascript'
silent! Plugin 'kchmck/vim-coffee-script'
silent! Plugin 'godlygeek/tabular'
silent! Plugin 'dracula/vim'
silent! Plugin 'othree/javascript-libraries-syntax.vim'
silent! Plugin 'hashivim/vim-terraform'


"
" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'

" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件

"以下是我自己的设置
" ---------------------------------------------------------
"  
" Switch syntax highlighting on, when the terminal has colors
syntax on
syntax enable


set number
" Set syntax highlighting for specific file types
au BufNewFile,BufRead BufRead *.handlebras set file type=html
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.go set filetype=go
autocmd Syntax javascript set syntax=jquery
set background=dark
silent! colorscheme molokai
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0
set showcmd
set ruler
set wildmenu
set showmatch
set mouse=a
set showcmd
set autoindent
set hlsearch
set backspace=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType js setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType erb setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType go setlocal ts=2 sts=2 sw=2 expandtab
set ignorecase
set smartcase
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set list listchars=tab:»·,trail:·
" Highlight current line
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
"set cursorline cursorcolumn

" 当光标一段时间保持不动了，就禁用高亮
autocmd cursorhold * set nohlsearch
" 当输入查找命令时，再启用高亮
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>

set clipboard=unnamed
"clipboard to system clipboard for Mac OS X

set pastetoggle=<F9>
" Forbidden auto indent when copy

" Setting for ctrlp search
" 
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip     
let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$'}


autocmd Bufenter *.txt set spell spelllang=en
autocmd Bufenter *.tex set spell spelllang=en
autocmd Bufenter *.md set spell spelllang=en
autocmd Bufenter *.markdown set spell spelllang=en

" spell checking
function! ToggleSpellLang()
	" toggle between en and fr
	if &spelllang =~# 'en'
		:set spelllang=fr
	else
		:set spelllang=en
	endif
endfunction
nnoremap <F7> :setlocal spell!<CR> " toggle spell on or off
nnoremap <F8> :call ToggleSpellLang()<CR> " toggle language

command Spellen set spell spelllang=en
command Spellfr set spell spelllang=fr

"
"NERDTREE Configuration 
" autocmd VimEnter * NERDTree
" nmap <leader>filetree :NERDTree<CR>
" 

let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.swp$', '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.svn$', '^\.hg$' ] 
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap <F5> :NERDTreeToggle<cr>

" ------------Ultisnippets
"
" 
" let g:UltiSnipsSnippetsDir = '~/Dropbox/ultisnips'
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
function! g:UltiSnips_Complete()
	call UltiSnips#ExpandSnippet()
	if g:ulti_expand_res == 0
		if pumvisible()
			return "\<C-n>"
		else
			call UltiSnips#JumpForwards()
			if g:ulti_jump_forwards_res == 0
				return "\<TAB>"
			endif
		endif
	endif
	return ""
endfunction

function! g:UltiSnips_Reverse()
	call UltiSnips#JumpBackwards()
	if g:ulti_jump_backwards_res == 0
		return "\<C-P>"
	endif

	return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
	let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif
if !exists("g:UltiSnipsJumpBackwardTrigger")
	let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"


let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_key_list_accept_completion = ['<C-y>']

" Additional YouCompleteMe config.
set completeopt=longest,menu
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_seed_identifiers_with_syntax = 1

" Same as default, but with "markdown" and "text" removed.
let g:ycm_filetype_blacklist = {
      \   'notes': 1,
      \   'unite': 1,
      \   'tagbar': 1,
      \   'pandoc': 1,
      \   'qf': 1,
      \   'vimwiki': 1,
      \   'infolog': 1,
      \   'mail': 1
      \ }

let g:tex_indent_items=0

filetype plugin on
filetype indent on 
let g:tex_flavor='latex'

"rainbow setting
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

"Setting for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_quiet_messages = { "regex": [
        \ '\mpossible unwanted space at "{"' ,
        \ '\mWhitespace before punctation mark in " ."',
        \ '\mmissing `\ `  after "etc."',
        \ ] }

autocmd BufRead,BufNewFile *.template setfiletype template
set timeoutlen=1000 ttimeoutlen=0
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

let g:used_javascript_libs = 'vue,angularjs'
autocmd BufReadPre *.js let b:javascript_lib_use_vue = 1
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

"taglist配置信息
let Tlist_Auto_Open=0 " Let the tag list open automatically
let Tlist_Auto_Update=1 " Update the tag list automatically
let Tlist_Compact_Format=1 " Hide help menu
let Tlist_Ctags_Cmd='ctags' " Location of ctags
let Tlist_Enable_Fold_Column=0 "do show folding tree
let Tlist_Process_File_Always=1 " Always process the source file
let Tlist_Show_One_File=1 " Only show the tag list of current file
let Tlist_Exist_OnlyWindow=1 " If you are the last, kill yourself
let Tlist_File_Fold_Auto_Close=0 " Fold closed other trees
let Tlist_Sort_Type="name" " Order by name
let Tlist_WinWidth=30 " Set the window 40 cols wide.
let Tlist_Close_On_Select=1 " Close the list when a item is selected
let Tlist_Use_SingleClick=1 "Go To Target By SingleClick
let Tlist_Use_Right_Window=1 "在右侧显示
