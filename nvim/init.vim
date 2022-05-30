" ----------
" yang
" ----------

" 总结使用说明
" --------------------------FN 层
" F1: 文件树
" F2: 文件树焦点
" F3: 文件反向寻找文件树
" F4: tarbar树
" F5: 
" F6: 文件历史操作记录
" F7: 文件git操作记录
" F8: 下侧zsh弹框
" F9: 
" F10:
" F11:--不可使用--
" F12:

" --------------------------按键层
" t: 进入跳转输入
" C-n: 根据选择数据向下多光标寻找
" C-z: 根据当前光标垂直向下寻找
" C-x: 根据当前光笔垂直向上寻找
"
" mn: 向下寻找标记
" mp: 向上寻找标记
" m+其他: 比较该行为其他
" mm: 标记该行
" ml: 标记列表
" md: 删除所有标记
"
" --------------------------leader层
" ff: files
" rg: fzf rg
" BL: fzf buffers
" fl: fzf lines
" gl: fzf Commits
" w: 窗口调整
    " |- hjkl 页面微调
    " |- HJKL 页面移动
    " |- F/f/o 满宽/满高/满屏
    " |- = 等宽
    " |- v/s 向右/向下分割
    " |- w 切换焦点
    " |- n/p <tab> 切换buf
"


" ---
" 基本配置
" ---
" 格式
filetype off
set history=1000

" 设置命令提示 唯一标识 共享剪贴板
set showcmd
set wildmenu
set wildmode=longest:list,full
set clipboard+=unnamed
set clipboard+=unnamedplus

" 搜索高亮
set hlsearch                    " 检索时高亮匹配项
set showmatch                   " 高亮显示对应括号
set incsearch                   " 边检索边显示匹配
set ignorecase
set smartcase

" 设置正常删除，光标穿越行
set backspace=indent,eol,start
set whichwrap=<,>,[,]           " 当光标到行首或行尾，允许左右方向键换行

" 错误无提示音 去除屏幕闪烁
set vb
set t_vb=""
set t_ut=""
set hidden

" 不换行
" set nowrap

" 缩进对齐
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab

" 不自动备份
set nobackup
set nowritebackup
set noswapfile

" 光标回到上次位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 折叠
" 打开文件默认不折叠代码
set foldlevelstart=99
" 代码可折叠
set foldmethod=indent
set foldlevel=99

" 显示
syntax enable
set background=dark
set t_Co=256
" 命令行高度始终为2
" coc 更多的空间
set cmdheight=2
" 真彩色
set termguicolors

" 屏幕顶部底部总是保留5行
set scrolloff=3
" 不显示模式
set noshowmode

" 行号 行高亮 始终显示标记列
set nu
" set cul
" set signcolumn=yes:2
set signcolumn=auto
" set relativenumber              " 相对行号
set cursorline                    "高亮当前行
" set cursorcolumn                  " 高亮当前列

" 总是开启 statusline & tabline
set laststatus=2
set showtabline=2
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1

" ---
" 编码配置
" ---
set encoding=utf-8

" ---
" 自定义键盘映射
" ---

" 按键映射的起始字符
let mapleader = '\'

" jk按键退出输入状态
inoremap jj <esc>l

" 代码折叠快捷键
nnoremap <space> za

" 使用Ctrl-l 和 Ctrl+h 切换标签页
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" 在行末加上分号
nnoremap <silent> ;; :<Esc><End>a;<Esc>
" 逗号
nnoremap <silent> ,, :<Esc><End>a,<Esc>
" 尖括号
nnoremap <silent> >> :<Esc><End>a><Esc>

" tab快捷键
nnoremap <silent> TN :tabnew<CR>
nnoremap <silent> TD :tabc<CR>
nnoremap "  :tabn<CR>


" buffer快捷键
" normal 模式下使用 bn 切换到下一个 Buffer
nnoremap <silent> BP :bprevious<CR>
nnoremap <silent> BN :bnext<CR>
nnoremap <silent> BD :bdelete<CR>

set nocompatible

" ---
" plug配置
" ---
call plug#begin('~/.config/nvim/plugged')

