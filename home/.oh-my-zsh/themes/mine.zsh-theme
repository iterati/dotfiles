#!/usr/bin/env zsh
PR_BAR='─'
PR_UL='┌'
PR_LL='└'
PR_UR='┐'
PR_LR='┘'

setopt promptsubst
autoload -U add-zsh-hook

function get_host {
    if [[ ${(%):-%m} == 'developer-machine' ]]; then
        echo 'devbox'
    else
        echo ${(%):-%m}
    fi
}

function get_user {
    if [[ ${(%):-%n} == 'developer' ]]; then
        echo 'dev'
    else
        echo ${(%):-%n}
    fi
}

function get_pwd_len {
    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))
    local top='--('$(get_user)'@'$(get_host)':)'$(git_prompt_info)'--'
    local toplen=${#${top}}
    local pwdlen=${#${(%):-%~}}
    local total
    (( total = $toplen + $pwdlen ))
    if [[ $total -gt $TERMWIDTH ]]; then
        echo (( $TERMWIDTH - $total ))
    else
        echo $pwdlen
    fi
}

function get_fill {
    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))
    local top='--('$(get_user)'@'$(get_host)':)'$(git_prompt_info)'--'
    local toplen=${#${(S%%)top//(\%[F1]\{*\})}}
    local pwdlen=${#${(%):-%~}}
    local total
    (( total = $toplen + $pwdlen ))
    if [[ $total -lt $TERMWIDTH ]]; then
        echo ${(l.(( $TERMWIDTH - $total ))..─.)}
    fi
}

function get_top {
    ZSH_THEME_GIT_PROMPT_SUFFIX=$(git_prompt_status)%F{037}"]"
    local pwd=${(%):-%$(get_pwd_len)<..<%~}

    local top=%F{33}$PR_UL$PR_BAR
    top=$top%F{37}"("%F{136}$(get_user)%F{125}"@"%F{136}$(get_host)%F{125}":"%F{136}$pwd
    top=$top%F{37}")"%F{33}$(get_fill)
    top=$top$(git_prompt_info)
    top=$top%F{33}$PR_BAR$PR_UR

    echo $top
}

function get_bottom {
    local bottom=%F{33}$PR_LL$PR_BAR$MYVIRTENV%F{61}">> "%F{254}
    echo $bottom
}

MYVIRTENV="%F{61}>"

ZSH_THEME_GIT_PROMPT_PREFIX=%F{037}"["%F{254}
ZSH_THEME_GIT_PROMPT_SUFFIX=$(git_prompt_status)%F{037}"]"
ZSH_THEME_GIT_PROMPT_DIRTY=%F{160}"✘"
ZSH_THEME_GIT_PROMPT_CLEAN=%F{064}"✔"
ZSH_THEME_GIT_PROMPT_ADDED=%F{082}"✚"
ZSH_THEME_GIT_PROMPT_MODIFIED=%F{166}"✹"
ZSH_THEME_GIT_PROMPT_DELETED=%F{160}"✖"
ZSH_THEME_GIT_PROMPT_RENAMED=%F{220}"➜"
ZSH_THEME_GIT_PROMPT_UNMERGED=%F{082}"═"
ZSH_THEME_GIT_PROMPT_UNTRACKED=%F{190}"✭"

PS1='$(get_top)
$(get_bottom)'

RPS1=%F{61}'<<<'%F{33}$PR_BAR$PR_LR%F{245}
