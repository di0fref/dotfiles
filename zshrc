
export ZSH=/Users/fref/.oh-my-zsh
ZSH_THEME="mh"

plugins=(
	osx
	zsh-syntax-highlighting
	ssh-agent
)




alias slog="display_sugar_log"
alias log="display_php_error_log"
alias rep6="php /Users/fref/www/tools/boostrap.php repair"
alias rep7="php /usr/local/share/sugarcrm-console/bin/sugarcrm repair:all"
alias cc="php /usr/local/share/sugarcrm-console/bin/sugarcrm cache:clear"
alias z="mate ~/.zshrc"

alias start_mysql="mysql.server start --skip-networking --skip-grant-tables"
alias stop_mysql="mysql.server stop"

alias n="nnn -di"
alias se="/Users/fref/Downloads/elasticsearch-6.2.4/bin/elasticsearch";

alias remy="stop_mysql;start_mysql"
alias s="source ~/.zshrc"
alias f="ofd"

function display_sugar_log {
	tail -f -n20 "sugarcrm.log"
}
function display_php_error_log {
	LOG_PATH="/Users/fref/http_data/logs"
	CURR=$(echo $(pwd) | awk -F"/" '{print $5}')
	tail -f -n20 $LOG_PATH'/'$CURR'_error.log'
}

h=()
if [[ -r ~/.ssh/config ]]; then
  h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi
if [[ -r ~/.ssh/known_hosts ]]; then
  h=($h ${${${(f)"$(cat ~/.ssh/known_hosts{,2} || true)"}%%\ *}%%,*}) 2>/dev/null
fi
if [[ $#h -gt 0 ]]; then
  zstyle ':completion:*:ssh:*' hosts $h
  zstyle ':completion:*:scp:*' hosts $h
fi


# SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'



path+=('/usr/local/sbin')
path+=('/usr/local/mysql/bin')
path+=('/Users/fref/Dropbox/work/bin')
path+=('/usr/local/mysql/support-files')
path+=('$HOME/.composer/vendor/bin')
path+=('/usr/local/share/sugarcrm-console/bin')

export PATH


autoload -Uz compinit && compinit

source /usr/local/share/zsh/site-functions
source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

zstyle :omz:plugins:ssh-agent agent-forwarding on


# Promt
P=$'[\e[1;32m%~\e[0m]'

PROMPT=$P'$(git_prompt_info)
$ ' 

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[gray]%}(%{$fg_no_bold[yellow]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[gray]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY=""


export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'