" 主题
Plug 'sainnhe/gruvbox-material'
let g:gruvbox_material_palette='material'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1
" 标识栏背景色
let g:gruvbox_material_sign_column_background='bg0'
let g:gruvbox_material_enable_italic = 1
" 注释中禁用斜体
let g:gruvbox_material_disable_italic_comment=1
" 启用函粗体
let g:gruvbox_material_enable_bold=1
" 选中反向颜色
let g:gruvbox_material_visual='reverse'
" 高亮对比
let g:gruvbox_material_ui_contrast='high'
colorscheme gruvbox-material

Plug 'nlknguyen/papercolor-theme'
" let g:PaperColor_Theme_Options = {
" \   'theme': {
" \     'default': {
" \       'transparent_background': 1,
" \       'allow_bold': 1,
" \       'allow_italic': 1
" \     }
" \   }
" \ }
" colorscheme PaperColor

" 必须在此配置左侧标记列颜色，否则会被覆盖
" highlight SignColumn guibg=#4B4B4B

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
" 是否显示隐藏文件
let NERDTreeShowHidden    = 1
" 设置宽度
let NERDTreeWinSize       = 35
" 显示书签列表
let NERDTreeShowBookmarks = 1
" 自动删除没用的buffer
let NERDTreeAutoDeleteBuffer=1
" 打开/关闭
map <F1> :NERDTreeToggle<CR>
" 进入焦点
map <F2> :NERDTreeFocus<CR>
" 文件中点击后反向找到文件路径
map <F3> :NERDTreeFind<CR>
" 当只有一个窗口时关闭后绑定nerdtree一起关闭
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" 防止其他缓冲区替换其窗口中的NERDTree
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
let g:NERDTreeGitStatusUseNerdFonts = 1 
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Unmerged"  : "═",
		\ "Renamed"   : "➜",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"设置树的显示图标
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
" 过滤所有.swp文件不显示"
let NERDTreeIgnore = ['\.swp', '\.swo', '\.vscode', '\.DS_Store']
" 不显示左侧文件列表打开关闭节点
let g:WebDevIconsUnicodeDecorateFileNodes = 0
" 去除左右[]
let g:NERDTreeGitStatusConcealBrackets = 1
" 使用vim-plug时方式函数在此崩溃
let g:plug_window = 'noautocmd vertical topleft new'
let g:NERDTreeMapMenu='M'

" 滑动显示块
Plug 'gcavallanti/vim-noscrollbar'
" set statusline=%<\ %{noscrollbar#statusline(20,'+','-')}

Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_a = ''
" git版本
let g:airline_section_b = '🅱️  %{gitbranch#name()}'
" 滑动框
let g:airline_section_c = '  ◄%{noscrollbar#statusline(10,"□","◼")}► %f'
let g:airline_section_x = ''
" coc状态
let g:airline_section_z = '%{coc#status()}%{get(b:,"coc_current_function","")}'
let g:airline_section_error = ''
let g:airline_section_warning = ''
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='bubblegum'

" tmux、vim下的C-hjkl跳转
Plug 'christoomey/vim-tmux-navigator'

" Git差异显示
" :GG
" <Leader> hp 显示差异内容
" <Leader> hs add
" <Leader> hu 撤销
" ]c 跳转下一个修改区
" [c 跳转上一个修改区
" Plug 'airblade/vim-gitgutter'
" map <F5> :GitGutterToggle<CR>
" " 如果要关闭消
" let g:gitgutter_show_msg_on_hunk_jumping = 0
" " 默认关闭
" let g:gitgutter_enabled = 0
" let g:gitgutter_sign_added = '▌'
" let g:gitgutter_sign_modified = '▌'
" let g:gitgutter_sign_removed = '▌'
" let g:gitgutter_sign_removed_first_line = '▌'
" let g:gitgutter_sign_removed_above_and_below = '▌'
" let g:gitgutter_sign_modified_removed = '▌'
" " 更新时间
" let g:gitgutter_max_signs = -1
" highlight GitGutterAdd    guifg=#A1D174 ctermfg=40
" highlight GitGutterChange guifg=#C5C5C5 ctermfg=30
" highlight GitGutterDelete guifg=#FC419F ctermfg=9
" " 启用窗口显示git差异
" let g:gitgutter_preview_win_floating = 1
" let g:gitgutter_use_location_list = 2
" let g:gitgutter_async = 0


