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

Plug 'wellle/targets.vim'

Plug '907th/vim-auto-save'
Plug 'cespare/vim-toml'

Plug 'bkad/CamelCaseMotion'

Plug 'psf/black'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

Plug 'machakann/vim-sandwich'

Plug 'easymotion/vim-easymotion'

Plug 'goldfeld/vim-seek'

call plug#end()

set background=dark

colorscheme palenight

let g:auto_save = 1
let g:auto_save_silent = 1
" Auto-save after updatetime in normal mode
let g:auto_save_events = ["BufLeave", "CursorHold", "FocusLost"]
set updatetime=1000

" Disable closing markdown preview browser tab whenever leaving .md buffer
let g:mkdp_auto_close = 0
nmap <C-p> <Plug>MarkdownPreviewToggle

" Disable swap files
set noswapfile

if (has("termguicolors"))
  set termguicolors
endif

" coc navigation bindings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ge <Plug>(coc-diagnostic-next-error)
nmap <silent> gE <Plug>(coc-diagnostic-prev-error)
nmap <silent> gw <Plug>(coc-diagnostic-prev)
nmap <silent> gW <Plug>(coc-diagnostic-next)
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

" Git conflict resolution
function! OpenGitDiff(split_direction)
    " three-way git diff for a given file

    " close other buffers before opening the split
    only

    if a:split_direction == 'v'
        Gvdiffsplit!
    elseif a:split_direction == 'h'
        Gdiffsplit!
    endif
endfunction

" In git diff: apply our (left) version of selected hunk
nnoremap cgh :diffget //2<CR>
" In git diff: apply their (right) version of selected hunk
nnoremap cgl :diffget //3<CR>
" In git diff: apply selected hunk to the working copy
nnoremap cp :diffput //1<CR>
" Write the current file to the git index and stage it
nnoremap cS :Gwrite!<CR>

" Leader key bindings
map <Space> <Leader>

nnoremap <Leader>S :source $MYVIMRC<CR>

nmap <Leader><Space> <Plug>(easymotion-overwin-f2)
nnoremap <Leader><Backspace> :only<CR>
nnoremap <Leader>b :Clap buffers<CR>
nnoremap <Leader>c :call OpenGitDiff('v')<CR>
nnoremap <Leader>C :call OpenGitDiff('h')<CR>
nnoremap <Leader>d :CocDiagnostics<CR>
nnoremap <Leader>e :CocCommand explorer<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :Clap grep<CR>
nnoremap <Leader>G :Clap grep2<CR>
nnoremap <Leader>h :Clap history<CR>
nnoremap <Leader>l :Clap loclist<CR>
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<left><left>
nmap <Leader>R <Plug>(coc-rename)
nnoremap <Leader>s :CocList --auto-preview --interactive symbols<CR>
nnoremap <Leader>q :Clap quickfix<CR>
nnoremap <Leader>w :Clap grep ++query=<cword><CR>
nnoremap <Leader>v :Vista!!<CR>
nnoremap <Leader>y :Clap yanks<CR>
nnoremap <Leader>/ :Clap search_history<CR>
nnoremap <Leader>: :Clap command_history<CR>

vmap <Leader>r :s///g<left><left><left>

" Leader key for camel and snake case motions (w, b, e)
let g:camelcasemotion_key = ','

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

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
nnoremap <silent> <Backspace> :nohlsearch<CR>

let g:SeekKey = '<CR>'

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

" Workaround for lightline not updating after closing clap window
autocmd User ClapOnExit call lightline#update()

function! FormatPython()
    " Searches from the current file dir upwards
    if len(findfile("pyproject.toml", ".;"))
        Black
    endif
endfunction

" Automatic code formatting
augroup auto_formatting
  autocmd!
  autocmd BufWritePre *.py silent! undojoin | call FormatPython()
augroup END

