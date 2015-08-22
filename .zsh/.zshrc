######################################################################
### OS共通のエイリアス設定
######################################################################


# ----------------------------------------------------------------------
# Lang:
# ----------------------------------------------------------------------
# NOTE: locale の設定
if [ -z "$LANG" ]; then
  export LANG=ja_JP.UTF-8
  export LESSCHARSET=utf-8
fi


# ----------------------------------------------------------------------
# Keyboard:
# ----------------------------------------------------------------------
# NOTE: キー操作をemacs風にする
bindkey -e

# NOTE: CTRL-d でログアウトしない
setopt ignore_eof


# ----------------------------------------------------------------------
# Histroy:
# ----------------------------------------------------------------------
# NOTE: メモリ上のヒストリ数
export HISTSIZE=100

# NOTE: ファイルに保存するヒストリ数とそのファイル
export SAVEHIST=$HISTSIZE
export HISTFILE=${ZDOTDIR}/.zsh_history

# NOTE: ヒストリファイルにコマンドラインだけでなく実行時刻と実行時間も保存する
setopt extended_history

# NOTE: 同じコマンドラインを連続で実行した場合はヒストリに登録しない
setopt hist_ignore_dups

# NOTE: スペースで始まるコマンドラインはヒストリに登録しない
setopt hist_ignore_space

# NOTE: ヒストリから冗長なスペースを削除する
setopt hist_reduce_blanks

# NOTE: すぐヒストリファイルに追記する
setopt inc_append_history


# ----------------------------------------------------------------------
# Prompt:
# ----------------------------------------------------------------------
# NOTE: PROMPT内で変数展開・コマンド置換・算術演算を実行する
setopt prompt_subst
setopt transient_rprompt

# NOTE: プロンプトの表示
autoload colors
colors
case ${UID} in
0)
  PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
  ;;
*)
  # NOTE: Color
  DEFAULT=$'%{\e[1;0m%}'
  RESET="%{${reset_color}%}"
  GREEN="%{${fg[green]}%}"
  BLUE="%{${fg[blue]}%}"
  RED="%{${fg[red]}%}"
  CYAN="%{${fg[cyan]}%}"
  WHITE="%{${fg[white]}%}"

  # NOTE: Prompt
  PROMPT='${RESET}[${GREEN}%m${WHITE}:%c]${WHITE}%% ${RESET}'
  RPROMPT='${RESET}${WHITE}[${CYAN}%(5~,%-2~/.../%2~,%~)% ${WHITE}]${RESET}'
  ;;
esac


# ----------------------------------------------------------------------
# 補完:
# ----------------------------------------------------------------------
# NOTE: 初期化
autoload -U compinit
compinit


# NOTE: zsh-completionsの設定
compinit -u -d ${ZDOTDIR}/.zcompdump


# ----------------------------------------------------------------------
# Alias:
# ----------------------------------------------------------------------
[ -f ${ZDOTDIR}/.zshrc.alias ] && source ${ZDOTDIR}/.zshrc.alias


# ----------------------------------------------------------------------
# OSごとの設定:
# ----------------------------------------------------------------------
case "${OSTYPE}" in
linux*)
  [ -f ${ZDOTDIR}/.zshrc.linux ] && source ${ZDOTDIR}/.zshrc.linux
  ;;
darwin*)
  [ -f ${ZDOTDIR}/.zshrc.osx ] && source ${ZDOTDIR}/.zshrc.osx
  ;;
cygwin*)
  [ -f ${ZDOTDIR}/.zshrc.cygwin ] && source ${ZDOTDIR}/.zshrc.cygwin
  ;;
esac


# ----------------------------------------------------------------------
# localの固有設定:
# ----------------------------------------------------------------------
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
