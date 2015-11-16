# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
[ -e $HOME/.pythonbrew/etc/bashrc ] && source $HOME/.pythonbrew/etc/bashrc
alias windows='rdesktop -a16 -K -g 1750x1100 -d WINDOWS -u tmullen systsny1.windows.tower-research.com'
#alias dev='source ~/portal/bin/activate && cd ~/portal/towerportal'
alias z='pythonbrew venv use towerportal > /dev/null && cd /spare/local/projects/towerportal'
alias rs='./manage.py runserver 0.0.0.0:8000'
alias pms='./manage.py shell_plus --bpython'
#alias rs='dev && ./manage.py runserver'
#alias pms='dev && ./manage.py shell_plus --bpython'
alias sysadm='pythonbrew venv use sysadm > /dev/null && cd /spare/local/etc/local/nagios/sysadm/'
alias sysdev='ssh sysdev@sysdev1.newark -t "cd /spare/local/sysdev/portal; source ./bin/activate; cd towerportal; exec \$SHELL -l"'
alias ..="cd .."
function ff  {
 find . -iname "*$1*"
}
function fff {
 find . -iname "$1"
}

alias gg='git grep'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias gu='echo Local commits that are not in the remote yet:; echo; git log @{u}..'
function parse_git_branch {
# git rev-parse --abbrev-ref HEAD
git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}
function proml {
local BLACK="\[\033[0;30m\]"
local LIGHT_GRAY="\[\033[0;37m\]"
local DEFAULT="\[\033[0m\]"
PS1="\W$LIGHT_GRAY (\$(parse_git_branch) )$DEFAULT * "
}
proml
setxkbmap -option ctrl:nocaps

LESS=-RFX

LS_COLORS='di=31;4'
export LS_COLORS
