#
# ZSH-specific settings (should be last)
#

### Load colors
colrs=$(tput colors)
if [[ $colrs -gt 7 ]] ; then
    autoload colors
	colors
fi

# Color
BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
LIGHTYELLOW='\e[0;33m'
WHITE='\e[1;37m'
NC='\e[0m'              # No Color

export WORDCHARS='*?_.&\!#\$%^'
export CORRECT_IGNORE='_*'
export ZLE_SPACE_SUFFIX_CHARS='&|'

### Add colors to tab completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

### Make tab completion more verbose
zstyle ':completion:*' verbose yes

zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:rm:*' ignore-line yes

if [ -f $HOME/.zsh/zsh_compl ] ; then
    source $HOME/.zsh/zsh_compl
fi

### No duplicate entries for the following
typeset -U path cdpath pfath manpath

### emacs key binding
bindkey -e

### vi insert key binding
#bindkey -M viins "${terminfo[kcuu1]}" up-line-or-history; bindkey -M viins "${terminfo[kcud1]}" down-line-or-history
### Simpler approach
#bindkey -v

### setopts
setopt dvorak
setopt extended_glob
setopt complete_in_word         # Not just at the end
setopt always_to_end            # When complete from middle, move cursor
setopt correct                  # Spelling correction
setopt interactive_comments     # Escape commands so I can use them later
setopt print_exit_value         # Alert me if something has failed
setopt extended_history
#for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS

### Set the prompt
colrs=$(tput colors)
if [ $colrs -gt 255 ] ; then
    if [ -x /usr/bin/git ] ; then
        source $HOME/.zsh/zsh_prompt256_git
    else
        source $HOME/.zsh/zsh_prompt256
elif [ $colrs -gt 7 ] ; then
    source $HOME/.zsh/zsh_prompt88
else
    source $HOME/.zsh/zsh_prompt
fi

### exports
export HISTSIZE=10000
export HISTFILE=~/.zsh_history
export SAVEHIST=10000
#export TERM=screen-256color

zle -N my-complete-word
bindkey '^I' my-complete-word

### Aliases
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'

### Import ZSH-specific functions
source $HOME/.zsh/zsh_functions

### Import stuff common to all shells
source ~/.commonenv

### Import other settings
#source ~/.zsh/ssh-aliases
