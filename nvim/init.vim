call plug#begin()
" Início da instalação do fzf
" O fzf serve para fazer buscas no estilo do sublime text, com Ctrl + P
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Conquer of Completation - autocomplete - intelisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Explorar de arquivos
Plug 'kyazdani42/nvim-tree.lua'

" Adiciona comentários no código
Plug 'preservim/nerdcommenter'

" Debugger
Plug 'puremourning/vimspector'

" Suporte para Git no Vim
Plug 'tpope/vim-fugitive'

" Fazer fechamento automático de pares (parênteses, colchetes, aspas, etc)
Plug 'jiangmiao/auto-pairs'

" Facilitar manipulação de 'surroundings' (pares)
Plug 'tpope/vim-surround'

" Adicionar syntax hightlight para várias linguagens
Plug 'sheerun/vim-polyglot'

" Temas
Plug 'sfi0zy/atlantic-dark.vim'
Plug 'owickstrom/vim-colors-paramount'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'joshdick/onedark.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'franbach/miramare'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'sainnhe/everforest'
Plug 'bluz71/vim-moonfly-colors'
Plug 'joshdick/onedark.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Suporte para Styled Components
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Suporte para smooth scrolling
Plug 'yuttie/comfortable-motion.vim'

" Plug para se mover rápido
Plug 'phaazon/hop.nvim'

" Adiciona um terminal dentro do vim
Plug 'voldikss/vim-floaterm'

" Adiciona Atalhos para funções
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'

" Adiciona ícones ao vim
Plug 'kyazdani42/nvim-web-devicons' " for file icons

" Plugin para mover os blocos mais fácil
Plug 'matze/vim-move'

" Plugins para mostrar um preview da busca de arquivos
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Plugin para realizar buscas dentro dos arquivos
Plug 'eugen0329/vim-esearch'

" Plugin para mostrar todos os registros
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }

" Plugin de suporte para a sintaxe do .edge
Plug 'watzon/vim-edge-template'

" Plugin para mostrar ver branchs e commits
Plug 'rbong/vim-flog'

" Plugin para criar uma GUI para o git
Plug 'TimUntersberger/neogit'

" Plugin para repetir comandos com '.'
Plug 'tpope/vim-repeat'

" Plugin para melhorar a movimentação
Plug 'chaoren/vim-wordmotion'
call plug#end()

" Carrega o plug hop
lua require'hop'.setup()

" Carrega o plug nvim-tree
lua require'nvim-tree'.setup()

" Configuração do FZF --------------------------------------------------------
" Não exibir janela de pré-visualização de conteúdo do arquivo
let g:fzf_preview_window = []

let g:fzf_layout =
\ { 'window':
\ { 'width': 0.98, 'height': 0.7, 'yoffset': 0.94, 'border': 'rounded' }
\ }

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Não exibir janela de pré-visualização de conteúdo do arquivo
let g:fzf_preview_window = []

" Posicionamento da janela do FZF (v2)
let g:fzf_layout =
\ { 'window':
\ { 'width': 0.98, 'height': 0.7, 'yoffset': 0.94, 'border': 'rounded' }
\ }

:nnoremap <F2> :Buffers<CR>

" Define atalhos para expandir o resultado da busca do fzf
" para horizontal, vertical e na tela atual
" e define o tamanho da tela de busca para 30% da tela atual
let g:fzf_action = {
\ 'ctrl-s': 'split',
\ 'ctrl-v': 'vsplit',
\ 'ctrl-t': 'tabedit',
\ }
let g:fzf_layout = { 'down': '~30%' }

" Cores do FZF devem casar com as cores do tema
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
\ 'bg':      ['bg', 'Normal'],
\ 'hl':      ['fg', 'Comment'],
\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+':     ['fg', 'Statement'],
\ 'info':    ['fg', 'PreProc'],
\ 'border':  ['fg', 'Ignore'],
\ 'prompt':  ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker':  ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header':  ['fg', 'Comment'] }

" Cores ---------------------------------------------------------------------

" Ativa o suporte para 256 cores
set termguicolors

" Habilita syntax highlight
syntax enable
 " [TEMA] Configurações para tema everforest ------------------------------

" Ativa o tema everforest
 let g:everforest_background = 'hard'
 colorscheme everforest 

" Ativa o tema moonfly
" let g:everforest_background = 'hard'
" colorscheme moonfly

" [TEMA] Configurações para tema dracula ------------------------------

