
### OMZ ###


# Path to your oh-my-zsh configuration.
export ZSH_HOME=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="neo"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH_HOME/oh-my-zsh.sh

# XDG settings
export XDG_CACHE_HOME=~/.cache
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=$HOME/.local/share

# Commonly-used dir shortcuts
export BINARIES=~/bin
#export MC=$HOME/.minecraft

# Environmental variables
export EDITOR=vim
export PATH=$PATH:$BINARIES:$TLN
export PYTHONPATH=$TLN/..:~/dev:$PYTHONPATH

alias cd1='cd $D_PDR && ls'
alias cd2='cd $DL && ls -tr'

#alias ls='ls++ -al'
#alias lsp='ls++ --potsf'

alias gp='git push'
alias ga='git add'
alias gc='git commit'
alias sta='git status'

alias wim='vim -p'
alias vim='wim'

alias ..='cd ..'
alias mkdir='mkdir -p -v'
alias cp='cp -rf'

alias grep='grep --color=auto'

alias more='less'

alias spck="aspell -t -c"

TZ='America/New_York'; export TZ
HISTFILE=~/.zshhistory
HISTSIZE=5000
SAVEHIST=1000000
setopt extended_history
setopt share_history
function history_all { history -E 1 }

setopt notify globdots pushdtohome cdablevars autolist
setopt autocd recexact longlistjobs
setopt autoresume pushdsilent
setopt autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash
autoload -U compinit
compinit

# smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# tabcomplete to files as well
compdef _files mkdir

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path $XDG_CACHE_HOME/zsh_$HOST
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:processes' command 'ps -axw'
zstyle ':completion:*:processes-names' command 'ps -awxho command'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*' hosts $(awk '/^[^#]/ {print $2 $3" "$4" "$5}' /etc/hosts | grep -v ip6- && grep "^#%" /etc/hosts | awk -F% '{print $2}')
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:scp:*' tag-order \
zstyle ':completion:*:scp:*' group-order \
zstyle ':completion:*:ssh:*' tag-order \
zstyle ':completion:*:ssh:*' group-order \

bindkey -v
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word
bindkey "\e[8~" end-of-line            # For rxvt
bindkey "\e[7~" beginning-of-line      # For rxvt
bindkey '^i' expand-or-complete-prefix # Completion in the middle of a line
bindkey '^z' undo                      # C-x-u is overkill
bindkey '^w' kill-word
bindkey '^b' backward-kill-word
bindkey ' ' magic-space                # Do history expansion on space
