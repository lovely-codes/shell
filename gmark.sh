#!/bin/sh

# mark
export MARKPATH=$HOME/.marks
export MARKDEFAULT=sanguo#设置你的默认书签，可以直接输入g跳转
export MARKPREFIX=MARK_

function g {
    local m=$1
    if [ "$m" = "" ]; then m=$MARKDEFAULT; fi
    cd -P "$MARKPATH/${MARKPREFIX}$m" 2>/dev/null || echo "No such mark: $m"
}

function mark {
    mkdir -p "$MARKPATH"
    local m=$1
    if [ "$m" = "" ]; then m=$MARKDEFAULT; fi
    rm -f "$MARKPATH/$m"
    ln -s "$(pwd)" "$MARKPATH/${MARKPREFIX}$m"
}

function unmark {
    local m=$1
    if [ "$m" = "" ]; then m=$MARKDEFAULT; fi
    rm -i "$MARKPATH/${MARKPREFIX}$m"
}

function gs {
		ls -alth . | grep MARK | awk -F 'MARK_' '{print $2}'
}

function lastvim(){
	if [ -f ${HOME}/.vim/lastvimfile ]
	then
		read path file < ${HOME}/.vim/lastvimfile
		cd $path && vim $file
	fi
}


_completemarks() {
    local curw=${COMP_WORDS[COMP_CWORD]}
    local wordlist=$(ls -l "$MARKPATH" | grep ^l | cut -d ' ' -f 13)
    COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
    return 0
}

complete -F _completemarks g unmark

