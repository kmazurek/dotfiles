set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'

Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'liuchengxu/vista.vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'wellle/targets.vim'

Plug '907th/vim-auto-save'
Plug 'cespare/vim-toml'

call plug#end()

set background=dark

colorscheme palenight

let g:auto_save = 1
let g:auto_save_silent = 1
set noswapfile

if (has("termguicolors"))
  set termguicolors
endif

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" fzf: use ripgrep and preview
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Leader key bindings
map <Space> <Leader>

nmap <Leader>S :source $MYVIMRC<CR>

nmap <Leader><Space> :Clap buffers<CR>
nmap <Leader>e :CocCommand explorer<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>g :Clap grep<CR>
nmap <Leader>h :Clap history<CR>
nmap <Leader>l :Clap loclist<CR>
nmap <Leader>r :%s/\<<C-r><C-w>\>//g<left><left>
nmap <Leader>s :CocList --auto-preview --interactive symbols<CR>
nmap <Leader>w :Clap grep ++query=<cword><CR>
nmap <Leader>v :Vista!!<CR>
nmap <Leader>y :Clap yanks<CR>

vmap <Leader>r :s///g<left><left><left>

augroup clap
    au FileType clap_input inoremap <silent> <buffer> <Esc> <Esc>:call clap#handler#exit()<CR>
augroup end

" vim-clap floating window parameters
let g:clap_layout = { 'relative': 'editor', 'height': '40%' }

" Splitting currently active window
nnoremap <C-Space>f :vsp<CR>
nnoremap <C-Space>j :sp<CR>
set switchbuf=useopen,usetab
set splitbelow
set splitright

" Navigation between splits
nnoremap <A-j> <C-W><C-J>
nnoremap <A-k> <C-W><C-K>
nnoremap <A-l> <C-W><C-L>
nnoremap <A-h> <C-W><C-H>

" Hit return to clear search highlight.
nnoremap <silent> <CR> :nohlsearch<CR>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Automatically reload files changed externally
set autoread
au FocusGained * :checktime

let g:vista_default_executive = 'coc'
let g:vista_sidebar_width = 50

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
