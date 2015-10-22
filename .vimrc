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
Plugin 'gmarik/Vundle.vim'

" vim-scripts repos
Plugin 'ctrlp.vim'
Plugin 'EasyGrep'
Plugin 'bling/vim-airline'
Plugin 'mkitt/tabline.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/syntastic'
Plugin 'The-NERD-tree'
Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
" Bundle 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/vim-easymotion'

" About snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Optional:
Plugin 'honza/vim-snippets'
" vim-react-snippets:
Plugin 'justinj/vim-react-snippets'

call vundle#end()

filetype plugin indent on    " required!

if has("syntax")
  syntax on
endif

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

"highlight current line: on in normal mode, off in insert mode
set cul
autocmd InsertEnter * set nocul
autocmd InsertLeave * set cul

"cursor shape:
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
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>wq :wq!<cr>

" for vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"" Insert Mode Mapping:
inoremap <c-u> <ESC>bgUwea

"" 代码补全快捷键
inoremap <Esc>/ <C-x><C-o>
set omnifunc=syntaxcomplete#Complete "设置补全

" for scrooloose/syntastic
let g:syntastic_check_on_open = 1
" " for javacript
let g:syntastic_javascript_checkers = ['eslint', 'flow']


" for vim-ruby
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" for airline
set noshowmode
set laststatus=2
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
set t_Co=256 


" for NERDTree
nnoremap <leader>nt :NERDTree<CR>

" for CtrlP
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 't'

" for YouCompleteMe
"nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" for easymotion
nnoremap s <Plug>(easymotion-s2)