" 标签闭合
Plug 'alvan/vim-closetag'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.js, *.vue, *.jsx'

" fzf 文件搜索
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" 快捷键转换
let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
  \ { 'fg':   ['fg', 'Comment'],
  \   'border': ['fg', 'Normal']}
" find Context
map <leader>rg :Rg<CR>
" 显示Buffers列表，替换原有方式
nnoremap <silent> BL :Buffers<CR>
" find Lines
map <leader>fl :Lines<CR>
" find git log
map <leader>gl :Commits<CR>

" 文件搜索
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
nnoremap  <leader>ff  :Telescope find_files <cr> 


" 窗口调整
" hjkl  普通移动
" HJKL  移动页面
" F/f/o   满宽/满高/满屏
" =     等宽高
" v/s   竖直/水平 分割
" w 切换焦点
" n/p <tab> 切换buffer
Plug 'romgrk/winteract.vim'
nmap <leader>w :InteractiveWindow<CR>

" 快速定位
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings"
" t + 
" 一个Char配置
nmap t <Plug>(easymotion-overwin-f)
" 启用不区分大小写功能
let g:EasyMotion_smartcase = 1

" 成对出现() [] {} ''
Plug 'jiangmiao/auto-pairs'

" 文本移动
Plug 'matze/vim-move'
let g:move_map_keys = 0
vmap J <Plug>MoveBlockDown
vmap K <Plug>MoveBlockUp
nmap J <Plug>MoveLineDown
nmap K <Plug>MoveLineUp

" 注释
" gc v状态下注释
" 默认状态下，gcc单行注释，gcap段落注释
Plug 'tpope/vim-commentary'

" 代码格式化
" Tab... /XXXX  根据xxxx对齐
" Tab... /XXXX\zs  根据xxxx后的内容对齐
Plug 'godlygeek/tabular'

" 多光标处理
" C-n获取，q跳过本次，Q删除本次
Plug 'mg979/vim-visual-multi' 
let g:VM_maps = {}
let g:VM_theme='neon'
" 光标向下移动
let g:VM_maps["Add Cursor Down"] = '<c-z>'
" 光标向上移动
let g:VM_maps["Add Cursor Up"] = '<c-x>'

" 标签
" ma  标记为a
" dma 删除标记a
" m, 标记一下个标记符号
" m. 如果有标记，删除，否则标记
" m- 删除行标记
" m<space> 删除buffer下所有标记
" m n/p 跳跃
Plug 'kshenoy/vim-signature'
let g:SignatureForceRemoveGlobal=0
nmap mn ]`
nmap mp [`
nmap mm m.
nmap ml m/
" 删除所有标记后的清空
nmap md m<space>:wshada!<CR>
" 标记颜色
highlight SignatureMarkText guifg=#D87579
" 退出时强制调用
autocmd VimLeave * wshada!
" let g:SignatureIncludeMarkers = '!!@#$%ˆ&*('

" git 分支
Plug 'itchyny/vim-gitbranch'

