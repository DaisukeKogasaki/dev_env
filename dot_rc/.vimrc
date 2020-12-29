"タブ、空白、改行の可視化
set list
"set listchars=tab:>.,trail:-,eol:$,extends:>,precedes:<,nbsp:%
set listchars=tab:>.,trail:-,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

set nocompatible
set backspace=indent,eol,start
set number

"ファイル末尾改行
set binary noeol
" タブ幅
set ts=2 sw=2
set softtabstop=2
set expandtab

" インデント
set smartindent

"検索時にヒット部位の色を変更
set hlsearch

"日本語(マルチバイト文字)行の連結時には空白を入力しない。
set formatoptions+=mM

"2バイト文字をめり込まなくする○
if exists('&ambiwidth')
  set ambiwidth=double
endif

"画面最後の行をできる限り表示する。
set display+=lastline

"ヤンクをクリップボードへコピー
"set clipboard=unnamed,autoselect
set clipboard=unnamedplus

"swapファイルを作らない
set noswapfile

"検索時のハイライトを<ESC>2回で消す
nnoremap <ESC><ESC> :noh<CR>

"ウィンドウ分割時の幅調整
noremap <C-j><C-j> <C-w>-
noremap <C-k><C-k> <C-w><C-+>
noremap <C-h><C-h> <C-w><
noremap <C-l><C-l> <C-w>>

"カーソルの回り込み
set whichwrap=b,s,[,],<,>

" -------------------
" 日本語の設定
" -------------------
set termencoding=utf-8
set encoding=japan
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp
set fenc=utf-8
set enc=utf-8

" -----------------------
" ステータスバーの表記
" -----------------------
" ファイル名表示
set statusline=%F
" 変更チェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" これ以降は右寄せ表示
set statusline+=%=
" file encoding
set statusline+=[ENC=%{''.(&fenc!=''?&fenc:&enc).'/'.&fileformat.''}]
" 現在行数/全行数
set statusline+=[LOW=%l/%L]
"ファイル名を常に表示
set laststatus=2
"tagsを読み込む
set tags=~/tags

colorscheme desert
