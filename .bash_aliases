echo 'executing' $(basename $BASH_SOURCE)

# system
alias cl='clear'
# colorless grep for piping into programs that don't like the escape chars
alias ggrep='grep --color=None'

# git
alias gs='clear && git status'
alias gitshort='git status --short'
alias gpo='git push origin '
alias gdc='git diff --cached -w'
alias gb='git branch'
alias gd='git diff'
alias ga='git add'
alias gc='git checkout'
alias gm='git merge'
alias gco='git commit'
alias gp='git push'

# python
alias ipy='ipython --profile=dgates'
alias ipy2='ipython2.7'
alias nb='jupyter notebook'
alias nb2='jupyter2.7 notebook'
alias nbconvert='jupyter nbconvert'
alias activate='source venv/bin/activate'

# emacs
alias emacs='emacs -nw --load "~/home/.emacs"'
alias em='emacs'

# machine specific
if [ "$(iscauchy)" -eq 1 ]; then
   echo 'executing' $(basename $BASH_SOURCE) 'for CAUCHY'
   alias downloads='cd /ho
   me/dante_gates/downloads'
   alias knopp='cd /home/dante_gates/rsch/KNOPP'
   alias code='cd /home/dante_gates/code'

   alias cmake='clear; make'
   nalias subl='gksu sublime'
fi;


if [ "$(iseuclid)" -eq 1 ]; then
   echo 'executing' $BASH_SOURCE 'for EUCLID'
   alias pa='cd ~/riskview-pa-svcs'
   alias bk='cd ~/pa-analytics-api/api_ext/pa-benchmarking  && source ~/venvs/bkenv/bin/activate'
   alias api='cd ~/pa-analytics-api && source ~/venvs/apienv/bin/activate'
   alias virtualenv='virtualenv -p /usr/bin/python3.5'
fi;

alias qv04=qvbizlogic04.cloudapp.net
alias qv07=qvbizlogic07.cloudapp.net

. ~/.alias_completion.sh