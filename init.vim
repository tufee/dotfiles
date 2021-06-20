call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
 
Plug 'puremourning/vimspector' 
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'

Plug 'sheerun/vimrc'
Plug 'sheerun/vim-polyglot'

Plug 'sfi0zy/atlantic-dark.vim'
Plug 'owickstrom/vim-colors-paramount'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'mlaursen/vim-react-snippets'
call plug#end()

:nnoremap <F2> :buffers<CR>:buffer<Space>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" UltiSnips
let g:UltiSnipsExpandTrigger='<c-j>'
"let g:hardtime_default_on = 1

let g:vimspector_enable_mappings = 'HUMAN'

" moves current line down or up
nnoremap <leader>- ddp
nnoremap <leader>_ ddkP

"nnoremap F :Locate / <cr>

syntax enable
syntax on

colorscheme atlantic-dark
"colorscheme paramount

"autocmd vimenter * ++nested colorscheme gruvbox
"let g:gruvbox_contrast_dark='hard'
"colorscheme gruvbox


" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"Open and switch buffers
nnoremap T :tabnew <cr>
nnoremap <Tab> :bn <cr>
nnoremap <S-Tab> :bp <cr>
nnoremap <bar> :call OpenBuffer('v') <cr>



" Make it so any .env files are correctly styled. Normally only worked with .env
autocmd BufNewFile,BufRead * if expand('%t') =~ '.env' | set filetype=sh | endif

" Make it so that if files are changed externally (ex: changing git branches) update the vim buffers automatically
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | checktime | endif
autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"Visual mode
inoremap jj <ESC>

" Enable copy in nvim to system
set clipboard=unnamedplus 
" Enable filetype plugins
filetype plugin on
filetype indent on
filetype on

" Makes search act like search in modern browsers
set incsearch

" Highlight search results
set hlsearch

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" update tab behavior
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set nowrap 
" line breaking
set lbr

" Show line numbers
set number

" Show relative line numbers
set relativenumber

" Active mouse in Vim
set mouse=a

" Preview effects of commands like replace
set inccommand=split

" Leader key
let mapleader="\<space>"

" Open init.vim
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>

" Refresh init.vim
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

" Save file
nnoremap <c-s> :w! <cr>
imap <c-s> <Esc>:w<CR>a

" Exit file
nnoremap <c-q> :q! <cr>

" Browse file
nnoremap <c-p> :Files<cr>

" Update fzf.vim actions for bindings like command-t
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-t': 'tabedit',
      \ 'ctrl-v': 'vslit',
      \ }
let g:fzf_layout = { 'down': '~40%' }

" Open NerdTree
map <C-n> :NERDTreeToggle<CR>

" Command for set Prettier as default formater
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Shortcut for show autocomplete suggestions
inoremap <silent><expr> <c-space> coc#refresh()

"Coc config
let g:coc_global_extensions=[
      \ 'coc-eslint',
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-prettier',
     \ 'coc-highlight',
     \ 'coc-tsserver',
     \ 'coc-vimlsp',
     \ 'coc-emmet',
      \ 'coc-styled-components'
      \ ]

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" format file
nmap <silent> ff <Plug>(coc-format)

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set noswapfile

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=2000

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

"Show hidden files in nerdthree
let NERDTreeShowHidden=1

" ================================================================
" => Spell checking
" ================================================================
" always enforce spell checking in text files
autocmd BufRead,BufNewFile *.txt,*.md,COMMIT_EDITMSG setlocal spell

" linux doesn't do this by default, so enable it just to be safe
hi SpellBad cterm=underline

let g:airline_powerline_fonts = 1

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
au WinLeave * set nocursorline nocursorcolumn
"set nocursorline
