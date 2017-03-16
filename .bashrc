# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


## USER BEGINS HERE ##

echo 'executing' $(basename $BASH_SOURCE)

iscauchy() {
    if [ "$HOSTNAME" = "CAUCHY" ]; then
	echo 1
    else
	echo 0
    fi;
}

function iseuclid {
    if [ "$HOSTNAME" = "euclid" ]; then
	echo 1
    else
	echo 0
    fi;
}

if [ "$(iscauchy)" -eq 1 ]; then
    echo welcome CAUCHY
elif [ "$(iseuclid)" -eq 1 ]; then
    echo "welcome euclid"	
fi;

## USER ENDS HERE ##


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# git
if [ $OSTYPE == darwin16 ]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
    fi
fi

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt


## USER STARTS HERE ##

if [ -d ~/bin ]; then export PATH=~/bin:$PATH; fi

alias mdtparse='python3 -m mdtpars'

# added by Anaconda3 4.0.0 installer
if [ "$(iscauchy)" -eq 1 ]; then
    export PATH="/home/dante_gates/anaconda3/bin:$PATH"
fi;

# PYTHON
if [ "$(iscauchy)" -eq 1 ]; then
    export PYTHONPATH
fi;

export PIP_REQUIRE_VIRTUALENV=true

# ipython
function nbslides {
    # convert notebook to slides
    jupyter nbconvert "$@" --to slides --post serve
}


# emacs
alias em='emacs'

# shell utils
function aalias {
    # add alias to session and .bashrc simultaneously
    alias "$@"
    printf 'alias %q\n' "$@" >> ~/.bash_aliases
}


# git
function git-coa {
    # check out file from git history as filename
    usage="Usage:\n\tgit-coa <branch> <file> <destination>\n"
    case $1 in
	-h)
	    echo -e $usage;
	    return 0;
	    ;;
    esac
    git show $1:$2 > $3
}

function git-merge-local {
    # merge two local files
    usage="Usage:\n\tgit-merge-local <f1> <f2>\n\tMerges f2 into f1"
    case $1 in
	-h)
	    echo -e $usage;
	    return 0;
	    ;;
    esac
    touch git-merge-tmp
    git merge-file $1 $2 git-merge-tmp
    rm git-merge-tmp
}
