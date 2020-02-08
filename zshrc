if  [ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 > /dev/null ; then 
	exec startx
fi
powerline-daemon -q
. /usr/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bullet-train"
BULLETTRAIN_PROMT_ROOT=true
BULLETTRAIN_PROMT_SEPERATE_LINE=true
BULLETTRAIN_PROMT_ADD_NEWLINE=true

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

ENABLE_CORRECTION="true"

plugins=(
	colored-man-pages
	common-aliases
	cp
	man
	sudo
	ssh-agent
	tmux
	git
	zsh-syntax-highlighting
	zsh-completions
)

source $ZSH/oh-my-zsh.sh

bindkey -s "^[OM" "^M"

####User configuration###

# export MANPATH="/usr/local/man:$MANPATH"
compdef gpg2=gpg

# parallel make
export NUMCPUS=`grep -c '^processor' /proc/cpuinfo`
alias pmake='time nice make -j $NUMCPUS --load-average=$NUMCPUS'

# http://www.economyofeffort.com/2014/07/04/zsh/
export TERM=xterm-kitty
[ -n "$TMUX" ] && export TERM=tmux-256color

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# https://twitter.com/citizen428/status/902433159018561536
export FZF_DEFAULT_COMMAND='rg --files'

# Solarized Dark
export FZF_DEFAULT_OPTS=' --color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254 --color info:254,prompt:37,spinner:108,pointer:235,marker:235'

#You may need to manually set your language environment
export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
export LC_ALL=en_US.UTF-8

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

autoload -U compinit && compinit

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
  if [[ -n $SSH_CONNECTION ]]; then
	prompt_segment black default "@$HOST"
  fi
}
