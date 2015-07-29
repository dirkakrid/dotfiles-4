function smack {
    ps aux |grep ${@} |grep -v grep |awk '{print $2}' | sudo xargs kill -9
}

function free {
    vm_stat | perl -ne '/page size of (\d+)/ and $size=$1; /Pages\s+([^:]+)[^\d]+(\d+)/ and printf("%-16s % 16.2f Mi\n", "$1:", $2 * $size / 1048576);'
}

function ccat {
    pygmentize -g ${0}
}

function randir {
  ls | ruby -e 'puts STDIN.readlines.shuffle.first'
}

# Find in file
function fif {
    echo "Searching For: ${1}"
    find . -type f -exec grep -Hn --color $1 {} \;| sed "s/^\([^:]*\):\([^:]*\)\(.*\)$/$(printf $SPLG_PURPLE)\1$(printf $CLEAR):$(printf $SPLG_GREEN)\2$(printf $CLEAR)$(printf $SPLG_LBLUE)\3$(printf $CLEAR)/"
}
