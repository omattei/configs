#!/bin/zsh
# ~/dev/zsh/aliases.zsh
# ZSH aliases and export variables

# File hierarchy...
export DATA=/data
export D_CODE=$DATA/Code
export D_WEB=$D_WWW
export D_MEDIA=$DATA/Media
export D_GAMES=$DATA/Games
export D_MUSIC=$D_MEDIA/Music
export D_DOC=$DATA/Documents
export D_DBOX=$D_DOC/Dropbox

export D_DL=$D_DOC/Downloads
export D_FL=/media/fl

export D_DROID=$DATA/Droid
export D_DROIDROOT=$DATA/Droid/sdcard0

export D_UVA=$D_DBOX/UVA
export D_CS=$D_UVA/CS
export D_APMA=$D_UVA/APMA
export D_STS=$D_UVA/STS

export D_CSEM=$D_CS/2190
export D_COMPARCH=$D_CS/3330
export D_ALGO=$D_CS/4102
export D_DADA=$D_CS/4630
export D_TANDP=$D_CS/2760

export D_LINEAR=$D_APMA/3080
# XDG settings
export XDG_CACHE_HOME=~/.cache
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=$HOME/.local/share

# Commonly-used dir shortcuts
export BINARIES=~/bin
#export MC=$HOME/.minecraft
export MC=$D_GAMES/Minecraft
export CODE=$D_CODE
export DL=$D_DL
export DEV_DIR=$HOME/dev

# Environmental variables
export EDITOR=vim
export PATH=$(ruby -e 'print Gem.user_dir')/bin:$PATH:$BINARIES
export PYTHONPATH=~/dev:$PYTHONPATH


### ALIASES ###
alias cd1="cd ${D_UVA} && ls"
alias cd2='cd $DL && ls -tr'

alias aud0='sed -si "s/.card [1,2,3]/.card 0/g" ~/.asoundrc'
alias aud1='sed -si "s/.card [0,2,3]/.card 1/g" ~/.asoundrc'
alias aud2='sed -si "s/.card [0,1,3]/.card 2/g" ~/.asoundrc'
alias aud3='sed -si "s/.card [0,1,2]/.card 3/g" ~/.asoundrc'
alias ls='ls++ -al'
alias urxvt='urxvt -name mongolia'
alias gp='git push'
alias ga='git add'
alias gc='git commit'
alias sta='git status'
alias gs='sta'
alias wim='vim -p'
alias vim='wim'

alias dps='docker ps -a'
alias dex='docker exec -it api /bin/bash'
alias dsql='docker exec -it mysql-cmdline /bin/bash'


alias inc="chromium --incognito"

bones(){
  sleep 3s
  xdotool mousedown 3
}

extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
        *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
               c='bsdtar xvf';;
        *.7z)  c='7z x';;
        *.Z)   c='uncompress';;
        *.bz2) c='bunzip2';;
        *.exe) c='cabextract';;
        *.gz)  c='gunzip';;
        *.rar) c='unrar x';;
        *.xz)  c='unxz';;
        *.zip) c='unzip';;
        *)     echo "$0: unrecognized file extension: \`$i'" >&2
               continue;;
        esac

        command $c "$i"
        e=$?
    done

    return $e
}

alias ..='cd ..'
alias mkdir='mkdir -p -v'
alias cp='cp -rf'
#alias grep='grep --color=auto'
alias grep="/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

alias more='less'

alias spck="aspell -t -c"