" " 开启屏幕首页
" Plug 'mhinz/vim-startify'
" " 添加git中为上传的文件列表
" function! s:gitModified()
"     let files = systemlist('git ls-files -m 2>/dev/null')
"     return map(files, "{'line': v:val, 'path': v:val}")
" endfunction
" " same as above, but show untracked files, honouring .gitignore
" function! s:gitUntracked()
"     let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
"     return map(files, "{'line': v:val, 'path': v:val}")
" endfunction
" function! s:nerdtreeBookmarks()
"     let bookmarks = systemlist("cut -d' ' -f 2- ~/.NERDTreeBookmarks")
"     let bookmarks = bookmarks[0:-2] " Slices an empty last line
"     return map(bookmarks, "{'line': v:val, 'path': v:val}")
" endfunction
" function! GetUniqueSessionName()
"   let path = fnamemodify(getcwd(), ':~:t')
"   let path = empty(path) ? 'no-project' : path
"   let branch = gitbranch#name()
"   let branch = empty(branch) ? '' : '-' . branch
"   return substitute(path . branch, '/', '-', 'g')
" endfunction
" let g:startify_lists = [
"         \ { 'type': 'dir',       'header': ['🗒️  '. getcwd()] },
"         \ { 'type': 'files',     'header': ['🗂️  ']            },
"         \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['🔖 ']},
"         \ { 'type': function('s:gitModified'),  'header': ['⁉️  git modified']},
"         \ { 'type': function('s:gitUntracked'), 'header': ['🚫 git untracked']},
"         \ { 'type': 'commands',  'header': ['Commands']       },
"         \ { 'type': 'sessions',  'header': ['Sessions']       },
"         \ ]
" let g:startify_custom_footer = [
"         \'      ________ ________  ________  ________   ___  __       ',
"         \'     |\  _____\\   __  \|\   __  \|\   ___  \|\  \|\  \     ',
"         \'     \ \  \__/\ \  \|\  \ \  \|\  \ \  \\ \  \ \  \/  /|_   ',
"         \'      \ \   __\\ \   _  _\ \   __  \ \  \\ \  \ \   ___  \  ',
"         \'       \ \  \_| \ \  \\  \\ \  \ \  \ \  \\ \  \ \  \\ \  \ ',
"         \'        \ \__\   \ \__\\ _\\ \__\ \__\ \__\\ \__\ \__\\ \__\',
"         \'         \|__|    \|__|\|__|\|__|\|__|\|__| \|__|\|__| \|__|',
"         \ ]

Plug 'glepnir/dashboard-nvim'
let g:dashboard_default_executive ='fzf'
let g:dashboard_custom_section = {
  \ 'a': { 'description': ['  new file         [1]'], 'command': 'DashboardNewFile'},
  \ 'b': { 'description': ['  Find File        [2]'], 'command': 'DashboardFindFile'},
  \ 'c': { 'description': ['  Find Word        [3]'], 'command': 'DashboardFindWord'},
  \ 'd': { 'description': ['  Find History     [4]'], 'command': 'DashboardFindHistory'},
  \ 'e': { 'description': ['  DataBase UI      [5]'], 'command': 'DBUI'},
  \ 'exit': { 'description': ['  Exit             [q]'], 'command': 'exit'},
  \ }

nnoremap <silent> 1 :DashboardNewFile<CR>
nnoremap <silent> 2 :DashboardFindFile<CR>
nnoremap <silent> 3 :DashboardFindWord<CR>
nnoremap <silent> 4 :DashboardFindHistory<CR>
nnoremap <silent> 5 :DBUI<CR>
" nnoremap <silent> q :q<CR>

let g:dashboard_custom_header=[
\ '',
\ '',
\ '',
\ '',
\ '                                       🤙🤙🤙',
\ '  ┏┅┅┅ Hello 🤣😉🤩🤑🤤┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┓',
\ '  ┇  ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗  ┇',
\ '  ┇  ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║  ┇',
\ '  ┇  ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║  ┇',
\ '  ┇  ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║  ┇',
\ '  ┇  ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║  ┇',
\ '  ┇  ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝  ┇',
\ '  ┗┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅💰💰💰 Yang ┅┅┅┛',
\ '           🧘🧘🧘          ',
\ '',
\ '',
\ '',
\ '',
\ '',
\]


" 文件操作历史记录
Plug 'mbbill/undotree'
nnoremap <F6> :UndotreeToggle<CR>
" 显示风格
let g:undotree_WindowLayout = 4
" 日期显示
let g:undotree_ShortIndicators = 1

" 持久保存
if has("persistent_undo")
    let target_path = expand('~/.config/nvim/undodir/.undodir')
    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

" git 操作历史
Plug 'sjl/gundo.vim'
let g:gundo_prefer_python3 = 1
nnoremap <F7> :GundoToggle<CR>
let g:gundo_right = 1
let g:gundo_preview_bottom=1

"" 语言检测
"Plug 'valloric/youcompleteme'
"" 补全功能在注释中同样有效
"let g:ycm_complete_in_comments                           = 1
"" 补全功能在字符串中同样有效
"let g:ycm_complete_in_strings                            = 1
""注释和字符串中的文字也会被收入补全
"let g:ycm_collect_identifiers_from_comments_and_strings  = 0
""映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
"let g:ycm_key_list_select_completion                   = ['<C-n>']
"let g:ycm_key_list_previous_completion                 = ['<C-p>']
"" 关闭映射
"let g:ycm_key_list_stop_completion                       = ['<C-y>', '<ESC>']
"" 从第一个键入字符就开始罗列匹配项
"let g:ycm_min_num_of_chars_for_completion                = 1
"" 开启语义补全
"let g:ycm_seed_identifiers_with_syntax                   = 1
""提示UltiSnips
"let g:ycm_use_ultisnips_completer                        = 1
"" 在用户离开插入模式后自动关闭窗口
"let g:ycm_autoclose_preview_window_after_insertion       = 1
"" 它将在窗口中显示完整的函数原型和所有函数重载
"let g:ycm_add_preview_to_completeopt                     = 1
"" 在函数完成显示时弹出的窗口自动关闭
"let g:ycm_autoclose_preview_window_after_completion      = 1
"" 转到包含/声明/定义
"map <F9> :YcmCompleter GoTo<CR>
"" 修改名称
"map <F10> :YcmCompleter RefactorRename 
"" 设置关键字触发补全
"let g:ycm_semantic_triggers =  {
"  \   'c' : ['->', '.', ' ', '(', '[', '&'],
"  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s', 're!\[.*\]\s'],
"  \   'ocaml' : ['.', '#'],
"  \   'cpp,objcpp,rust' : ['->', '.', '::'],
"  \   'perl' : ['->'],
"  \   'php' : ['->', '::'],
"  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
"  \   'ruby' : ['.', '::'],
"  \   'lua' : ['.', ':'],
"  \   'erlang' : [':'],
"  \ }
"" 关闭警告功能
"let g:ycm_enable_diagnostic_signs = 0
"let g:ycm_enable_diagnostic_highlighting = 0
"let g:ycm_echo_current_diagnostic = 0

"Plug 'w0rp/ale'
"let g:ale_sign_error       = '😱'
"let g:ale_sign_warning     = '🤥'
"let g:ale_linters = {
"			\ 'javascript': ['prettier', 'eslint'],
"			\ 'vue': ['vls', 'eslint']
"			\}
"let g:ale_linter_aliases = {
"			\ 'vue': ['vue', 'javascript']
"			\}
"let g:ale_fixers = {
"			\ 'javascript': ['prettier', 'eslint'],
"			\ 'vue': ['prettier', 'eslint']
"			\}
"" 保存时自动使用eslint
"let g:ale_fix_on_save = 1
"" 只有在保存文件时检测文件状况
"let g:ale_linters_explicit = 1
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_insert_leave = 0
"let g:ale_lint_on_enter = 0
"" 高亮关闭
"let g:ale_set_highlights = 0
"" 关闭背景色
"highlight clear ALEErrorSign
"highlight clear ALEWarningSign
"" eslint保存
"map <F12> :ALEFix<CR>

"" snip 语法片段
"Plug 'sirver/ultisnips'
"Plug 'honza/vim-snippets'
"" 使用UltiSnipsEdit配置时垂直分割屏幕
"let g:UltiSnipsEditSplit="vertical"
"" 快捷键
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""  jsx语法、语法糖及高亮
Plug 'pangloss/vim-javascript'
" ➔ ⇨ ⇒= ═ ＝═-→→→▶⇐▶∇∆ ▷ ◀ ◁ ↩↷⇨∫◁►▷◅▻
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_super                = "◇"
let g:javascript_conceal_this                 = "◆"
let g:javascript_conceal_undefined            = "U"
let g:javascript_conceal_null                 = "N"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "ρ"
let g:javascript_conceal_static               = "#"
let g:javascript_conceal_arrow_function       = "►"
let g:javascript_conceal_return               = "◄"
let g:javascript_conceal_noarg_arrow_function = "◌"
let g:javascript_conceal_underscore_arrow_function = "B"
set conceallevel=1
"Plug 'othree/javascript-libraries-syntax.vim'
"let g:used_javascript_libs = 'jquery,underscore,backbone,react,flux'
"" vue语法
"Plug 'posva/vim-vue'

"filetype plugin indent on
"" rust语法
"Plug 'rust-lang/rust.vim'

"" 语法高亮
"Plug 'sheerun/vim-polyglot'
"" vim-jsx-pretty多彩配置
"let g:vim_jsx_pretty_colorful_config=1

" css颜色显示
" 显示颜色
" Plug 'ap/vim-css-color'

" 浮动窗口
Plug 'voldikss/vim-floaterm'
let g:floaterm_position="center"
let g:floaterm_width=0.9
let g:floaterm_height=0.3
let g:floaterm_wintype="split"
let g:floaterm_position="rightbelow"
let g:floaterm_autoclose=2
let g:floaterm_title="$1|$2"
" 开关
let g:floaterm_keymap_toggle = '<F8>'

" 功能列表
Plug 'majutsushi/tagbar'
nmap <F4> :TagbarToggle<CR>
" JSON 格式
let g:tagbar_type_json = {
    \ 'ctagstype' : 'json',
    \ 'kinds' : [
      \ 'o:objects',
      \ 'a:arrays',
      \ 'n:numbers',
      \ 's:strings',
      \ 'b:booleans',
      \ 'z:nulls'
    \ ],
   \ 'sro' : '.',
    \ 'scope2kind': {
    \ 'object': 'o',
      \ 'array': 'a',
      \ 'number': 'n',
      \ 'string': 's',
      \ 'boolean': 'b',
      \ 'null': 'z'
    \ },
    \ 'kind2scope': {
    \ 'o': 'object',
      \ 'a': 'array',
      \ 'n': 'number',
      \ 's': 'string',
      \ 'b': 'boolean',
      \ 'z': 'null'
    \ },
    \ 'sort' : 0
    \ }

" markdown 文件
" Plug 'tpope/vim-markdown'

" 打开浏览器
Plug 'tyru/open-browser.vim'

" uml 语法插件
Plug 'aklt/plantuml-syntax'

" PlantUML 文件实施展现图
Plug 'scrooloose/vim-slumlord'
" uml打开、保存等功能
Plug 'weirongxu/plantuml-previewer.vim'
au FileType plantuml let g:plantuml_previewer#plantuml_jar_path = get(
    \  matchlist(system('cat `which plantuml` | grep plantuml.jar'), '\v.*\s[''"]?(\S+plantuml\.jar).*'),
    \  1,
    \  0
    \)

" 包围代码块功能
" cs "'     修改
" ds "      删除
" ysiw ]    添加
" ysiw [    添加并加上空格
" yss]      整行添加
" V + S<p>  整段添加
Plug 'tpope/vim-surround'

" 中文帮助菜单
Plug 'yianwillis/vimcdoc'

" 数据库
" DBUI
" o / - 打开/切换抽屉选项 ( <Plug>(DBUI_SelectLine))
" S - 在垂直分割中打开 ( <Plug>(DBUI_SelectLineVsplit))
" d - 删除缓冲区或保存的 sql ( <Plug>(DBUI_DeleteLine))
" R - 重绘 ( <Plug>(DBUI_Redraw))
" A - 添加连接 ( <Plug>(DBUI_AddConnection))
" H - 切换数据库详细信息 ( <Plug>(DBUI_ToggleDetails))
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
let g:db_ui_use_nerd_fonts=1
let g:db_ui_icons = {
    \ 'expanded': '▾',
    \ 'collapsed': '▸',
    \ 'saved_query': '*',
    \ 'new_query': '+',
    \ 'tables': '~',
    \ 'buffers': '»',
    \ 'connection_ok': '✓',
    \ 'connection_error': '✕',
    \ }
nnoremap <F5> <esc>:DBUI<CR>

" 函数范插件
Plug 'yaocccc/nvim-hlchunk'
" 支持哪些文件 默认为 '*.ts,*.js,*.json,*.go,*.c'
  let g:hlchunk_files = '*.ts,*.js,*.json,*.go,*.c,*.rs'
" 缩进线的高亮
  au VimEnter * hi HLIndentLine ctermfg=244
" 延时 默认为50
  let g:hlchunk_time_delay = 50
" 高亮线符号(逆时针) 默认为 ['─', '─', '╭', '│', '╰', '─', '>']
  let g:hlchunk_chars=['─', '─', '╭', '│', '╰', '─', '>']
" 最大支持行数 默认3000(超过5000行的文件不使用hlchunk)
  let g:hlchunk_line_limit = 5000
" 最大支持列数 默认100(超过500列的文件不使用hlchunk)
  let g:hlchunk_col_limit = 500

" 高亮关键词，代替传统*
Plug 'lfv89/vim-interestingwords'
let g:interestingWordsDefaultMappings = 0
" 开启高亮
nnoremap <silent> * :call InterestingWords('n')<cr>
vnoremap <silent> * :call InterestingWords('v')<cr>
" 清除所有高亮
nnoremap <silent> <leader>k :call UncolorAllWords()<cr>

" 上/下一个
nnoremap <silent> n :call WordNavigation(1)<cr>
nnoremap <silent> N :call WordNavigation(0)<cr>

Plug 'neoclide/coc.nvim'

" coc用
set shortmess+=c
" 使用 <c-space> 弹出
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" 回车确认功能项
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"  `[g` and `]g` 
" 错误诊断
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" 定义跳转
nmap <silent> gd <Plug>(coc-definition)
" 定义列表
nmap <silent> gy <Plug>(coc-type-definition)
" 实现列表
nmap <silent> gi <Plug>(coc-implementation)
" 参考
nmap <silent> gr <Plug>(coc-references)

" ''双击 查看类型详情
nnoremap <silent> '' :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" 重命名
nmap <leader>rn <Plug>(coc-rename)

" 格式化选中代码
xmap <F9> <Plug>(coc-format-selected)
nmap <F9> <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" 代码独立为函数
" <leader> + aap
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" 当前buff下的问题显示.
nmap <F10>  <Plug>(coc-codeaction)
" 代码修复.
nmap <F12>  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
" nmap <leader>cl  <Plug>(coc-codelens-action)

" 对象全包
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
" 函数全包
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" 屏幕滑动
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" 状态栏，添加airline
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" coclist 功能项列表
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ----- coc 其他插件的配置

" coc-highlight 插件高亮显示.
autocmd CursorHold * silent call CocActionAsync('highlight')

" coc-prettier 配置
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" coc-snippets
" C-n/p 上选项，<tab>完成选项
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'
" 使用leader x 打开 snippets 列表
map <leader>x <esc>:CocList snippets<CR>
map <leader>X <esc>:CocCommand snippets.editSnippets<CR>

" coc-git
" :CocCommand git.copyUrl将当前行的 url 复制到剪贴板
" :CocCommand git.chunkInfo在光标下显示区块信息。
" :CocCommand git.chunkUndo撤消当前块。
" :CocCommand git.chunkStage阶段当前块。
" :CocCommand git.chunkUnstage取消暂存包含当前行的块。
" :CocCommand git.diffCached在预览窗口中显示缓存的差异。
" :CocCommand git.showCommit显示当前块的提交。
" :CocCommand git.browserOpen在浏览器中打开当前行
" :CocCommand git.foldUnchanged折叠当前缓冲区的未更改行。
" :CocCommand git.push将当前分支的代码推送到远程。
" :CocCommand git.toggleGutters在符号列中切换 git gutters。
nnoremap [p <esc>:CocCommand git.chunkInfo<CR>
nnoremap [d <esc>:CocCommand git.diffCached<CR>
nnoremap [c <esc>:CocCommand git.showCommit<CR>

call plug#end()


source ~/.config/nvim/db.vim
