echo 'executing' $(basename $BASH_SOURCE)

# system
alias cl='clear'

# git
alias gs='clear && git status'
alias gitshort='git status --short'
alias gco='git checkout'
alias gmm='git checkout master && git merge '
alias gpo='git push origin '
alias gdc='git diff --cached -w'
alias gb='git branch'

# python
alias ipy=ipython
alias ipython='ipython --profile=dgates'
alias nb='jupyter notebook'
alias nbconvert='jupyter nbconvert'

# emacs
alias emacs='emacs -nw --load "~/home/.emacs"'
alias em='emacs'

# machine specific
if [ "$(isdca)" -eq 1 ]; then
    echo 'executing' $(basename $BASH_SOURCE) 'for NJ-1TKKFZ1-DCAL'
    alias chase='cd C:/users/dgates/documents/commercial/chase-list-commercial-db'
    alias pa='cd C:/users/dgates/documents/predictive_modeling/riskview-pa-svcs'
    alias ca='cd C:/users/dgates/documents/commercial/commercial-analytics'
    alias ftf='cd C:/users/dgates/documents/commercial/ftf/ftf_calculation'
    alias rvc='cd C:/users/dgates/documents/riskview-commercial-db'
    alias tutorials='cd C:/users/dgates/documents/predictive_modeling/tutorials'
    alias code='cd C:/users/dgates/documents/code'
    alias pyinstallation='cd C:/WinPython-64bit-3.4.3.5/python-3.4.3.amd64/Lib/site-packages'

    alias pag1='ssh dgates@10.229.0.29'
    alias pag2='ssh dgates@10.229.0.31'
fi


if [ "$(iscauchy)" -eq 1 ]; then
   echo 'executing' $(basename $BASH_SOURCE) 'for CAUCHY'
   alias downloads='cd /home/dante_gates/downloads'
   alias knopp='cd /home/dante_gates/rsch/KNOPP'
   alias code='cd /home/dante_gates/code'

   alias cmake='clear; make'
   alias subl='gksu sublime'
fi;


if [ "$(iseuclid)" -eq 1 ]; then
   echo 'executing' $BASH_SOURCE 'for EUCLID'
   alias pa='cd ~/riskview-pa-svcs'
   alias bk='cd ~/pa-analytics-api/api_ext/pa-benchmarking  && source ~/venvs/bkenv/bin/activate'
   alias api='cd ~/pa-analytics-api && source ~/venvs/apienv/bin/activate'
   alias virtualenv='virtualenv -p /usr/bin/python3.5'
fi;