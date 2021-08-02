call plug#begin()
" Início da instalação do fzf
" O fzf serve para fazer buscas no estilo do sublime text, com Ctrl + P
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Conquer of Completation - autocomplete - intelisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Explorar de arquivos
Plug 'preservim/nerdtree'

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

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Suporte para Styled Components
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Adiciona suporte ao prisma
Plug 'pantharshit00/vim-prisma'

" Suporte para smooth scrolling
Plug 'yuttie/comfortable-motion.vim'
call plug#end()

" Configuração do FZF --------------------------------------------------------
" Não exibir janela de pré-visualização de conteúdo do arquivo
let g:fzf_preview_window = []

let g:fzf_layout = 
\ { 'window': 
  \ { 'width': 0.98, 'height': 0.7, 'yoffset': 0.94, 'border': 'rounded' } 
\ } 


"let g:comfortable_motion_no_default_key_mappings = 1
"
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

" [TEMA] Configurações para tema gruvbox ------------------------------------

" Ativa o tema gruvbox
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
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" Configuração do plugin COC ------------------------------------------------

" Add `:OR` comando para organizar os importes no buffer atual
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Comando para definir o prettier como formatador padrão
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Usar Ctrl + Espaço para abrir autocomplete no modo de inserção
inoremap <silent><expr> <c-space> coc#refresh()

" Configurações do coc
let g:coc_global_extensions=[
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

" Atalho para mover a linha atual para baixo
nnoremap <leader>- ddp

" Atalho para mover a linha atual para cima
nnoremap <leader>_ ddkP

" Remover highlight da busca com <leader><space>
map <silent> <leader><cr> :noh<cr>

" Formata somente o código selecionado
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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

" Abre uma nova janela vazia
nnoremap T :tabnew <cr>

" Se move para o próximo buffer 
nnoremap <Tab> :bn <cr>

" Se move para o buffer anterior
nnoremap <S-Tab> :bp <cr>

" Entra no modo visual
inoremap jj <ESC>

" Salvar usando CTRL + S
nnoremap <c-s> :w! <cr>
imap <c-s> <Esc>:w<CR>a

" Sair usando CTRL + q
nnoremap <c-q> :q! <cr>

" Define o atalho Ctrl + P para utilizar o fzf 
nnoremap <c-p> :Files<cr>

" Atalho para abrir o explorador de arquivos nerdthree
map <C-n> :NERDTreeToggle<CR>

"Seleciona todo o conteúdo do arquivo
nnoremap <c-a> <esc>ggVG<cr>

" Permiter usar o `enter` para 
" realizar a confirmação do autocomplete
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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


