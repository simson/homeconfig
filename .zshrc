[[ $- != *i* ]] && return
[[ $TERM != screen* ]] && exec ~/bin/choose_tmux.sh

autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:mv:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                           /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
autoload -U bashcompinit
bashcompinit

autoload -U promptinit
promptinit
prompt adam2

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache

zmodload zsh/complist
setopt extendedglob
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

# Les alias marchent comme sous bash
alias ls='ls --color=auto'
alias ll='ls --color=auto -lah'
alias lll='ls --color=auto -lah | less'

alias grep='grep --color=auto'
setopt autocd
export EDITOR=/usr/bin/vim

bindkey -v

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' ${terminfo[smkx]}
    }
    function zle-line-finish () {
        printf '%s' ${terminfo[rmkx]}
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi


bindkey '^R' history-incremental-search-backward # ctrl-r
bindkey '^t' expand-or-complete-prefix
bindkey "^[[5~" history-beginning-search-backward # PgUp for history search
bindkey '^[[6~' history-beginning-search-forward # PgDown for history search



function canonpath ()
{
    echo $(cd $(dirname $1); pwd -P)/$(basename $1)
}

pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        echo PATH="${PATH:+"$PATH:"}$(canonpath $1)" >> ~/.path
        PATH="${PATH:+"$PATH:"}$(canonpath $1)"
    fi
}

ldpathadd() {
    if [ -d "$1" ] && [[ ":$LD_LIBRARY_PATH:" != *":$1:"* ]]; then
        echo LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+"$LD_LIBRARY_PATH:"}$(canonpath $1)" >> ~/.path
        LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+"$LD_LIBRARY_PATH:"}$(canonpath $1)"
    fi
}

c_inc_pathadd() {
    if [ -d "$1" ] && [[ ":$C_INCLUDE_PATH:" != *":$1:"* ]]; then
        echo C_INCLUDE_PATH="${C_INCLUDE_PATH:+"$C_INCLUDE_PATH:"}$(canonpath $1)" >> ~/.path
        C_INCLUDE_PATH="${C_INCLUDE_PATH:+"$C_INCLUDE_PATH:"}$(canonpath $1)"
    fi
}

cpp_inc_pathadd() {
    if [ -d "$1" ] && [[ ":$CPLUS_INCLUDE_PATH:" != *":$1:"* ]]; then
        echo CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH:+"$CPLUS_INCLUDE_PATH:"}$(canonpath $1)" >> ~/.path
        CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH:+"$CPLUS_INCLUDE_PATH:"}$(canonpath $1)"
    fi
}

source ~/.alias
source ~/.path