" Ativa o tema dracula
" colorscheme dracula

" [TEMA] Configurações para tema srcery ------------------------------

" Ativa o tema srcery
"colorscheme srcery

" [TEMA] Configurações para tema spaceduck ------------------------------

" Ativa o tema spaceduck
" colorscheme spaceduck

" [TEMA] Configurações para tema miramare ------------------------------

" Ativa o tema miramare
"colorscheme miramare

" [TEMA] Configurações para tema onedark ------------------------------

" Ativa o tema onedark
"colorscheme onedark

" [TEMA] Configurações para tema moonfly ------------------------------

" Ativa o tema moonfly
"colorscheme moonfly

" [TEMA] Configurações para tema gruvbox ------------------------------------

"Ativa o tema gruvbox
"let g:gruvbox_contrast_dark='hard'
"colorscheme gruvbox

" [TEMA] Configurações para tema atlantic dark ------------------------------

" Ativa o tema atlantic-dark
" colorscheme atlantic-dark

" [TEMA] Configurações para tema paramount ----------------------------------

" Ativa o tema paramount
" colorscheme paramount

" [TEMA] Configurações para tema ayu ----------------------------------

" Ativa o tema ayu
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu

"" [TEMA] Configurações para tema paramount ----------------------------------

"set background=dark
"colorscheme palenight

"" [TEMA] Configurações para tema onedark ----------------------------------

" colorscheme onedark
 
" Configurações vim dev icons
set encoding=utf8

" Configuração do plugin COC ------------------------------------------------

" Add `:OR` comando para organizar os importes no buffer atual
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Comando para definir o prettier como formatador padrão
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Atalho para listar erros na página
nnoremap <Leader>l <cr>:CocDiagnostics<cr>

" Usar Ctrl + Espaço para abrir autocomplete no modo de inserção
inoremap <silent><expr> <c-space> coc#refresh()

" Configurações do coc
let g:coc_global_extensions=[
\ 'coc-css',
\ 'coc-stylelint',
\ 'coc-docker',
\ 'coc-yaml',
\ 'coc-eslint',
\ 'coc-json',
\ 'coc-html',
\ 'coc-prettier',
\ 'coc-highlight',
\ 'coc-tsserver',
\ 'coc-vimlsp',
\ 'coc-emmet',
\ ]

" Espaços e Tabs -----------------------------------------------------------

" Define tabs como espaços
set expandtab

" Número de espaços visuais ao pressionar a tecla TAB
set tabstop=2

" Número de espaços contados em uma tabulação quando estiver editando
set softtabstop=2

" Número de espaços contados em uma tabulação em nova linha
set shiftwidth=2

" UI e Layout ----------------------------------------------------------------

" Remove a marca da linha atual
set nocursorline

" Mostra os números das linhas
set number

" Mostra o números das linhas em relação a posição do cursor
set relativenumber

" Ativa o mouse
set mouse=a

" Pode deixar o nvim lento, mas garantido que syntax highlight vai
" sempre funcionar
autocmd BufEnter * :syntax sync fromstart

" Comportamentos do vim ------------------------------------------------------

" Permite editar outros arquivos sem salvar um antes de abrir outro
set hidden

" permite ter uma pré-visualização antes de fazer uma substituição com :%s
set inccommand=split

" Permite copiar do clipboard para o vim e do vim para o clipboard
set clipboard=unnamedplus

" Destaca os resultados da busca
set hlsearch

" Ignora letras maiúsculas e minúsculas na busca
set ignorecase

" Sobrescreve o `ignorecase` quando houver caracteres em maísuculo na busca
set smartcase

" Adiciona quebra de linhas quando elas ficam grandes
set lbr

" Define diretório para salvar histórico de `desfazer`
set undodir=~/.config/nvim/undos

" Salva automaticamente um histórico de ações para `desfazer`, ainda que o vim
" seja fechado
set undofile

" Update fzf.vim actions for bindings like command-t
let g:fzf_action = {
\ 'ctrl-s': 'split',
\ 'ctrl-t': 'tabedit',
\ 'ctrl-v': 'vsplit',
\ }
let g:fzf_layout = { 'down': '~40%' }

" Atalhos com a tecla <leader> -----------------------------------------------

" Define a tecla `leader` como a espaço
let mapleader="\<space>"

" Atalho para edição do arquivo de configuração do neovim. Só pressionar
" a tecla <leader> e digitar `ev` (edit vim) no modo normal
nnoremap <leader>ev :e ~/.config/nvim/init.vim<cr>

