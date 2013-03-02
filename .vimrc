" 環境毎の特殊な設定(gitで管理しない)
if filereadable($HOME . ".vimrc.local")
  source ~/.vimrc.local
endif

" プラグイン関連の設定
if filereadable($HOME . ".vimrc.plugins")
  source ~/.vimrc.plugins
endif


" 日本語の設定
" 表示用の文字コード種(ターミナルインスペクタの設定に合わせる)
set encoding=utf-8

" 保存時に適用する文字コード種
set fenc=utf-8

" 文字コード自動判別の候補とする文字コード種を列挙
set fencs=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932




" 表示関連
" 配色(カラースキーマ)
colorscheme desert

" シンタックスカラー表示を有効にする
syntax on

" 行番号を表示する
set number

" 新しい行のインデントを現在行と同じにする
set autoindent

" 新しい行を作ったときに高度な自動インデントを行う
set smartindent

" 行頭の余白内でTabを打ち込むと、shiftwidthの数だけインデントする
set smarttab

" タブ文字、行末など、不可視文字を表示する
set list

" listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<

" シフト移動幅
set shiftwidth=2

" ファイル内のTabが対応する空白の数
set tabstop=2
set softtabstop=0

" 位置情報を表示
set ruler

" ステータスラインを表示
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.&fenc.']['.&ff.']'}%=%l,%c%V%8P

" 長い行を折り返さない
set nowrap


" 操作関連
" クリップボードをWindowsと連携
" set clipboard=unnamed

" vi 互換をOFF
set nocompatible

" タブの代わりに空白文字を挿入する
set expandtab

" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden

" インクリメンタルサーチを行う
set incsearch

" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

" 検索時に大文字を含んでいたら大/小を区別
set smartcase

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" 検索をファイルの先頭へループしない
set nowrapscan




" パス関連
" バックアップファイルを作るディレクトリ
set backupdir=$HOME/.vimbackup

" ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer

" スワップファイル用のディレクトリ
set directory=$HOME/.vimbackup


" オートコマンド関連
" 入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

" ファイル形式の検出
filetype on

" ファイル形式別プラグインのロード
filetype plugin on

" ファイル形式別インデントのロード
filetype indent on


" omni補完
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<TAB>"
  else
    if pumvisible()
      return "\<C-N>"
    else
      return "\<C-N>\<C-P>"
    end
  endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" rubycomplete.vim
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1

