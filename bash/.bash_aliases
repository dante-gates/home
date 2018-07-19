echo 'executing' $(basename $BASH_SOURCE)

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

. ~/.alias_completion.sh