" Atalho para recarregar o vim após uma edição no arquivo de configuração
"(source vim) - <leader> seguido de `sv`
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

" Atalhos do vimspector
nnoremap <Leader>dc :call vimspector#Continue()<CR>
nnoremap <Leader>dr :call vimspector#Restart()<CR>
nnoremap <Leader>dq :call vimspector#Reset()<CR>
nnoremap <Leader>db :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dw ::VimspectorWatch
nnoremap <Leader>dx :call vimspector#CleanLineBreakpoint()<CR>
nnoremap <Leader>di <Plug>VimspectorBalloonEval

" Remover highlight da busca com <leader><space>
map <silent> <leader><cr> :noh<cr>

" Formata somente o código selecionado
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
  
" Mostra as opções para se mover no código
nmap <S-s> <Cmd>HopWord<CR>

" Atalho para o floaterm
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_toggle = '<F8>'

" Outros atalhos ------------------------------------------------------------

" Formata o arquivo atual
nmap <silent> ff <Plug>(coc-format)

" Mostra todos os buffers abertos
:nnoremap <c-o> :Buffers<CR>

" Atalho para se mover entre os buffers abertos na mesma janela
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Atalho para ultisnips
let g:UltiSnipsExpandTrigger='<c-j>'

" Abre uma nova janela vazia
nnoremap T :tabnew <cr>

" Se move para o próximo buffer
nnoremap <Tab> :bn <cr>

" Se move para o buffer anterior
nnoremap <S-Tab> :bp <cr>

" Entra no modo visual
inoremap kj <ESC>

" Salvar usando CTRL + S
nnoremap <c-s> :w! <cr>
imap <c-s> <Esc>:w<CR>a

" Sair usando CTRL + q
nnoremap <c-q> :q! <cr>

" Define o atalho Ctrl + P para utilizar o fzf
nnoremap <c-p> :Telescope find_files<cr>

" Atalhos para o explorador de arquivos
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>

" Permiter usar o `enter` para
" realizar a confirmação do autocomplete
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Atalho para ir para as definições da função
nmap <silent> gd <Plug>(coc-definition)

" Fecha o buffer atual
nnoremap <c-k> :bd <cr>

" Outros ---------------------------------------------------------------

" Permite que o cursor acompanhe a rolagem da tela
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" Permitir fontes Powerline
let g:airline_powerline_fonts=1

" Retorna na última posição quando o arquivo é aberto
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" Atualiza o buffer caso o código seja atualizado
" por um git pull por exemplo
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | checktime | endif
autocmd FileChangedShellPost *
\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Mostra os arquivos ocultos no nerdthree
let NERDTreeShowHidden=1

let g:python3_host_prog = '/usr/bin/python3'

" Backups --------------------------------------------------------------------
" Inicia o backup
set backup

" Define o diretório para os backups
set backupdir=~/.config/nvim/backups

" Arquivos do qual backups devem ser ignorados
set backupskip=/tmp/*

" Salva o arquivo no backup
set writebackup

" Ajuste para hot reloading (desabilitar o 'safe write')
set backupcopy=yes

" Impede do cursor voltar para o começo da linha
" quando há espaços em branco
set virtualedit=all

" Salva como os folds foram deixados
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

" Função para renomear arquivos
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>
"command! RenameFile :call RenameFile()

" Atalhos para mudar o nível do folding
nnoremap z0 :setlocal foldlevel=0<cr>
nnoremap z1 :setlocal foldlevel=1<cr>
nnoremap z2 :setlocal foldlevel=2<cr>
nnoremap z3 :setlocal foldlevel=3<cr>
nnoremap z4 :setlocal foldlevel=4<cr>
nnoremap z5 :setlocal foldlevel=5<cr>

" Configuração de folding  ---------

" Ativa o folding
set foldenable

" Especifica o espaço do lado esquerdo da tela 
" que indica que existe um fold
set foldcolumn=2

" Tipo de folding utilizado
set foldmethod=marker

" Abre os arquivos com todos os folds abertos
set foldlevelstart=99

" Tipos de comandos que dão unfold automáticamente
" quando utilizados no fold
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo

" Função para melhorar a visão do folding
function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
    return line . ' …' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction

" Usa a função para especificar como o texto será
" exibido quando estiver em fold
set foldtext=MyFoldText()  
