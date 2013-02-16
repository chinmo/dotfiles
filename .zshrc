# initial setup file for only interactive zsh
# This file is read after .zshenv file is read.

# -------------------------------------------------------
# key
## binding keys
bindkey -v

## Backspace
bindkey "^?" backward-delete-char

# -------------------------------------------------------
# ディレクトリ移動の挙動制御
## ディレクトリ名だけを入力してディレクトリ移動する
setopt auto_cd

## 自動的にpushdする
setopt auto_pushd

## ディレクトリスタックに同じものは追加しない
setopt pushd_ignore_dups

## pushd,popd時にディレクトリスタックを表示しない。ちょっとうざいよね
setopt pushd_silent

## ディレクトリスタックに記憶できる最大数
DIRSTACKSIZE=20

# cd したらついでに ls
function chpwd() { ls }


# -------------------------------------------------------
# less
# どれがいいのかわからない
# export JLESSCHARSET=japanese-utf8 #jlessで良く紹介される
# export JLESSCHARSET=utf8 #さらされてる設定で良く見かける
export LESSCHARSET=utf-8
export JLESSCHARSET=japanese # zshの本


# -------------------------------------------------------
# man
## 重複したパスを除去
typeset -U manpath

## (N-/) は、ディレクトリの存在をチェック&シンボリックリンクもOK
manpath=(/usr/*/man(N-/) /usr/local/*/man(N-/) /var/*/man(N-/))
export MANPATH


# -------------------------------------------------------
# ファイル操作

## コマンドの修正
setopt correct

## コマンド全体（引数とかも含む）
setopt correct_all

## 上書きリダイレクトの禁止
setopt no_clobber

## エディタ
export EDITOR=vim

## 複数のリダイレクトやパイプが可能に(適宜 tee や cat を省略)
setopt multios

# 最後がディレクトリ名で終わっている場合に末尾の / を取り除かない
setopt noautoremoveslash

# URL をコピペした時に自動でエスケープする
## http://memo.officebrook.net/20100401.html
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# zsh editor
## zed -f function_name で関数を参照、編集できる
autoload zed


# -------------------------------------------------------
# コマンドラインスタック

## スタックした内容を表示する
function stack_commandline() {
  POSTDISPLAY="
stack: $LBUFFER"
  zle push-input
}
zle -N stack_commandline

## ^Q, ^S へキーマップできる様にする
setopt noflowcontrol

## vi キーバインドだと ESC-q でスタックできないので変更
bindkey '^Q' stack_commandline

# -------------------------------------------------------
# 色

## デフォの ls -G の色
export LSCOLORS=gxfxcxdxBxegedabagacad

## coreutils をインスコしている環境や補完候補の色付けに使う
### デフォルト
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

## ~/.dircolors があれば、それをカラー設定に使う
if [ -f ~/.dircolors ]; then
  if type dircolors > /dev/null 2>&1; then
    eval $(dircolors ~/.dircolors)
  elif type gdircolors > /dev/null 2>&1; then
    eval $(gdircolors ~/.dircolors)
  fi
fi


# -------------------------------------------------------
# alias

if type gls > /dev/null 2>&1; then
  alias ls="gls --color"
fi

alias la="ls -a"
alias ll="ls -hl"




# -------------------------------------------------------
# History
[ -f .zshrc.history ] && source .zshrc.history

# Prompt
[ -f .zshrc.prompt ] && source .zshrc.prompt

# Completion
[ -f .zshrc.completion ] && source .zshrc.completion



