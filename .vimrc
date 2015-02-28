" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vundle rule!
set nocompatible    " be iMproved
filetype off        " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" vim-scripts repos
Plugin 'ctrlp.vim'
Plugin 'EasyGrep'
Plugin 'bling/vim-airline'
Plugin 'vim-ruby/vim-ruby'
"Bundle 'ZenCoding.vim'
Plugin 'The-NERD-tree'
Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
"Bundle 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/vim-easymotion'

call vundle#end()

filetype plugin indent on    " required!

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd            " Show (partial) command in status line.
"set showmatch          " Show matching brackets.
"set ignorecase         " Do case insensitive matching
"set smartcase          " Do smart case matching
"set incsearch          " Incremental search
"set autowrite          " Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a            " Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

colorscheme elflord
set showcmd " 显示未完成命令
set nu "显示行号
set relativenumber "显示相对行号
set ruler "右下角显示光标位置的状态行

set autoindent "智能自动缩进
set smartindent "智能自动缩进
set expandtab "用空格代替tab
set tabstop=2 "设置Tab的宽度
set shiftwidth=2 "换行时行间交错使用2空格?
set cindent shiftwidth=2 "自动缩进2空格

set mouse=a "启用鼠标
set whichwrap+=<,>,h,l "使左右移动键在行首和行尾可以移动到前一行和下一行
set wildmenu "命令行补全增强模式，在输入命令是列出匹配项目
set completeopt=menu,longest,preview " 插入模式下补全功能的显示方式，分别支持弹出菜单式、插入匹配的最长文本、在预览窗口里显示
set scrolloff=10 "光标所在行的上下两侧最少保留的屏幕可见行数

set hlsearch " 开启高亮显示结果
set incsearch "开启实时搜索功能
set ignorecase "忽略大小写
set smartcase "如果搜索模式包含大写字母，忽略ignorecase

"set errorbells "关闭错误信息报警
"set novisualbell "关闭代替名叫的可视响铃
"set guifont=YaHei\ Cosolas\ Hyrid:h11 "设置字体和大小
"set linespace=4 "设置行间距

"highlight current line: on in normal mode, off in insert mode
set cul
autocmd InsertEnter * set nocul
autocmd InsertLeave * set cul

"cursor shape:
"let &t_EI .= "\<Esc>[6 q""]"
"autocmd InsertEnter * let &t_EI .= "\<Esc>[6 q""]"
"autocmd InsertLeave * let &t_EI .= "\<Esc>[2 q""]"
"let g:togglecursor_default = "block"
"let g:togglecursor_insert = "line"
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_SI = "\<Esc>[6 q"
let &t_EI = "\<Esc>[2 q"

" leaders
let mapleader="," "映射快捷键开始命令为,号
let g:mapleader="," "全局设置
let maplocalleader = "\\"
let g:maplocalleader = "\\"

" tab option
ca te tabedit
ca tm tabmove

"""""""""""""""""""""""""""""""""""""""""""
" 自定义快捷键
"""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>
nmap <leader>wq :wq!<cr>

" for vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"" Insert Mode Mapping:
imap <c-u> <ESC>bgUwea

"" 代码补全快捷键
inoremap <Esc>/ <C-x><C-o>
set omnifunc=syntaxcomplete#Complete "设置补全

" for vim-ruby
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" for EasyGrep
let g:EasyGrepFilesToExclude="/home/hydra/icemaple_loc/mapleseed/jadeite_tech/server/ruby/tags"  " not usable if I use ag for searching


" for airline
set noshowmode
set laststatus=2
let g:airline#extensions#tabline#enabled = 1 
""let g:airline_powerline_fonts = 1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
set t_Co=256 


" for NERDTree
nmap <leader>nt :NERDTree<CR>

" for CtrlP
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 't'

" for YouCompleteMe
"nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" for easymotion
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
