echo 'executing' $(basename $BASH_SOURCE)

# shell utils
function aalias {
    # add alias to session and .bashrc simultaneously
    alias "$@"
    printf 'alias %q\n' "$@" >> ~/.bash_aliases
}


#python
## ipython
function nbslides {
    # convert notebook to slides
    jupyter nbconvert "$@" --to slides --post serve
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
