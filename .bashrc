echo 'executing' $(basename $BASH_SOURCE)

# shell utils
function aalias {  # add alias to session and .bashrc simultaneously
    alias "$@"
    printf 'alias %q\n' "$@" >> ~/.bash_aliases
}


#python

## ipython
function nbslides {  # convert notebook to slides
    jupyter nbconvert "$@" --to slides --post serve
}

