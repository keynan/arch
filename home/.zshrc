# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
unsetopt autocd beep notify
setopt noautomenu
setopt nomenucomplete

bindkey -e
bindkey ";5D" backward-word
bindkey ";5C" forward-word
bindkey "\e[3~" delete-char
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/kpratt/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# <PROMPT>
autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}
$ "
export PROMPT_COMMAND=__prompt_command  # Func to gen PS1 after CMDs

function __prompt_command() {
    # This needs to be first
    local EXIT="$?"

    #path is in a git repo (almost always)
    local IMPORTANT_PATH=$(pwd)
    local GITBRANCH="$(git config user.email)     $(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null || git rev-parse --abbrev-ref HEAD 2>/dev/null)"

    #path is relative to HOME?
    if [[ IMPORTANT_PATH/ = "$HOME"/* ]]; then IMPORTANT_PATH=\~${$IMPORTANT_PATH#$HOME}; fi

    # context
    local PS1L=$IMPORTANT_PATH;
    local PS1C=$GITBRANCH;
    local PS1R=`date`;

    # calc offsets
    local SPACE="$(($COLUMNS-${#PS1C}-${#PS1L}-${#PS1R}))"
    local CENTER_OFFSET="$(($SPACE / 2))"
    local RIGHT_OFFSET="$(($SPACE / 2))"

    local CMD_OUTCOME_COLOR=green
    if [[ ! $EXIT -eq 0  ]]; then
	CMD_OUTCOME_COLOR=red
    fi

    TODO=""
    if [[ $((RANDOM % 25)) -eq 0 ]]; then
	TODO="
===== TODO =====
`cat ~/.todo`
================

"
    fi
    #Red, Blue, Green, Cyan, Yellow, Magenta, Black & White
    PS1="
%{$fg[red]%}$PS1L%{$reset_color%}`whitespace $CENTER_OFFSET`%{$fg[blue]%}$PS1C%{$reset_color%}`whitespace $RIGHT_OFFSET`%{$fg[yellow]%}$PS1R%{$reset_color%}
$TODO%{$fg[$CMD_OUTCOME_COLOR]%}$%{$reset_color%}"
}

# </PROMPT>

function precmd() {
     __prompt_command
}
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
if [ -e /home/kpratt/.nix-profile/etc/profile.d/nix.sh ]; then . /home/kpratt/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

alias grep="grep --color"
alias ls="ls --color"

[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec
