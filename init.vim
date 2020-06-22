" __   _____ __  __    ___ ___  _  _ ___ ___ ___ 
" \ \ / /_ _|  \/  |  / __/ _ \| \| | __|_ _/ __|
"  \ V / | || |\/| | | (_| (_) | .` | _| | | (_ |
"   \_/ |___|_|  |_|  \___\___/|_|\_|_| |___\___|

"------------Key bindings------------------------------------------
"Change the <Leader> key to space
let mapleader=" "
"Toggle Nerdtree
map <C-b> :NERDTreeToggle<CR>
"Toggle nerd commenter
"<Leader>c<Space>
"Activate vim which key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
"Move between windows with ctrl + vim keys
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
"Use alt + vim keys to resize window
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>
"Better block tabbing
vnoremap < <gv
vnoremap > >gv

"Invoke syntax checking on gdscript files on save
autocmd BufWritePost *gd !godot_server --script % --check-only

"------------Vim Plug Plugins--------------------------------------
call plug#begin(stdpath('data') . '/plugged')
"Color Shemes
"Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
"Nerdtree file explorer
Plug 'preservim/nerdtree'
"Vim devicons for the images besides the folders/files
Plug 'ryanoasis/vim-devicons'
"Git integration with Nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
"CtrlP fuzzy finder like VS-Code
Plug 'kien/ctrlp.vim'
"Nerdcommenter
Plug 'preservim/nerdcommenter'
"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"syntastic for syntax checking
"Plug 'vim-syntastic/syntastic'
"Coc.nvim for code completion
"Installed Extensions for coc: coc-java coc-css coc-html coc-tsserver coc-snippets coc-python coc-marketplace coc-vimtex coc-flutter
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Show function parameters
Plug 'shougo/echodoc.vim'
"Vim which key for showing key bindings
Plug 'liuchengxu/vim-which-key'
"Vim sneak for easy vim motion
Plug 'justinmk/vim-sneak'
"Vim Quickscope for better t and f bindings
Plug 'unblevable/quick-scope'   
"Repeat vim extends . function
Plug 'tpope/vim-repeat'
"Git plugin to enable :G command
Plug 'tpope/vim-fugitive'
"Vim surround
Plug 'tpope/vim-surround'
"Vim autoclose html tags
Plug 'alvan/vim-closetag'
"Godot support
Plug 'clktmr/vim-gdscript3'
"Latex support
Plug 'lervag/vimtex'
"Zeal integration
Plug 'KabbAmine/zeavim.vim'
"Dart support for flutter
Plug 'dart-lang/dart-vim-plugin'
call plug#end()


"-----------------------------------------------------------------
"  ___      _   _   _              
" / __| ___| |_| |_(_)_ _  __ _ ___
" \__ \/ -_)  _|  _| | ' \/ _` (_-<
" |___/\___|\__|\__|_|_||_\__, /__/
"                         |___/    
"-----------Set tabs----------------------------------------------
set tabstop=4
set expandtab
set shiftwidth=4
"-----------Nerdtree settings-------------------------------------
"Auto close vim if only Nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowLineNumbers = 0
"-----------Nerdcommenter settings--------------------------------
let g:NERDCommentEmptyLines = 1
"-----------Vim devicons settings---------------------------------
set encoding=UTF-8
"-----------Airline settings--------------------------------------
let g:airline_theme='base16_gruvbox_dark_hard'
"-----------Syntastic settings------------------------------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"-----------Coc.nvim settings-------------------------------------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>":
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

let g:coc_snippet_next = '<tab>'

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"-----------Vim which key settings--------------------------------
set timeoutlen=500
"-----------Vim sneak settings------------------------------------
let g:sneak#label = 1
let g:sneak#s_next = 1
let g:sneak#prompt = '🔎 '
"-----------Vim Quickscope options--------------------------------
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" Set max lines
let g:qs_max_chars=200
" Change highlight colors
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#a3daff' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#ff80c0' gui=underline ctermfg=81 cterm=underline
augroup END
"-----------Echodoc.vim-------------------------------------------
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
" To use a custom highlight for the float window,
" change Pmenu to your highlight group
highlight link EchoDocFloat Pmenu
"-----------Zealvim-----------------------------------------------
nmap <leader>z <Plug>Zeavim
vmap <leader>z <Plug>ZVVisSelection
nmap gz <Plug>ZVOperator
nmap <leader><leader>z <Plug>ZVKeyDocset
let g:zv_keep_focus = 0
"-----------Vim autoclose filetypes-------------------------------
let g:closetag_filetypes = 'html,xhtml,phtml'
"-----------Enable mouse------------------------------------------
set mouse=a
"-----------Set clipboard-----------------------------------------
set clipboard+=unnamedplus
"------------Auto toggle relative and absolute numbers-------------
set number relativenumber

augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
"------------Auto close brackets----------------------------------
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
"-----------Disable comment continuation on new line--------------
set formatoptions-=cro
"-----------General vim settings----------------------------------
syntax enable
set smarttab
set smartindent
set hidden
set showtabline=1
set noshowmode
"-----------Color schemes and so on-------------------------------
set termguicolors
colorscheme gruvbox
